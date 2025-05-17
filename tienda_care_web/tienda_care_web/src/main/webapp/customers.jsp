<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Clientes</title>
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


<h1>👥 Registered customers</h1>

<div class="actions-top">
    <a href="formulario_cliente.jsp">➕ Create customer</a>
</div>

<table>
    <tr>
        <th>ID</th><th>Name</th><th>Email</th>
        <th>Phone</th><th>Address</th><th>Registration date</th><th>Actions</th>
    </tr>

    <%
        List<Map<String, Object>> customers = (List<Map<String, Object>>) request.getAttribute("customers");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (Map<String, Object> c : customers) {
    %>
    <tr>
        <td><%= c.get("id") %></td>
        <td><%= c.get("name") %></td>
        <td><%= c.get("email") %></td>
        <td><%= c.get("phone") %></td>
        <td><%= c.get("address") %></td>
        <td><%= sdf.format(c.get("registration_date")) %></td>
        <td>
            <a class="btn btn-edit" href="edit_customer.jsp?customer_id=<%= c.get("id") %>">Edit</a>
            <a class="btn btn-delete" href="customers?delete=<%= c.get("id") %>" onclick="return confirm('¿Eliminar cliente?')">Delete</a>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
