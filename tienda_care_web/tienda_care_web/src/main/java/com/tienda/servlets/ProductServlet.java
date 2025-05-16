package com.tienda.servlets;

import com.tienda.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {

            // 🔁 Eliminar producto si viene el parámetro ?delete
            String deleteParam = request.getParameter("delete");
            if (deleteParam != null && !deleteParam.isEmpty()) {
                int deleteId = Integer.parseInt(deleteParam);
                try (PreparedStatement deleteStmt = conn.prepareStatement(
                        "DELETE FROM products WHERE product_id = ?")) {
                    deleteStmt.setInt(1, deleteId);
                    deleteStmt.executeUpdate();
                }
                response.sendRedirect("products"); // Redirige tras eliminar
                return;
            }

            // 📋 Listar productos
            List<Map<String, Object>> products = new ArrayList<>();

            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM products")) {

                while (rs.next()) {
                    Map<String, Object> p = new HashMap<>();
                    p.put("product_id", rs.getInt("product_id"));
                    p.put("name", rs.getString("name"));
                    p.put("description", rs.getString("description"));
                    p.put("price", rs.getDouble("price"));
                    p.put("stock", rs.getInt("stock"));
                    p.put("category", rs.getString("category"));
                    products.add(p);
                }
            }

            request.setAttribute("products", products);
            request.getRequestDispatcher("/products.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error al acceder a productos", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try (Connection conn = DBConnection.getConnection()) {

            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stock");
            String category = request.getParameter("category");

            if (name == null || priceStr == null || stockStr == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan campos obligatorios.");
                return;
            }

            double price = Double.parseDouble(priceStr);
            int stock = Integer.parseInt(stockStr);

            try (PreparedStatement stmt = conn.prepareStatement(
                    "INSERT INTO products (name, description, price, stock, category) VALUES (?, ?, ?, ?, ?)")) {

                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setDouble(3, price);
                stmt.setInt(4, stock);
                stmt.setString(5, category);

                stmt.executeUpdate();
            }

            // 🔁 Redirige al listado tras insertar
            response.sendRedirect("products");

        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Error al crear producto", e);
        }
    }
}
