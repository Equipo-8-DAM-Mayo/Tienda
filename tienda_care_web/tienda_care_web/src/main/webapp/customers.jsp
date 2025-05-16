<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Clientes</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
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
<jsp:include page="includes/header.jspf" />


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
