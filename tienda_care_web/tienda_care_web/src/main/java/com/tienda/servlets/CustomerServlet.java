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

        try {
            out.println("<p>⏳ Intentando conectar a la base de datos...</p>");

            Connection conn = DBConnection.getConnection();
            out.println("<p>✅ Conectado con éxito</p>");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM customers");

            boolean hasData = false;
            while (rs.next()) {
                hasData = true;
                out.println("<p><strong>" + rs.getString("name") + "</strong> - " + rs.getString("email") + "</p>");
            }

            if (!hasData) {
                out.println("<p><em>ℹ No hay clientes en la base de datos.</em></p>");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ Error detectado:</p>");
            out.println("<p style='color: blue;'>🧪 Esto es una nueva versión del servlet</p>");
            out.println("<pre>" + e.toString() + "</pre>");
        }

        out.println("</body></html>");
        out.close();
    }
}
