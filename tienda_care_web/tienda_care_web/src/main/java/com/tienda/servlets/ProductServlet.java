package com.tienda.servlets;

import com.tienda.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (Connection conn = DBConnection.getConnection();
             PrintWriter out = response.getWriter()) {

            String deleteParam = request.getParameter("delete");

            if (deleteParam != null && !deleteParam.isEmpty()) {
                int deleteId = Integer.parseInt(deleteParam);
                try (PreparedStatement deleteStmt = conn.prepareStatement(
                        "DELETE FROM products WHERE product_id = ?")) {
                    deleteStmt.setInt(1, deleteId);
                    deleteStmt.executeUpdate();
                    out.println("<p style='color:green;'>🗑️ Producto con ID " + deleteId + " eliminado.</p>");
                }
            }

            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM products")) {

                out.println("<h1>Lista de productos</h1>");
                out.println("<table border='1'>");
                out.println("<tr><th>ID</th><th>Nombre</th><th>Descripción</th><th>Precio</th><th>Stock</th><th>Categoría</th><th>Acciones</th></tr>");
                while (rs.next()) {
                    int id = rs.getInt("product_id");
                    String name = rs.getString("name");
                    String desc = rs.getString("description");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    String category = rs.getString("category");

                    out.println("<tr>");
                    out.println("<td>" + id + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + desc + "</td>");
                    out.println("<td>" + price + " €</td>");
                    out.println("<td>" + stock + "</td>");
                    out.println("<td>" + category + "</td>");
                    out.println("<td><a href='products?delete=" + id + "'>Eliminar</a></td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }

        } catch (SQLException e) {
            throw new ServletException("Error al acceder a productos", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try (Connection conn = DBConnection.getConnection();
             PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stock");
            String category = request.getParameter("category");

            // Validación básica (puedes extenderla)
            if (name == null || priceStr == null || stockStr == null) {
                out.println("<p style='color:red;'>Faltan campos obligatorios.</p>");
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
                out.println("<p style='color:green;'>✅ Producto creado correctamente.</p>");
                out.println("<a href='products'>Volver al listado</a>");
            }

        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Error al crear producto", e);
        }
    }

}
