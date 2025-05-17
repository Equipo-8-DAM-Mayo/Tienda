<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Cliente</title>
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
