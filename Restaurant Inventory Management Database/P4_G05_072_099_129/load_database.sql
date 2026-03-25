USE RestaurantInventoryDB;
GO

BULK INSERT staff FROM 'C:\csv\staff.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT supplier FROM 'C:\csv\supplier.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT ingredient FROM 'C:\csv\ingredient.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT supplier_ingredient FROM 'C:\csv\supplier_ingredient.csv' WITH (FIRSTROW = 2,FIELDTERMINATOR = ',',ROWTERMINATOR = '0x0d0a');

BULK INSERT inventory FROM 'C:\csv\inventory.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT ingredient_batch FROM 'C:\csv\ingredient_batch.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT menu FROM 'C:\csv\menu.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT menu_ingredient FROM 'C:\csv\menu_ingredient.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT purchase_order FROM 'C:\csv\purchase_order.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT purchase_order_detail FROM 'C:\csv\purchase_order_detail.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT orders FROM 'C:\csv\orders.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT order_menu FROM 'C:\csv\order_menu.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a');

BULK INSERT payment FROM 'C:\csv\payment.csv' WITH (FIRSTROW=2, FIELDTERMINATOR=',', ROWTERMINATOR='0x0a', KEEPIDENTITY);

GO
