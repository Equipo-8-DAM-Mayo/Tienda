package com.tienda.servlets;

import com.tienda.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/edit-customer")
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try (Connection conn = DBConnection.getConnection()) {

            int customerId = Integer.parseInt(request.getParameter("customer_id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String registrationDate = request.getParameter("registration_date");

            if (name == null || registrationDate == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan campos obligatorios.");
                return;
            }

            String sql = "UPDATE customers SET name = ?, email = ?, phone = ?, address = ?, registration_date = ? WHERE customer_id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, address);
                stmt.setDate(5, Date.valueOf(registrationDate)); // formato yyyy-MM-dd
                stmt.setInt(6, customerId);

                stmt.executeUpdate();
            }

            response.sendRedirect("customers");

        } catch (SQLException | IllegalArgumentException e) {
            throw new ServletException("Error al actualizar cliente", e);
        }
    }
}
