USE RestaurantInventoryDB;
GO


-- T1: Update Order Status 

-- Before
UPDATE Orders
SET order_status = 'Completed'
WHERE order_id = 'ord26003';
GO

-- Create Procedure
CREATE PROCEDURE UpdateOrderStatus
    @order_id NVARCHAR(10),
    @order_status NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Orders
    SET order_status = @order_status
    WHERE order_id = @order_id;
END;
GO

-- Create Index
CREATE INDEX idx_orders_status
ON Orders(order_status);
GO

-- After
EXEC UpdateOrderStatus
    @order_id = 'ord26003',
    @order_status = 'Completed';
GO




-- T2: Top Selling Menu 


-- Before
SELECT TOP 10
    m.menu_id,
    m.menu_name,
    m.category,
    SUM(om.quantity) AS total_quantity_sold
FROM Order_Menu om
JOIN Menu m ON om.menu_id = m.menu_id
GROUP BY m.menu_id, m.menu_name, m.category
ORDER BY total_quantity_sold DESC;
GO

-- Create Procedure
CREATE PROCEDURE GetTopSellingMenus
    @TopN INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopN)
        m.menu_id,
        m.menu_name,
        m.category,
        SUM(om.quantity) AS total_quantity_sold
    FROM Order_Menu om
    JOIN Menu m ON om.menu_id = m.menu_id
    GROUP BY m.menu_id, m.menu_name, m.category
    ORDER BY total_quantity_sold DESC;
END;
GO

-- Create Index (Covering Index)
CREATE INDEX idx_ordermenu_menuid_qty
ON Order_Menu(menu_id)
INCLUDE (quantity);
GO

-- After
EXEC GetTopSellingMenus @TopN = 10;
GO




-- T3: Inventory Low Stock 


-- Before
SELECT
    i.ingredient_id,
    i.ingredient_name,
    i.unit,
    i.minimum_stock_level,
    inv.quantity_available,
    inv.last_updated,
    CASE
        WHEN inv.quantity_available < i.minimum_stock_level
        THEN 'LOW'
        ELSE 'SUFFICIENT'
    END AS stock_status
FROM Inventory inv
JOIN Ingredient i
    ON inv.ingredient_id = i.ingredient_id
ORDER BY inv.quantity_available ASC;
GO

-- Create Index

CREATE INDEX idx_inv_qty_inge
ON Inventory(quantity_available, ingredient_id)
INCLUDE (last_updated);
GO

-- After
SELECT
    i.ingredient_id,
    i.ingredient_name,
    i.unit,
    i.minimum_stock_level,
    inv.quantity_available,
    inv.last_updated,
    'LOW' AS stock_status
FROM Inventory inv
JOIN Ingredient i
    ON inv.ingredient_id = i.ingredient_id
WHERE inv.quantity_available < 50
ORDER BY inv.quantity_available ASC;
GO




-- T4: Orders by Staff (Optimized)


-- Before
SELECT 
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_price,
    o.order_type,
    s.first_name,
    s.last_name
FROM Orders o
JOIN Staff s ON o.staff_id = s.staff_id
WHERE o.staff_id = 10006
ORDER BY o.order_date DESC;
GO

-- Create Index
CREATE INDEX idx_orders_staffid
ON Orders(staff_id)
INCLUDE (order_date, order_status, total_price, order_type);
GO

-- Create Procedure
CREATE PROCEDURE GetOrdersByStaff
    @staff_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.order_id,
        o.order_date,
        o.order_status,
        o.total_price,
        o.order_type,
        s.first_name,
        s.last_name
    FROM Orders o
    JOIN Staff s ON o.staff_id = s.staff_id
    WHERE o.staff_id = @staff_id
    ORDER BY o.order_date DESC;
END;
GO

-- After
EXEC GetOrdersByStaff @staff_id = 10006;
GO