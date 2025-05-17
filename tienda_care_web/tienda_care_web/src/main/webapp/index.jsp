<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CARE</title>

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


<!-- MAIN -->
<main class="container">

    <!-- Tops -->
    <section class="mb-5">
        <h2 class="text-center mb-4">Tops</h2>
        <div class="row justify-content-center g-4">
            <div class="col-md-6 col-lg-4 d-flex justify-content-center">
                <div class="product-card p-3 w-100 text-center" onclick="toggleCard(this)">
                    <div class="image-wrapper mb-3">
                        <img src="img/t-shirt blanca.jpg" alt="White T-shirt" class="product-image">
                    </div>
                    <h3 class="h5 text-primary">White T-shirt</h3>
                    <p>Classic cotton tee, breathable and soft.</p>
                    <div class="product-details">
                        <p><strong>Color:</strong> Blanco</p>
                        <p><strong>Tallas:</strong> S, M, L, XL</p>
                        <p><strong>Precio:</strong> 19.99 €</p>
                        <p><strong>Material:</strong> 100% algodón</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 d-flex justify-content-center">
                <div class="product-card p-3 w-100 text-center" onclick="toggleCard(this)">
                    <div class="image-wrapper mb-3">
                        <img src="img/chaqueta_burberry.jpg" alt="Denim Jacket" class="product-image">
                    </div>
                    <h3 class="h5 text-primary">Denim Jacket</h3>
                    <p>Stylish and warm for every occasion.</p>
                    <div class="product-details">
                        <p><strong>Color:</strong> Azul Burberry</p>
                        <p><strong>Tallas:</strong> M, L, XL</p>
                        <p><strong>Precio:</strong> 49.99 €</p>
                        <p><strong>Material:</strong> Mezcla de algodón y poliéster</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bottoms -->
    <section class="mb-5">
        <h2 class="text-center mb-4">Bottoms</h2>
        <div class="row justify-content-center g-4">
            <div class="col-md-6 col-lg-4 d-flex justify-content-center">
                <div class="product-card p-3 w-100 text-center" onclick="toggleCard(this)">
                    <div class="image-wrapper mb-3">
                        <img src="img/pantalones_negros.jpg" alt="Black Jeans" class="product-image">
                    </div>
                    <h3 class="h5 text-primary">Black Jeans</h3>
                    <p>Skinny fit with stretch for comfort.</p>
                    <div class="product-details">
                        <p><strong>Color:</strong> Negro</p>
                        <p><strong>Tallas:</strong> 36, 38, 40</p>
                        <p><strong>Precio:</strong> 34.90 €</p>
                        <p><strong>Composición:</strong> 98% algodón, 2% elastano</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 d-flex justify-content-center">
                <div class="product-card p-3 w-100 text-center" onclick="toggleCard(this)">
                    <div class="image-wrapper mb-3">
                        <img src="img/shorts.jpg" alt="Khaki Shorts" class="product-image">
                    </div>
                    <h3 class="h5 text-primary">Khaki Shorts</h3>
                    <p>Perfect for summer days.</p>
                    <div class="product-details">
                        <p><strong>Color:</strong> Caqui</p>
                        <p><strong>Tallas:</strong> S, M, L</p>
                        <p><strong>Precio:</strong> 24.99 €</p>
                        <p><strong>Material:</strong> Lino y algodón</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    &copy; 2025 Care. All rights reserved.
</footer>

<!-- SCRIPT -->
<script>
function toggleCard(card) {
    card.classList.toggle('expanded');
}
</script>

</body>
</html>
