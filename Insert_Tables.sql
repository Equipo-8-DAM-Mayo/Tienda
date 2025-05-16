-- Insert customers
INSERT INTO customers (name, email, phone, address)
VALUES 
('Anna Perez', 'anna.perez@example.com', '600123456', '1 Main Street, Pamplona'),
('Luis Garcia', 'luis.garcia@example.com', '600654321', '5 Central Avenue, Tudela'),
('Martha Lopez', 'martha.lopez@example.com', '600112233', '10 Royal Street, Logroño');

-- Insert products
INSERT INTO products (name, description, price, stock, category)
VALUES
('Basic White T-Shirt', '100% cotton white t-shirt', 9.99, 50, 'T-Shirts'),
('Slim Fit Jeans', 'Slim fit blue denim jeans', 29.95, 30, 'Jeans'),
('Hoodie with Pockets', 'Cotton hoodie with front pocket and hood', 24.95, 20, 'Hoodies');

-- Insert purchases
INSERT INTO purchases (customer_id, product_id, quantity, purchase_date)
VALUES
(1, 1, 2, '2025-05-10'),  -- Anna buys 2 t-shirts
(1, 3, 1, '2025-05-10'),  -- Anna buys 1 hoodie
(2, 2, 1, '2025-05-11'),  -- Luis buys 1 pair of jeans
(3, 1, 1, '2025-05-12');  -- Martha buys 1 t-shirt
