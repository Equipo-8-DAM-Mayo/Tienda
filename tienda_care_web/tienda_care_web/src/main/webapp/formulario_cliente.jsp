<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>Crear Cliente</title>
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

<h1>➕ Create new customer</h1>

<div class="form-container">
    <form method="post" action="customers">
        <label for="name">Name *</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email">

        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone">

        <label for="address">Address</label>
        <input type="text" id="address" name="address">

        <label for="registration_date">Registration date *</label>
        <input type="date" id="registration_date" name="registration_date" required>

        <div class="actions">
            <button type="submit" class="btn btn-save">Save customer</button>
            <a href="customers" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
