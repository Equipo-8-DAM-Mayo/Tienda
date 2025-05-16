package com.tienda.servlets;

import com.tienda.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>Customer List</h2>");

        String deleteParam = request.getParameter("delete");

        try (Connection conn = DBConnection.getConnection()) {

            // Si hay parámetro delete, eliminamos primero las compras y luego el cliente
            if (deleteParam != null && !deleteParam.isEmpty()) {
                int deleteId = Integer.parseInt(deleteParam);

                // Eliminar primero las compras asociadas a ese cliente
                try (PreparedStatement deletePurchases = conn.prepareStatement(
                        "DELETE FROM purchases WHERE customer_id = ?")) {
                    deletePurchases.setInt(1, deleteId);
                    deletePurchases.executeUpdate();
                }

                // Ahora sí, eliminar el cliente
                try (PreparedStatement deleteCustomer = conn.prepareStatement(
                        "DELETE FROM customers WHERE customer_id = ?")) {
                    deleteCustomer.setInt(1, deleteId);
                    deleteCustomer.executeUpdate();
                    out.println("<p style='color:green;'>🗑️ Cliente con ID " + deleteId + " eliminado.</p>");
                }
            }


            // Mostramos listado actualizado
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM customers");

            boolean hasData = false;
            while (rs.next()) {
                hasData = true;
                int id = rs.getInt("customer_id");
                out.println("<p><strong>" + rs.getString("name") + "</strong> - " + rs.getString("email")
                        + " <a href='customers?delete=" + id + "' onclick=\"return confirm('¿Eliminar este cliente?');\">Eliminar</a></p>");
            }

            if (!hasData) {
                out.println("<p><em>ℹ No hay clientes en la base de datos.</em></p>");
            }

            rs.close();
            stmt.close();

        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ Error detectado:</p>");
            out.println("<pre>" + e.toString() + "</pre>");
        }

        out.println("</body></html>");
        out.close();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // Para permitir tildes y ñ

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO customers (name, email, phone, address) VALUES (?, ?, ?, ?)")) {

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.executeUpdate();

            // Redirigir de nuevo al listado tras insertar
            response.sendRedirect("customers");

        } catch (SQLException e) {
            throw new ServletException("Insert failed", e);
        }
    }
}

