package com.tienda.servlets;

import com.tienda.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try (Connection conn = DBConnection.getConnection()) {

            int productId = Integer.parseInt(request.getParameter("product_id"));
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

            String sql = "UPDATE products SET name = ?, description = ?, price = ?, stock = ?, category = ? WHERE product_id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setDouble(3, price);
                stmt.setInt(4, stock);
                stmt.setString(5, category);
                stmt.setInt(6, productId);

                stmt.executeUpdate();
            }

            response.sendRedirect("products");

        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("Error al actualizar producto", e);
        }
    }
}
