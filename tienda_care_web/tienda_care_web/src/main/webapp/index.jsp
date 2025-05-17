<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CARE</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="img/logo.jpg" type="image/x-icon">
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

<!-- Tops -->
<section>
    <h2 class="section-title">Tops</h2>
    <div id="tops-list" class="product-grid">
        <div class="product-card" onclick="toggleCard(this)">
            <img src="img/t-shirt blanca.jpg" alt="White T-shirt" class="product-image">
            <h3>White T-shirt</h3>
            <p>Classic cotton tee, breathable and soft.</p>
            <div class="product-details">
                <p><strong>Color:</strong> Blanco</p>
                <p><strong>Tallas:</strong> S, M, L, XL</p>
                <p><strong>Precio:</strong> 19.99 €</p>
                <p><strong>Material:</strong> 100% algodón</p>
            </div>
        </div>

        <div class="product-card" onclick="toggleCard(this)">
            <img src="img/chaqueta_burberry.jpg" alt="Denim Jacket" class="product-image">
            <h3>Denim Jacket</h3>
            <p>Stylish and warm for every occasion.</p>
            <div class="product-details">
                <p><strong>Color:</strong> Azul Burberry</p>
                <p><strong>Tallas:</strong> M, L, XL</p>
                <p><strong>Precio:</strong> 49.99 €</p>
                <p><strong>Material:</strong> Mezcla de algodón y poliéster</p>
            </div>
        </div>
    </div>
</section>

<!-- Bottoms -->
<section>
    <h2 class="section-title">Bottoms</h2>
    <div id="bottoms-list" class="product-grid">
        <div class="product-card" onclick="toggleCard(this)">
            <img src="img/pantalones_negros.jpg" alt="Black Jeans" class="product-image">
            <h3>Black Jeans</h3>
            <p>Skinny fit with stretch for comfort.</p>
            <div class="product-details">
                <p><strong>Color:</strong> Negro</p>
                <p><strong>Tallas:</strong> 36, 38, 40</p>
                <p><strong>Precio:</strong> 34.90 €</p>
                <p><strong>Composición:</strong> 98% algodón, 2% elastano</p>
            </div>
        </div>

        <div class="product-card" onclick="toggleCard(this)">
            <img src="img/shorts.jpg" alt="Khaki Shorts" class="product-image">
            <h3>Khaki Shorts</h3>
            <p>Perfect for summer days.</p>
            <div class="product-details">
                <p><strong>Color:</strong> Caqui</p>
                <p><strong>Tallas:</strong> S, M, L</p>
                <p><strong>Precio:</strong> 24.99 €</p>
                <p><strong>Material:</strong> Lino y algodón</p>
            </div>
        </div>
    </div>
</section>

<footer>
    &copy; 2025 Care. All rights reserved.
</footer>

<script>
function toggleCard(card) {
    card.classList.toggle('expanded');
}
</script>
</body>
</html>