<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <style>
            /* Si no tienes css/style.css puedes usar esto directamente */
            body {
                font-family: 'Segoe UI', sans-serif;
                background: #f4f4f4;
                margin: 40px;
            }

            h1 {
                text-align: center;
            }

            .actions-top {
                display: flex;
                justify-content: end;
                margin-bottom: 20px;
            }

            .actions-top a {
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 8px;
                font-weight: bold;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
                box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .btn {
                padding: 6px 12px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
                cursor: pointer;
            }

            .btn-delete {
                background-color: #dc3545;
                color: white;
            }

            .btn-edit {
                background-color: #ffc107;
                color: black;
            }

            .btn-delete:hover {
                background-color: #c82333;
            }

            .btn-edit:hover {
                background-color: #e0a800;
            }
        </style>
</head>
<body>

<h1>📦 Productos en Tienda</h1>

<div class="actions-top">
    <a href="formulario_producto.jsp">➕ Crear producto</a>
</div>

<table>
    <tr>
        <th>ID</th><th>Nombre</th><th>Descripción</th>
        <th>Precio</th><th>Stock</th><th>Categoría</th><th>Acciones</th>
    </tr>

    <%
        List<Map<String, Object>> products = (List<Map<String, Object>>) request.getAttribute("products");
        DecimalFormat df = new DecimalFormat("0.00");

        for (Map<String, Object> p : products) {
    %>
    <tr>
        <td><%= p.get("product_id") %></td>
        <td><%= p.get("name") %></td>
        <td><%= p.get("description") %></td>
        <td><%= df.format(p.get("price")) %> €</td>
        <td><%= p.get("stock") %></td>
        <td><%= p.get("category") %></td>
        <td>
            <a class="btn btn-edit" href="edit_product.jsp?id=<%= p.get("product_id") %>">Editar</a>
            <a class="btn btn-delete" href="products?delete=<%= p.get("product_id") %>"
               onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?')">Eliminar</a>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
