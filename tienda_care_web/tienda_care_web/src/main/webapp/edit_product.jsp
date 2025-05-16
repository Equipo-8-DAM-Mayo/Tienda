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
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Puedes reutilizar estilos del formulario anterior */
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
            background-color: #ffc107;
            color: black;
        }

        .btn-save:hover {
            background-color: #e0a800;
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

<h1>✏️ Editar producto</h1>

<div class="form-container">
    <form method="post" action="edit-product">
        <input type="hidden" name="product_id" value="<%= productId %>">

        <label for="name">Nombre *</label>
        <input type="text" id="name" name="name" required value="<%= name %>">

        <label for="description">Descripción</label>
        <input type="text" id="description" name="description" value="<%= description %>">

        <label for="price">Precio (€) *</label>
        <input type="number" id="price" name="price" step="0.01" required value="<%= price %>">

        <label for="stock">Stock *</label>
        <input type="number" id="stock" name="stock" required value="<%= stock %>">

        <label for="category">Categoría</label>
        <input type="text" id="category" name="category" value="<%= category %>">

        <div class="actions">
            <button type="submit" class="btn btn-save">Guardar cambios</button>
            <a href="products" class="btn btn-cancel">Cancelar</a>
        </div>
    </form>
</div>

</body>
</html>
