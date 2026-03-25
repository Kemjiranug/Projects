USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'RestaurantInventoryDB')
BEGIN
    ALTER DATABASE RestaurantInventoryDB 
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RestaurantInventoryDB;
END
GO

CREATE DATABASE RestaurantInventoryDB;
GO

USE RestaurantInventoryDB;
GO

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    citizen_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(20),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Menu (
    menu_id VARCHAR(10) PRIMARY KEY,
    menu_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    category VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE Supplier (
    supplier_id VARCHAR(10) PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    email VARCHAR(100)
);

CREATE TABLE Ingredient (
    ingredient_id VARCHAR(10) PRIMARY KEY,
    ingredient_name VARCHAR(100) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    price_per_unit DECIMAL(10,2) CHECK (price_per_unit >= 0),
    minimum_stock_level INT CHECK (minimum_stock_level >= 0)
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATETIME DEFAULT GETDATE(),
    order_status VARCHAR(20),
    order_type VARCHAR(20),
    total_price DECIMAL(10,2) CHECK (total_price >= 0),
    queue_number INT,
    staff_id INT NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Order_Menu (
    order_id VARCHAR(10),
    menu_id VARCHAR(10),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price_at_time DECIMAL(10,2) CHECK (unit_price_at_time >= 0),
    PRIMARY KEY (order_id, menu_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

CREATE TABLE Payment (
    payment_id VARCHAR(10) PRIMARY KEY,
    payment_method VARCHAR(50),
    paid_at DATETIME DEFAULT GETDATE(),
    amount DECIMAL(10,2) CHECK (amount >= 0),
    payment_status VARCHAR(20),
    order_id VARCHAR(10),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Menu_Ingredient (
    menu_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    required_quantity DECIMAL(10,2) NOT NULL CHECK (required_quantity > 0),
    PRIMARY KEY (menu_id, ingredient_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

CREATE TABLE Supplier_Ingredient (
    supplier_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    supplier_price DECIMAL(10,2) CHECK (supplier_price >= 0),
    lead_time_days INT CHECK (lead_time_days >= 0),
    is_preferred BIT,
    PRIMARY KEY (supplier_id, ingredient_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

CREATE TABLE Purchase_Order (
    purchase_id VARCHAR(10) PRIMARY KEY,
    purchase_date DATE DEFAULT GETDATE(),
    total_cost DECIMAL(10,2) CHECK (total_cost >= 0),
    purchase_status VARCHAR(20),
    staff_id INT NOT NULL,
    supplier_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE Purchase_Order_Detail (
    purchase_detail_id VARCHAR(10) PRIMARY KEY,
    quantity INT CHECK (quantity > 0),
    unit_cost DECIMAL(10,2) CHECK (unit_cost >= 0),
    purchase_id VARCHAR(10),
    ingredient_id VARCHAR(10),
    FOREIGN KEY (purchase_id) REFERENCES Purchase_Order(purchase_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

CREATE TABLE Inventory (
    inventory_id VARCHAR(15) PRIMARY KEY,
    quantity_available INT CHECK (quantity_available >= 0),
    last_updated DATETIME DEFAULT GETDATE(),
    ingredient_id VARCHAR(10),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

CREATE TABLE Ingredient_Batch (
    batch_id VARCHAR(15) PRIMARY KEY,
    lot_number VARCHAR(50),
    quantity INT CHECK (quantity >= 0),
    original_quantity INT CHECK (original_quantity >= 0),
    expiration_date DATE,
    received_date DATE DEFAULT GETDATE(),
    inventory_id VARCHAR(15),
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)
);