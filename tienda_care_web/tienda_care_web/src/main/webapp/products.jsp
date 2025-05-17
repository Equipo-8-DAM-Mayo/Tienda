<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <img src="img/logo.png" alt="Care Logo" class="logo">
    <h1>Care</h1>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products">Products</a>
        <a href="customers">Customers</a>
    </nav>
</header>

<h1>📦 Products in Store</h1>

<div class="actions-top">
    <a href="formulario_producto.jsp">➕ Create product</a>
</div>

<table>
    <tr>
        <th>ID</th><th>Name</th><th>Descripción</th>
        <th>Price</th><th>Stock</th><th>Category</th><th>Actions</th>
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
            <a class="btn btn-edit" href="edit_product.jsp?product_id=<%= p.get("product_id") %>">Editar</a>
            <a class="btn btn-delete" href="products?delete=<%= p.get("product_id") %>"
               onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?')">Eliminar</a>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
