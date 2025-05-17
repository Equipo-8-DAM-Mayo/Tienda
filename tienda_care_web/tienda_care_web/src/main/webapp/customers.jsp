<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Clientes</title>

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS PERSONALIZADO -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="img/logo.jpg" type="image/x-icon">
</head>
<body>

<!-- HEADER -->
<header class="bg-light py-3 shadow-sm mb-4">
    <div class="container header-container">
        <img src="img/logo.png" alt="Care Logo" class="logo">
        <h1 class="h3 mb-0">Care</h1>
        <nav>
            <a href="index.jsp" class="text-decoration-none text-dark fw-semibold">Home</a>
            <a href="products" class="text-decoration-none text-dark fw-semibold">Products</a>
            <a href="customers" class="text-decoration-none text-dark fw-semibold">Customers</a>
        </nav>
    </div>
</header>

<main class="container">
    <h1 class="text-center mb-4">👥 Registered Customers</h1>

    <div class="d-flex justify-content-end mb-3">
        <a href="formulario_cliente.jsp" class="btn btn-success fw-bold">➕ Create customer</a>
    </div>

    <!-- Tabla para pantallas grandes -->
    <div class="d-none d-md-block table-responsive">
        <table class="table table-bordered table-striped table-hover align-middle">
            <thead class="table-primary text-center">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Registration Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, Object>> customers = (List<Map<String, Object>>) request.getAttribute("customers");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    for (Map<String, Object> c : customers) {
                %>
                <tr>
                    <td class="text-center"><%= c.get("id") %></td>
                    <td><%= c.get("name") %></td>
                    <td><%= c.get("email") %></td>
                    <td><%= c.get("phone") %></td>
                    <td><%= c.get("address") %></td>
                    <td class="text-center"><%= sdf.format(c.get("registration_date")) %></td>
                    <td class="text-center">
                        <a class="btn btn-warning btn-sm fw-bold me-2" href="edit_customer.jsp?customer_id=<%= c.get("id") %>">Editar</a>
                        <a class="btn btn-danger btn-sm fw-bold" href="customers?delete=<%= c.get("id") %>" onclick="return confirm('¿Eliminar cliente?')">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Tarjetas responsive para móviles -->
    <div class="d-block d-md-none">
        <div class="row">
            <%
                for (Map<String, Object> c : customers) {
            %>
            <div class="col-12 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-2"><%= c.get("name") %></h5>
                        <p class="mb-1"><strong>ID:</strong> <%= c.get("id") %></p>
                        <p class="mb-1"><strong>Email:</strong> <%= c.get("email") %></p>
                        <p class="mb-1"><strong>Phone:</strong> <%= c.get("phone") %></p>
                        <p class="mb-1"><strong>Address:</strong> <%= c.get("address") %></p>
                        <p class="mb-3"><strong>Registered:</strong> <%= sdf.format(c.get("registration_date")) %></p>
                        <div class="d-flex gap-2">
                            <a class="btn btn-warning btn-sm w-50 fw-bold" href="edit_customer.jsp?customer_id=<%= c.get("id") %>">Editar</a>
                            <a class="btn btn-danger btn-sm w-50 fw-bold" href="customers?delete=<%= c.get("id") %>" onclick="return confirm('¿Eliminar cliente?')">Eliminar</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

</main>

</body>
</html>
