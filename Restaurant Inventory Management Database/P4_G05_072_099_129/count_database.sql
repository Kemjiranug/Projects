USE RestaurantInventoryDB;
GO

SELECT 'ingredient' AS table_name, COUNT(*) AS total FROM ingredient
UNION ALL
SELECT 'ingredient_batch', COUNT(*) FROM ingredient_batch
UNION ALL
SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'menu', COUNT(*) FROM menu
UNION ALL
SELECT 'menu_ingredient', COUNT(*) FROM menu_ingredient
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_menu', COUNT(*) FROM order_menu
UNION ALL
SELECT 'payment', COUNT(*) FROM payment
UNION ALL
SELECT 'purchase_order', COUNT(*) FROM purchase_order
UNION ALL
SELECT 'purchase_order_detail', COUNT(*) FROM purchase_order_detail
UNION ALL
SELECT 'supplier', COUNT(*) FROM supplier
UNION ALL
SELECT 'supplier_ingredient', COUNT(*) FROM supplier_ingredient
UNION ALL
SELECT 'staff', COUNT(*) FROM staff;