<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.tienda.utils.DBConnection" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    String idParam = request.getParameter("product_id");
    int productId = -1;

    String name = "", description = "", category = "";
    double price = 0.0;
    int stock = 0;

    if (idParam != null && !idParam.isEmpty()) {
        productId = Integer.parseInt(idParam);

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products WHERE product_id = ?")) {

            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    name = rs.getString("name");
                    description = rs.getString("description");
                    price = rs.getDouble("price");
                    stock = rs.getInt("stock");
                    category = rs.getString("category");
                } else {
                    out.println("<p style='color:red;'>Producto no encontrado.</p>");
                    return;
                }
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            return;
        }
    } else {
        out.println("<p style='color:red;'>ID de producto no válido.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <title>Editar Producto</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

<h1>✏️ Edit product</h1>

<div class="form-container">
    <form method="post" action="edit-product">
        <input type="hidden" name="product_id" value="<%= productId %>">

        <label for="name">Name *</label>
        <input type="text" id="name" name="name" required value="<%= name %>">

        <label for="description">Description</label>
        <input type="text" id="description" name="description" value="<%= description %>">

        <label for="price">Price (€) *</label>
        <input type="number" id="price" name="price" step="0.01" required value="<%= price %>">

        <label for="stock">Stock *</label>
        <input type="number" id="stock" name="stock" required value="<%= stock %>">

        <label for="category">Category</label>
        <input type="text" id="category" name="category" value="<%= category %>">

        <div class="actions">
            <button type="submit" class="btn btn-save">Save changes</button>
            <a href="products" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
