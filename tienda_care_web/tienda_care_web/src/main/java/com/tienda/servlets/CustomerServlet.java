package com.tienda.servlets;

import com.tienda.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.util.*;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {

            // 🔁 Eliminar cliente si viene ?delete
            String deleteParam = request.getParameter("delete");
            if (deleteParam != null && !deleteParam.isEmpty()) {
                int deleteId = Integer.parseInt(deleteParam);

                // Primero eliminamos las compras asociadas
                try (PreparedStatement deletePurchases = conn.prepareStatement(
                        "DELETE FROM purchases WHERE customer_id = ?")) {
                    deletePurchases.setInt(1, deleteId);
                    deletePurchases.executeUpdate();
                }

                // Luego eliminamos el cliente
                try (PreparedStatement deleteCustomer = conn.prepareStatement(
                        "DELETE FROM customers WHERE customer_id = ?")) {
                    deleteCustomer.setInt(1, deleteId);
                    deleteCustomer.executeUpdate();
                }

                response.sendRedirect("customers");
                return;
            }

            // 📋 Listar clientes
            List<Map<String, Object>> customers = new ArrayList<>();

            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM customers")) {

                while (rs.next()) {
                    Map<String, Object> c = new HashMap<>();
                    c.put("id", rs.getInt("customer_id"));
                    c.put("name", rs.getString("name"));
                    c.put("email", rs.getString("email"));
                    c.put("phone", rs.getString("phone"));
                    c.put("address", rs.getString("address"));
                    c.put("registration_date", rs.getDate("registration_date"));
                    customers.add(c);
                }
            }

            request.setAttribute("customers", customers);
            request.getRequestDispatcher("/customers.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error al acceder a clientes", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try (Connection conn = DBConnection.getConnection()) {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String registrationDate = request.getParameter("registration_date");

            if (name == null || registrationDate == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan campos obligatorios.");
                return;
            }

            String sql = "INSERT INTO customers (name, email, phone, address, registration_date) VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, address);
                stmt.setDate(5, Date.valueOf(registrationDate)); // formato yyyy-MM-dd

                stmt.executeUpdate();
            }

            response.sendRedirect("customers");

        } catch (SQLException | IllegalArgumentException e) {
            throw new ServletException("Error al crear cliente", e);
        }
    }
}
