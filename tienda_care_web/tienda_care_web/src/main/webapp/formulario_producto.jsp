<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Producto</title>
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

<h1>➕ Create new product</h1>

<div class="form-container">
    <form method="post" action="products">
        <label for="name">Name *</label>
        <input type="text" id="name" name="name" required>

        <label for="description">Description</label>
        <input type="text" id="description" name="description">

        <label for="price">Price (€) *</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="stock">Stock *</label>
        <input type="number" id="stock" name="stock" required>

        <label for="category">Category</label>
        <input type="text" id="category" name="category">

        <div class="actions">
            <button type="submit" class="btn btn-save">Save changes</button>
            <a href="products" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
