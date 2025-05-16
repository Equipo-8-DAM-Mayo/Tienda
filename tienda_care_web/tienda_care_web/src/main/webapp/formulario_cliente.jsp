<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Cliente</title>
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
        input[type="email"],
        input[type="tel"],
        input[type="date"] {
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
<jsp:include page="includes/header.jspf" />

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
