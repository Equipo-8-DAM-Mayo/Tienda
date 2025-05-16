<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Producto</title>
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

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-save {
            background-color: #28a745;
            color: white;
        }

        .btn-save:hover {
            background-color: #218838;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<h1>➕ Crear nuevo producto</h1>

<div class="form-container">
    <form method="post" action="products">
        <label for="name">Nombre *</label>
        <input type="text" id="name" name="name" required>

        <label for="description">Descripción</label>
        <input type="text" id="description" name="description">

        <label for="price">Precio (€) *</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="stock">Stock *</label>
        <input type="number" id="stock" name="stock" required>

        <label for="category">Categoría</label>
        <input type="text" id="category" name="category">

        <div class="actions">
            <button type="submit" class="btn btn-save">Guardar producto</button>
            <a href="products" class="btn btn-cancel">Cancelar</a>
        </div>
    </form>
</div>

</body>
</html>
