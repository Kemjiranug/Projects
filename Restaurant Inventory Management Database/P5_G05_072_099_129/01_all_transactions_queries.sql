USE RestaurantInventoryDB;
GO


-- 1. Order Processing & Payment


-- Create Order
INSERT INTO Orders 
(order_id, order_date, order_status, order_type, total_price, queue_number, staff_id) 
VALUES ('ord26003', GETDATE(), 'Pending','Dine-in', 2000.55,'56', 10005);

-- Create Payment
INSERT INTO Payment 
(payment_id, payment_method, amount, payment_status, paid_at,order_id)
VALUES ('P26003', 'Cash', 2000.55, 'Paid', GETDATE(),'ord26003');

-- Update Order Status
UPDATE Orders
SET order_status = 'Completed'
WHERE order_id = 'ord26003';

-- View Orders
SELECT o.order_id, o.order_date, o.order_status, o.total_price
FROM Orders o
ORDER BY o.order_date DESC;

-- View Payment
SELECT p.payment_id, p.payment_method, p.amount, p.payment_status, p.paid_at
FROM Payment p
WHERE p.order_id = 'ord26003';




-- 2. Menu & Sales Analysis

-- Create Menu
INSERT INTO Menu 
(menu_id, menu_name, description, price, category, status)
VALUES ('mu0076', 'Pad Thai', 'Stir-fried rice noodles',120.00, 'Main Course', 'Available');

-- Add Menu to Order
INSERT INTO Order_Menu 
(order_id, menu_id, quantity, unit_price_at_time)
VALUES ('ord26003', 'mu0076', 3, 120.00);

-- Update Order Menu
UPDATE Order_Menu
SET quantity = 5, unit_price_at_time = 120.00
WHERE order_id = 'ord26003' AND menu_id = 'mu0076';

-- Delete Order Menu
DELETE FROM Order_Menu
WHERE order_id = 'ord26003' AND menu_id = 'mu0076';

-- Top Selling Menu
SELECT TOP 10
    m.menu_id,
    m.menu_name,
    m.category,
    SUM(om.quantity) AS total_quantity_sold
FROM Order_Menu om
JOIN Menu m ON om.menu_id = m.menu_id
GROUP BY m.menu_id, m.menu_name, m.category
ORDER BY total_quantity_sold DESC;

-- Order Detail
SELECT om.order_id, m.menu_name,
       om.quantity, om.unit_price_at_time
FROM Order_Menu om
JOIN Menu m ON om.menu_id = m.menu_id
WHERE om.order_id = 'ord26003';

-- Calculate Order Total
SELECT om.order_id,
       SUM(om.quantity * om.unit_price_at_time) AS total_price
FROM Order_Menu om
WHERE om.order_id = 'ord26003'
GROUP BY om.order_id;




-- 3. Inventory Management

-- Create Ingredient
INSERT INTO Ingredient 
(ingredient_id, ingredient_name, unit, price_per_unit, minimum_stock_level)
VALUES ('ing0126', 'Basil', 'kg', 50.00, 5);

-- Create Inventory
INSERT INTO Inventory 
(inventory_id, quantity_available, last_updated, ingredient_id)
VALUES ('inv0121', 3, GETDATE(), 'ing0126');

-- Purchase Order Detail
INSERT INTO Purchase_Order_Detail 
(purchase_detail_id, quantity, unit_cost, purchase_id, ingredient_id)
VALUES ('PD01751', 50, 50.00, 'PO0340', 'ing0126');

-- Update Inventory
UPDATE Inventory
SET quantity_available = quantity_available - 5,
    last_updated = GETDATE()
WHERE ingredient_id = 'ing0062';

-- Update Purchase Detail
UPDATE Purchase_Order_Detail
SET quantity = 60, unit_cost = 45.00
WHERE purchase_detail_id = 'PD01751';

-- Low Stock Detection
SELECT i.ingredient_id, i.ingredient_name,
       i.unit, i.minimum_stock_level,
       inv.quantity_available, inv.last_updated,
       CASE
           WHEN inv.quantity_available < i.minimum_stock_level THEN 'LOW'
           ELSE 'SUFFICIENT'
       END AS stock_status
FROM Inventory inv
JOIN Ingredient i ON inv.ingredient_id = i.ingredient_id
ORDER BY inv.quantity_available ASC;

-- Inventory Overview
SELECT i.ingredient_id, i.ingredient_name,
       i.unit, inv.quantity_available, inv.last_updated
FROM Inventory inv
JOIN Ingredient i ON inv.ingredient_id = i.ingredient_id
ORDER BY inv.quantity_available ASC;

-- Recent Inventory Updates
SELECT inv.inventory_id, i.ingredient_name,
       inv.quantity_available, inv.last_updated
FROM Inventory inv
JOIN Ingredient i ON inv.ingredient_id = i.ingredient_id
WHERE inv.last_updated >= DATEADD(DAY, -1, GETDATE())
ORDER BY inv.last_updated DESC;




-- 4. Staff & Order Tracking


-- Create Staff
INSERT INTO Staff 
(staff_id, citizen_id, first_name, last_name, username, password, position, status, gender, phone, created_at)
VALUES (10041, '1234567890123', 'John', 'Doe','johndoe', 'password123', 'Waiter', 'Active','Male', '0812345678', GETDATE());

-- Create Order (Staff)
INSERT INTO Orders 
(order_id, order_date, order_status, order_type, total_price, queue_number, staff_id)
VALUES ('ord26004', GETDATE(), 'Pending','Dine-in', 0.00, '57', 10006);

-- Payment
INSERT INTO Payment 
(payment_id, payment_method, amount, payment_status, paid_at, order_id)
VALUES ('P26004', 'Cash', 500.00,'Paid', GETDATE(), 'ord26004');

-- Add Menu to Order
INSERT INTO Order_Menu 
(order_id, menu_id, quantity, unit_price_at_time)
VALUES ('ord26004', 'mu0034', 2, 150.00);

-- Update Order
UPDATE Orders
SET order_status = 'Completed', total_price = 500.00
WHERE order_id = 'ord26004';

-- Update Staff
UPDATE Staff
SET phone = '0899999999', position = 'Senior Waiter'
WHERE staff_id = 10006;

-- Retrieve Orders by Staff
SELECT o.order_id, o.order_date,
       o.order_status, o.total_price,
       o.order_type,
       s.first_name, s.last_name
FROM Orders o
JOIN Staff s ON o.staff_id = s.staff_id
WHERE o.staff_id = 10006
ORDER BY o.order_date DESC;

-- Payment by Staff Orders
SELECT p.payment_id, p.payment_method, p.amount,
       p.payment_status, p.paid_at, o.order_id
FROM Payment p
JOIN Orders o ON p.order_id = o.order_id
WHERE o.staff_id = 10002;