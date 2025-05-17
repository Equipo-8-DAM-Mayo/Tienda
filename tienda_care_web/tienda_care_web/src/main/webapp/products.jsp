<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos</title>

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS PERSONALIZADO -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="img/logo.jpg" type="image/x-icon">
</head>
<body>

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
    <h1 class="text-center mb-4">📦 Products in Store</h1>

    <div class="d-flex justify-content-end mb-3">
        <a href="formulario_producto.jsp" class="btn btn-success fw-bold">➕ Create product</a>
    </div>

    <!-- Responsive para escritorio y tablet -->
    <div class="d-none d-md-block table-responsive">
        <table class="table table-bordered table-striped table-hover align-middle">
            <thead class="table-primary text-center">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Descripción</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, Object>> products = (List<Map<String, Object>>) request.getAttribute("products");
                    DecimalFormat df = new DecimalFormat("0.00");
                    for (Map<String, Object> p : products) {
                %>
                <tr>
                    <td class="text-center"><%= p.get("product_id") %></td>
                    <td><%= p.get("name") %></td>
                    <td><%= p.get("description") %></td>
                    <td><%= df.format(p.get("price")) %> €</td>
                    <td class="text-center"><%= p.get("stock") %></td>
                    <td><%= p.get("category") %></td>
                    <td class="text-center">
                        <a class="btn btn-warning btn-sm fw-bold me-2" href="edit_product.jsp?product_id=<%= p.get("product_id") %>">Editar</a>
                        <a class="btn btn-danger btn-sm fw-bold" href="products?delete=<%= p.get("product_id") %>"
                           onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?')">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Responsive para móviles -->
    <div class="d-block d-md-none">
        <div class="row">
            <%
                for (Map<String, Object> p : products) {
            %>
            <div class="col-12 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-2"><%= p.get("name") %></h5>
                        <p class="mb-1"><strong>ID:</strong> <%= p.get("product_id") %></p>
                        <p class="mb-1"><strong>Descripción:</strong> <%= p.get("description") %></p>
                        <p class="mb-1"><strong>Precio:</strong> <%= df.format(p.get("price")) %> €</p>
                        <p class="mb-1"><strong>Stock:</strong> <%= p.get("stock") %></p>
                        <p class="mb-3"><strong>Categoría:</strong> <%= p.get("category") %></p>
                        <div class="d-flex gap-2">
                            <a class="btn btn-warning btn-sm w-50 fw-bold" href="edit_product.jsp?product_id=<%= p.get("product_id") %>">Editar</a>
                            <a class="btn btn-danger btn-sm w-50 fw-bold" href="products?delete=<%= p.get("product_id") %>"
                               onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?')">Eliminar</a>
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
