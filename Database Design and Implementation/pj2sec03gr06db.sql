DROP DATABASE pj2sec03gr06db;
CREATE DATABASE IF NOT EXISTS pj2sec03gr06db;
USE pj2sec03gr06db;

CREATE TABLE Supplier(
	supID CHAR(6),
    supFname VARCHAR(32) NOT NULL,
    supLname VARCHAR(32) NOT NULL,
    compName VARCHAR(32) NOT NULL,
    supEmail VARCHAR(32) NOT NULL,
    supTel CHAR(10) NOT NULL,
    CONSTRAINT PK_Supplier PRIMARY KEY(supID)
);

INSERT INTO Supplier (supID, supFname, supLname, compName, supEmail, supTel) VALUES
	('S00001', 'Chutiwat', 'Somboon', 'SmartLGT Co.,Ltd', 'smart.Logistics@gmail.com', '0882547721'),
	('S00002', 'Marin', 'Ninnakorn', 'Nexpie Co.Ltd', 'nexpie@gmail.com', '0901123456'),
	('S00003', 'Ticha', 'Jiranan', 'GIS Co.Ltd', 'GIS.company@gmail.com', '0742896699'),
	('S00004', 'Ashira', 'Suthai', 'BRABBIT CO.,LTD', 'brabbit.startup@gmail.com', '0614420156'),
	('S00005', 'Chet', 'Kanitkul', 'VGEN CO.,Ltd', 'v.gen@gmail.com', '0895532425'),
	('S00006', 'Danika', 'Yuyongrak', 'Chareon Sook Co.,Ltd', 'chareon.sook@gmail.com', '0892889922'),
	('S00007', 'Ashirakorn', 'Pondechapiphat', 'Maruai Co.,Ltd', 'maruai.company@gmail.com', '0751199596'),
	('S00008', 'Kavin', 'Rattanakul', 'Rungrueang Co.,Ltd', 'rung.rueang@gmail.com', '0906007173'),
	('S00009', 'Chayanon', 'Phakthin', 'ThaiSup Co.,Ltd', 'thai.supplier@gmail.com', '0657798182'), 
	('S00010', 'Worayut', 'Prasongporn', 'W.Group Co.,Ltd', 'w.connect.group@gmail.com', '0977890011');

CREATE TABLE Staff(
	staffID CHAR(6),
    staffFname VARCHAR(32) NOT NULL,
    staffLname VARCHAR(32) NOT NULL,
    staffGender CHAR(1) NOT NULL,
    staffTel CHAR(10) NOT NULL,
    staffBdate DATE  NOT NULL,
    CONSTRAINT PK_Staff PRIMARY KEY(staffID)
);

INSERT INTO Staff (staffID, staffFname, staffLname, staffGender, staffTel, staffBdate) VALUES
	('ST0001', 'Pasawee', 'Sriarunotai', 'M', '0897312428', '1987-07-23'),
	('ST0002', 'Kris', 'Kanchanatip', 'M', '0954435250', '1992-11-25'),
	('ST0003', 'Pongpol', 'Panyamit', 'M', '0803326483', '2000-10-09'),
	('ST0004', 'Charissa', 'Jankane', 'F', '0973737282', '1976-02-11'),
	('ST0005', 'Yada', 'Wongpaisarn', 'F', '0892218474', '1988-12-04'),
	('ST0006', 'Nattakit', 'Chaemdara', 'M', '0907492748', '2002-06-27'),
	('ST0007', 'Tatchai', ' Limpanyakul', 'M', '0648263849', '1995-03-18'),
	('ST0008', 'Dechapat', 'Pondechapiphat', 'M', '0861737463', '1994-03-15'),
	('ST0009', 'Alisara', 'Chareonwat', 'F', '0872374839', '2001-05-01'),
	('ST0010', 'Wasupon', 'Pornpananurak', 'M', '0942845521', '1979-10-06');


CREATE TABLE Promotion(
	promoID CHAR(6),
    discount INT NOT NULL,
    promo_name VARCHAR(32) NOT NULL,
    specialoffers VARCHAR(32) NOT NULL,
    member_bene VARCHAR(32),
    SstaffID CHAR(6) NOT NULL,
    CONSTRAINT PK_Promo PRIMARY KEY(promoID),
    CONSTRAINT FK_Promo FOREIGN KEY(SstaffID)
    REFERENCES Staff(staffID)
);

INSERT INTO Promotion (promoID, discount, promo_name, specialoffers, member_bene, SstaffID) VALUES
	('PROM01', 10, 'Weekly Special', 'Buy 1 Get 1 Free', '5% Extra Discount', 'ST0001'),
	('PROM02', 15, 'Holiday Sale', 'Free Gift with Purchase', '10% Cashback', 'ST0002'),
	('PROM03', 20, 'Member Exclusive', 'Free Delivery', 'Double Points', 'ST0003'),
	('PROM04', 25, 'Clearance Sale', 'Up to 50% on Selected Items', null, 'ST0004'),
	('PROM05', 30, 'Flash Sale', 'Limited Time Offer', '5% Extra Discount', 'ST0005'),
	('PROM06', 10, 'Back to School', 'Free Stationery Kit', '5% Extra Points', 'ST0006'),
	('PROM07', 15, 'Weekend Sale', 'Buy 2 Get 1 Free', 'Free Loyalty Points', 'ST0007'),
	('PROM08', 10, 'Festive Discount', '10% Off on Electronics', 'Extended Warranty', 'ST0008'),
	('PROM09', 25, 'Health & Wellness', 'Free Health Kit', 'Extra 10% on Health Products', 'ST0009'),
	('PROM10', 50, 'Year-End Clearance', 'Up to 70% on Clearance Items', null, 'ST0010');

CREATE TABLE Product(
	prodID CHAR(13),
    prodName VARCHAR(50) NOT NULL,
    prodPrice DECIMAL(6,2) NOT NULL,
    MFGdate DATE NOT NULL,
    EXPdate DATE NOT NULL,
    SsupID CHAR(6) NOT NULL,
    PpromoID CHAR(6),
    CONSTRAINT PK_Product PRIMARY KEY(prodID),
    CONSTRAINT FK_PromotionID FOREIGN KEY(PpromoID)
    REFERENCES Promotion(promoID),
    CONSTRAINT FK_SupID FOREIGN KEY(SsupID)
    REFERENCES Supplier(supID)
);

INSERT INTO Product (prodID, prodName, prodPrice, MFGdate, EXPdate, SsupID, PpromoID) VALUES
	('8851932295796', 'Walls Ice Cream Magnum Classic', 50.00, '2024-08-15', '2025-02-14', 'S00003', null),
	('8850718801213', 'Lays Classic Potato Salt', 31.00, '2024-04-22', '2024-12-23', 'S00002', 'PROM01'),
	('8859242900713', 'Sukishi Green Papaya Kimchi', 69.00, '2024-11-05', '2025-03-04', 'S00010', 'PROM04'),
	('4710731050163', 'Farcent Absorb Box', 54.00, '2023-05-12', '2025-01-12', 'S00006', 'PROM05'),
	('8850002020245', 'Kirei Hand Soap Refill', 39.00, '2023-07-29', '2026-05-30', 'S00009', 'PROM09'),
	('8850329102112', 'Meiji Pasteurized Milk Plain', 99.75, '2024-11-14', '2024-11-23', 'S00007', null),
	('8850188270106', 'Foremost UHT Milk Low Fat', 47.50, '2024-11-10', '2024-11-19', 'S00005', null),
	('8851952350796', 'Crystal Water Pack 6', 55.00, '2024-08-10', '2025-08-09', 'S00008', 'PROM06'),
	('4800361028004', 'Nestle Cereal Milo', 10.00, '2024-06-12', '2024-12-05', 'S00001', 'PROM06'),
	('8850358371343', 'Mcgarett Instant Oat', 55.00, '2024-09-09', '2025-09-08', 'S00004', null),
    ('8851473006233', 'Sara Paracetamol', 15.00, '2022-11-02', '2027-11-01', 'S00007', 'PROM09'),
    ('8887549037238', 'Panasonic Black Battery AA Pack 4', 69.00, '2023-02-06', '2033-02-05', 'S00001', 'PROM08'),
    ('3292070100613', 'Thammachart Laberyrie Salmon Caviar', 690.00, '2024-11-01', '2024-12-01', 'S00010', 'PROM03'),
    ('8851906883936', 'Zuza Sparkling Lychee Flavour Drink', 35.00, '2024-05-23', '2025-05-22', 'S00002', 'PROM07'),
    ('6920354814471', 'Colgate Optic White', 149.00, '2023-09-17', '2025-09-16', 'S00003', 'PROM01'),
    ('4902430565578', 'Head&Shoulder Apple Fresh Shampoo', 109.00, '2023-08-04', '2025-08-03', 'S00004', 'PROM02'),
    ('8853474056200', 'Smarter Moisturizing Nail Polish Remover', 55.00, '2024-02-10', '2025-02-09', 'S00005', 'PROM10'),
    ('8850007814528', 'Listerine Cool Mint Mouthwash', 249.00, '2024-06-08', '2025-06-07', 'S00006', 'PROM09'),
    ('4710731000540', 'Farcent Shoe Deodorizer Spray', 96.00, '2024-10-15', '2025-10-14', 'S00007', null),
    ('4550516705907', 'Senka Perfect Whip White', 199.00, '2024-04-24', '2025-10-04', 'S00008', 'PROM05'),
    ('8851818341401', 'Biore Perfect Cleansing', 219.00, '2024-03-31', '2025-03-30', 'S00009', 'PROM05');

    

CREATE TABLE Food(
	PprodID CHAR(13),
    ingredients VARCHAR(32) NOT NULL,
    size VARCHAR(15) NOT NULL,
    CONSTRAINT FK_Food FOREIGN KEY(PprodID)
    REFERENCES Product(prodID)
);

INSERT INTO Food(PprodID, ingredients, size) VALUES
	('8851932295796', 'mile and cocoa', '70 g.'),
	('8850718801213', 'potato and salt','69 g.'),
	('8859242900713', 'papaya and gochujang sauce', '150 g.'),
	('8850329102112', 'milk', '2 ltr.'),
	('8850188270106', 'milk', '1 ltr.'),
	('8851952350796', 'water', '1.5 ltr.'),
	('4800361028004', 'cocoa and wheat', '17 g.'),
	('8850358371343', 'oat', '400 g.'),
    ('3292070100613', 'Salmon caviar', '80 g.'),
	('8851906883936', 'Lychee and soda', '240 ml.');

CREATE TABLE Appliance(
	PprodID CHAR(13),
    material VARCHAR(50) NOT NULL,
    brand VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Appliance FOREIGN KEY(PprodID)
    REFERENCES Product(prodID) 
);

INSERT INTO Appliance(PprodID, material, brand) VALUES
	('4710731050163', 'charcoal', 'Farcent'),
	('8850002020245', 'water and propylene glycol', 'Kirei'),
    ('8851473006233', 'Paracetamol', 'Sara'),
    ('8887549037238', 'battery', 'Panasonic'),
	('6920354814471', 'Sodium acrylates', 'Colgate'),
    ('4902430565578', 'Water and Sodium Lauryl Sulfate', 'Head&Shoulder'),
    ('8853474056200', 'Acetone, propylene glycol, and water', 'Smarter'),
    ('8850007814528', 'Eucalyptol, menthol, thymol, and water', 'Listerine'),
    ('4710731000540', 'Deionized water and Ethanol', 'Farcent'),
    ('4550516705907', 'Potassium hydroxide and Stearic acid etc.', 'Senka'),
    ('8851818341401', 'Water and Dipropylene glycol etc.', 'Biore');


CREATE TABLE Cashier(
	cashierID CHAR(6),
    cashierFname VARCHAR(32) NOT NULL,
    cashierLname VARCHAR(32) NOT NULL,
    cashierTel CHAR(10) NOT NULL,
    workingHours VARCHAR(10) NOT NULL,
    cashierBdate DATE NOT NULL,
    CONSTRAINT PK_Cashier PRIMARY KEY(cashierID)
);

INSERT INTO Cashier(cashierID, cashierFname, cashierLname, cashierTel, workingHours, cashierBdate) VALUES
	('CH2101', 'Apichit', 'Chonlapat', '0847721413', 'Morning', '1995-06-16'),
	('CH2102', 'Somchai', 'Chatribood', '0871563434', 'Morning', '1994-04-25'),
	('CH2103', 'Paweethida', 'Srirattanakul', '0645643782', 'Night', '1990-02-28'),
	('CH2104', 'Varee', 'Deepraserth', '0815324563', 'Morning', '1987-11-12'),
	('CH2105', 'Suwimon', 'Amornsiri', '0834326112', 'Night', '1999-10-21'),
	('CH2106', 'Suradeth', 'Chedmontri', '0856543432', 'Night', '1992-05-05'),
	('CH2107', 'Thanyarat', 'Wattanakriet', '0896903211', 'Morning', '2000-09-19'),
	('CH2108', 'Amornrat', 'Taweechoke', '0956745432', 'Night', '1994-03-26'), 
	('CH2109', 'Ployphat', 'Junjam', '0675436556', 'Morning', '1996-07-14'),
	('CH2110', 'Theerawat', 'Chaimonkol', '0865546621', 'Night', '1993-10-11');

CREATE TABLE Customer(
	customerID CHAR(6),
    customerFname VARCHAR(32) NOT NULL,
    customerLname VARCHAR(32) NOT NULL,
    customerBdate DATE NOT NULL,
    customerGender CHAR(1),
    customerTel CHAR(10) NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY(customerID)
);

INSERT INTO Customer(customerID, customerFname, customerLname, customerBdate, customerGender, customerTel) VALUES
	('C10111', 'Crystalyn', 'Pinaumphai', '1992-04-06', 'M', '0656114709'),
	('C10112', 'Darin', 'Srihabuth', '1990-03-25', null, '0897014569'),
	('C10113', 'Nuttacha', 'Panpariwat', '1997-07-04', 'M', '0956147224'),
	('C10114', 'Thitiwat', 'Sangarun', '2003-06-04', 'M', '0804669612'),
	('C10115', 'Patsawee', 'Siripornsak', '1987-02-18', 'F', '0816196687'),
	('C10116', 'Anyarin', 'Srithongchai', '1995-06-09', 'F', '0802128892'),
	('C10117', 'Gavin', 'Dechasiri', '1991-10-10', null, '0697213456'),
	('C10118', 'Phuwin', 'Thrirong', '1989-02-16', 'M', '0827416573'),
	('C10119', 'Nicha', 'Phuwadet', '1990-01-21', 'F', '0884667213'),
	('C10120', 'Thanawat', 'Sooksomboon na ayutthaya', '1985-12-24', null, '0946491152');


CREATE TABLE Orders (
	orderID CHAR(6),
	orderName VARCHAR(32),
    orderDate DATE NOT NULL,
    orderTime TIME NOT NULL,
    orderPrice DECIMAL(6,2) NOT NULL,
    CONSTRAINT PK_orderID PRIMARY KEY(orderID)
);

INSERT INTO Orders(orderID,orderName,orderDate,orderTime,orderPrice) VALUES 
	('OD0001', 'Supermarket Order 1', '2024-11-01', '08:15:00', 100.00),  
	('OD0002', 'Supermarket Order 2', '2024-11-01', '08:45:00', 150.00),  
	('OD0003', 'Supermarket Order 3', '2024-11-01', '09:10:00', 205.25),  
	('OD0004', 'Supermarket Order 4', '2024-11-02', '12:00:00', 70.00),   
	('OD0005', 'Supermarket Order 5', '2024-11-02', '13:00:00', 1900.75),
	('OD0006', 'Supermarket Order 6', '2024-11-02', '14:35:00', 2500.00),
	('OD0007', 'Supermarket Order 7', '2024-11-02', '18:00:00', 450.00),
	('OD0008', 'Supermarket Order 8', '2024-11-02', '20:10:00', 2333.50),
	('OD0009', 'Supermarket Order 9', '2024-11-02', '20:15:00', 560.25),
	('OD0010', 'Supermarket Order 10', '2024-11-02','20:30:00', 780.00);

CREATE TABLE Payment(
	payID CHAR(6),
    payDate DATE NOT NULL,
    payTime TIME NOT NULL,
    slipNo CHAR(10) NOT NULL,
    bankName VARCHAR(20) NOT NULL,
    CONSTRAINT PK_paymentID PRIMARY KEY(payID)
);

INSERT INTO Payment(payID,payDate,payTime,slipNo,bankName) VALUES 
	('P00101', '2024-10-01', '09:15:00', 'SLP00001', 'Bangkok Bank'),
	('P00102', '2024-10-01', '10:45:00', 'SLP00002', 'UOB Thailand'),
	('P00103', '2024-10-02', '11:30:00', 'SLP00003', 'TMBThanachart Bank'),
	('P00104', '2024-10-02', '13:20:00', 'SLP00004', 'CitiBank'),
	('P00105', '2024-10-03', '14:50:00', 'SLP00005', 'Bank of Ayudhya'),
	('P00106', '2024-10-03', '16:00:00', 'SLP00006', 'Kasikornbank'),
	('P00107', '2024-10-04', '09:00:00', 'SLP00007', 'Bangkok Bank'),
	('P00108', '2024-10-05', '11:10:00', 'SLP00008', 'UOB Thailand'),
	('P00109', '2024-10-06', '10:15:00', 'SLP00009', 'Kasikornbank'),
	('P00110', '2024-10-06', '12:45:00', 'SLP00010', 'Kasikornbank');

CREATE TABLE Deliver(
	PproductID CHAR(13),
    SsuplierID CHAR(6),
    deliverTime TIME NOT NULL,
    deliverDate DATE NOT NULL,
    CONSTRAINT FK_PproductID FOREIGN KEY(PproductID) 
    REFERENCES Product(prodID),
    CONSTRAINT FK_SsuplierID FOREIGN KEY(SsuplierID) 
    REFERENCES Supplier(supID)
);

INSERT INTO Deliver(PproductID,SsuplierID,deliverTime,deliverDate) VALUES 
	('8851932295796', 'S00001', '10:30:00', '2024-11-01'),
	('8850188270106', 'S00004', '12:15:00', '2024-11-01'),
	('4800361028004', 'S00003', '09:00:00', '2024-11-02'),
	('8850329102112', 'S00010', '14:45:00', '2024-11-02'),
	('8850358371343', 'S00005', '08:30:00', '2024-11-03'),
	('4710731050163', 'S00006', '13:20:00', '2024-11-03'),
	('8850718801213', 'S00002', '11:10:00', '2024-11-04'),

	('4710731050163', 'S00008', '16:00:00', '2024-11-04'),
	('8850188270106', 'S00009', '09:40:00', '2024-11-05'),
	('8850329102112', 'S00010', '17:30:00', '2024-11-05'),
	('8850718801213', 'S00001', '10:10:00', '2024-11-06'),
	('4800361028004', 'S00002', '14:55:00', '2024-11-06'),
	('8851932295796', 'S00003', '08:45:00', '2024-11-07'),
	('8850358371343', 'S00004', '15:25:00', '2024-11-07'),

	('8850718801213', 'S00005', '12:30:00', '2024-11-08'),
	('4800361028004', 'S00006', '13:50:00', '2024-11-08'),
	('8850188270106', 'S00007', '10:00:00', '2024-11-09'),
	('8851932295796', 'S00008', '14:00:00', '2024-11-09'),
	('8850329102112', 'S00009', '11:30:00', '2024-11-10'),
	('4800361028004', 'S00001', '16:10:00', '2024-11-10'),
	('4710731050163', 'S00003', '08:55:00', '2024-11-11'),

	('4710731050163', 'S00002', '14:40:00', '2024-11-11'),
	('8850188270106', 'S00003', '09:20:00', '2024-11-12'),
	('4800361028004', 'S00004', '12:50:00', '2024-11-12'),
	('8850329102112', 'S00005', '10:15:00', '2024-11-13'),
	('8851932295796', 'S00006', '11:50:00', '2024-11-13'),
	('8850358371343', 'S00007', '10:00:00', '2024-11-14'),

	('4800361028004', 'S00008', '15:30:00', '2024-11-14'),
	('8850188270106', 'S00009', '09:10:00', '2024-11-15'),
	('8851932295796', 'S00001', '16:20:00', '2024-11-15');

CREATE TABLE Checks (
    PproductID CHAR(13),
    SsupplierID CHAR(6),
    statuss VARCHAR(20) NOT NULL,
    checkDate DATE NOT NULL,
    CONSTRAINT FK_PprodID FOREIGN KEY (PproductID) 
    REFERENCES Product(prodID),
    CONSTRAINT FK_SsupID FOREIGN KEY (SsupplierID) 
    REFERENCES Supplier(supID)
);
INSERT INTO Checks (PproductID, SsupplierID, statuss, checkDate) VALUES
    ('8850358371343', 'S00001', 'Delivered', '2024-11-01'),
    ('8851906883936', 'S00002', 'Pending', '2024-11-02'),
    ('4710731000540', 'S00003', 'Delivered', '2024-11-02'),
    ('4902430565578', 'S00004', 'In Transit', '2024-11-03'),
    ('8853474056200', 'S00005', 'In Transit', '2024-11-03'),
    ('8850007814528', 'S00006', 'Delivered', '2024-11-04'),
    ('8851473006233', 'S00007', 'Pending', '2024-11-04'),
    ('4550516705907', 'S00008', 'Delivered', '2024-11-05'),
    ('8851818341401', 'S00009', 'In Transit', '2024-11-05'),
    ('3292070100613', 'S00010', 'In Transit', '2024-11-05'),
    
	('8850329102112', 'S00001', 'Pending', '2024-11-01'),
    ('4800361028004', 'S00003', 'Pending', '2024-11-03'),
    ('8850188270106', 'S00005', 'Delivered', '2024-11-02'),
    ('8850358371343', 'S00004', 'In Transit', '2024-11-03'),
    ('4710731000540', 'S00009', 'Pending', '2024-11-03'),
    ('3292070100613', 'S00007', 'Delivered', '2024-11-05'),
    ('8850007814528', 'S00006', 'In Transit', '2024-11-03'),
    ('8851952350796', 'S00008', 'In Transit', '2024-11-05'),
    ('8859242900713', 'S00010', 'Delivered', '2024-11-04'),
    ('6920354814471', 'S00003', 'Delivered', '2024-11-05'),
    
	('8850002020245', 'S00008', 'In Transit', '2024-11-01'),
    ('4800361028004', 'S00003', 'Delivered', '2024-11-02'),
    ('8850007814528', 'S00006', 'Delivered', '2024-11-02'),
    ('3292070100613', 'S00007', 'Delivered', '2024-11-03'),
    ('8851952350796', 'S00008', 'Pending', '2024-11-03'),
    ('6920354814471', 'S00007', 'Delivered', '2024-11-04'),
    ('8859242900713', 'S00010', 'Delivered', '2024-11-04'),
    ('8850358371343', 'S00008', 'Delivered', '2024-11-05'),
    ('4902430565578', 'S00002', 'Pending', '2024-11-05'),
    ('4710731000540', 'S00004', 'Pending', '2024-11-05');

CREATE TABLE CheckAmount (
    PproductID CHAR(13),
    SstaffID CHAR(6),
    amountTime TIME NOT NULL,
    amount INT NOT NULL,
    amountDate DATE NOT NULL,
    CONSTRAINT FK_prodID FOREIGN KEY (PproductID) 
    REFERENCES Product(prodID),
    CONSTRAINT FK_SstaffID FOREIGN KEY (SstaffID) 
    REFERENCES Staff(staffID)
);

INSERT INTO CheckAmount (PproductID, SstaffID, amountTime, amount, amountDate) VALUES
	('4710731000540', 'ST0001', '09:15:00', 325,'2024-11-01'),
	('8851932295796', 'ST0002', '10:45:00', 55,'2024-11-02'),
	('8850002020245', 'ST0003', '11:30:00', 250,'2024-11-02'),
	('3292070100613', 'ST0004', '13:20:00', 992,'2024-11-03'),
	('6920354814471', 'ST0009', '14:50:00', 450,'2024-11-03'),
	('8851952350796', 'ST0008', '16:00:00', 485,'2024-11-04'),
	('4550516705907', 'ST0007', '09:00:00', 98,'2024-11-04'),
	('8850718801213', 'ST0008', '11:10:00', 145,'2024-11-05'),
	('4800361028004', 'ST0004', '10:15:00', 940,'2024-11-05'),
	('8887549037238', 'ST0002', '12:45:00', 85,'2024-11-05'),
    
	('4550516705907', 'ST0002', '09:00:00', 35,'2024-11-01'),
	('6920354814471', 'ST0007', '10:23:00', 250,'2024-11-02'),
	('4710731000540', 'ST0003', '11:19:00', 25,'2024-11-02'),
	('8851932295796', 'ST0009', '13:00:00', 912,'2024-11-03'),
	('8850358371343', 'ST0010', '14:10:00', 130,'2024-11-03'),
	('3292070100613', 'ST0007', '16:10:00', 125,'2024-11-04'),
	('4800361028004', 'ST0009', '09:10:00', 198,'2024-11-04'),
	('8850188270106', 'ST0003', '11:13:00', 345,'2024-11-05'),
	('8851473006233', 'ST0004', '10:18:00', 440,'2024-11-05'),
	('8859242900713', 'ST0002', '12:19:00', 55,'2024-11-05'),
    
	('8850007814528', 'ST0001', '11:15:00', 525,'2024-11-01'),
	('6920354814471', 'ST0004', '12:45:00', 75,'2024-11-02'),
	('8850718801213', 'ST0003', '13:30:00', 80,'2024-11-02'),
	('8851952350796', 'ST0007', '14:20:00', 122,'2024-11-03'),
	('3292070100613', 'ST0009', '15:50:00', 230,'2024-11-03'),
	('8850329102112', 'ST0008', '17:00:00', 455,'2024-11-04'),
	('8887549037238', 'ST0007', '17:30:00', 228,'2024-11-04'),
	('8851906883936', 'ST0005', '11:50:00', 745,'2024-11-05'),
	('4550516705907', 'ST0005', '10:25:00', 840,'2024-11-05'),
	('4710731000540', 'ST0006', '12:45:00', 95,'2024-11-05');

CREATE TABLE Contain(
	PproddID CHAR(13),
    OorderID CHAR(6),
    CONSTRAINT FK_PproddID FOREIGN KEY (PproddID)
    REFERENCES Product(prodID),
    CONSTRAINT FK_OorderID FOREIGN KEY (OorderID)
	REFERENCES Orders(orderID)
);

INSERT INTO Contain(PproddID, OorderID) VALUES
	('4550516705907', 'OD0009'),
    ('8850718801213', 'OD0007'),
    ('8851952350796', 'OD0002'),
    ('3292070100613', 'OD0005'),
    ('4902430565578', 'OD0004'),
    ('8851906883936', 'OD0008'),
    ('8850007814528', 'OD0010'),
    ('8853474056200', 'OD0006'),
    ('8851818341401', 'OD0001'),
    ('4710731050163', 'OD0003'),
    
    ('8851473006233', 'OD0002'),
    ('8887549037238', 'OD0009'),
    ('4800361028004', 'OD0007'),
    ('8851932295796', 'OD0003'),
    ('8859242900713', 'OD0010'),
    ('6920354814471', 'OD0001'),
    ('8887549037238', 'OD0004'),
    ('8850358371343', 'OD0008'),
    ('8850718801213', 'OD0006'),
    ('8851818341401', 'OD0005'),
    
    ('3292070100613', 'OD0005'),
    ('8853474056200', 'OD0008'),
    ('4710731050163', 'OD0002'),
    ('8859242900713', 'OD0003'),
    ('8887549037238', 'OD0010'),
    ('6920354814471', 'OD0004'),
    ('8851906883936', 'OD0007'),
    ('8850329102112', 'OD0001'),
    ('4550516705907', 'OD0009'),
    ('8850007814528', 'OD0006');

CREATE TABLE Refund(
	PproddID CHAR(13),
	CcustomerID CHAR(6),
	CONSTRAINT FK_PproduID FOREIGN KEY (PproddID)
	REFERENCES Product(prodID),
	CONSTRAINT FK_CcustomerID FOREIGN KEY (CcustomerID)
	REFERENCES Customer(customerID)
);

INSERT INTO Refund(PproddID, CcustomerID) VALUES
	('8851932295796', 'C10111'),
    ('8850718801213', 'C10115'),
    ('8859242900713', 'C10113'),
    ('4710731050163', 'C10114'),
    ('8850002020245', 'C10120'),
    ('8850329102112', 'C10112'),
    ('8850188270106', 'C10119'),
    ('8851952350796', 'C10117'),
    ('4800361028004', 'C10116'),
    ('8850358371343', 'C10118'),
    
    ('4710731050163', 'C10112'),
    ('8850002020245', 'C10119'),
    ('8850329102112', 'C10116'),
    ('4800361028004', 'C10120'),
    ('8850358371343', 'C10115'),
    ('8851952350796', 'C10113'),
    ('8850188270106', 'C10117'),
    ('8851932295796', 'C10118'),
    ('8850718801213', 'C10114'),
    ('8859242900713', 'C10111'),
    
    ('8850188270106', 'C10118'),
    ('8851932295796', 'C10114'),
    ('8850718801213', 'C10111'),
    ('8859242900713', 'C10116'),
    ('8850002020245', 'C10117'),
    ('4710731050163', 'C10112'),
    ('8850002020245', 'C10120'),
    ('8851952350796', 'C10115'),
    ('8850329102112', 'C10113'),
    ('4800361028004', 'C10119');

CREATE TABLE Have(
	OorderID CHAR(6),
	PpromotionID CHAR(6),
	CONSTRAINT FK_OorderrID FOREIGN KEY (OorderID)
	REFERENCES Orders(orderID),
	CONSTRAINT FK_PpromotionID FOREIGN KEY (PpromotionID)
	REFERENCES Promotion(promoID)
);

INSERT INTO Have(OorderID, PpromotionID) VALUES
	('OD0005', 'PROM09'),
	('OD0003', 'PROM08'),
	('OD0010', 'PROM06'),
	('OD0001', 'PROM10'),
	('OD0004', 'PROM02'),
	('OD0008', 'PROM05'),
	('OD0002', 'PROM07'),
	('OD0009', 'PROM04'),
	('OD0006', 'PROM03'),
	('OD0007', 'PROM01'),

	('OD0002', 'PROM07'),
	('OD0004', 'PROM06'),
	('OD0006', 'PROM04'),
	('OD0008', 'PROM02'),
	('OD0010', 'PROM09'),
	('OD0001', 'PROM10'),
	('OD0003', 'PROM01'),
	('OD0005', 'PROM08'),
	('OD0007', 'PROM03'),
	('OD0009', 'PROM05'),

	('OD0002', 'PROM07'),
	('OD0004', 'PROM09'),
	('OD0006', 'PROM08'),
	('OD0008', 'PROM06'),
	('OD0010', 'PROM10'),
	('OD0001', 'PROM01'),
	('OD0003', 'PROM03'),
	('OD0005', 'PROM02'),
	('OD0007', 'PROM04'),
	('OD0009', 'PROM05');

CREATE TABLE Make(
	CcashierID CHAR(6),
	OorderrID CHAR(6),
	CcustomerrID CHAR(6),
	PpaymentID CHAR(6),
	CONSTRAINT FK_CcashierID FOREIGN KEY (CcashierID)
	REFERENCES Cashier(cashierID),
	CONSTRAINT FK_OordersID FOREIGN KEY (OorderrID)
	REFERENCES Orders(orderID),
	CONSTRAINT FK_CcustomerrID FOREIGN KEY (CcustomerrID)
	REFERENCES Customer(customerID),
	CONSTRAINT FK_PpaymentID FOREIGN KEY (PpaymentID)
	REFERENCES Payment(payID)
);

INSERT INTO Make(CcashierID, OorderrID, CcustomerrID, PpaymentID) VALUES
	('CH2102', 'OD0005', 'C10120', 'P00107'),
    ('CH2105', 'OD0003', 'C10111', 'P00101'),
    ('CH2107', 'OD0010', 'C10119', 'P00104'),
    ('CH2110', 'OD0001', 'C10115', 'P00106'),
    ('CH2103', 'OD0004', 'C10118', 'P00108'),
    ('CH2104', 'OD0008', 'C10113', 'P00105'),
    ('CH2101', 'OD0002', 'C10116', 'P00109'),
    ('CH2109', 'OD0009', 'C10117', 'P00110'),
    ('CH2108', 'OD0006', 'C10112', 'P00103'),
    ('CH2106', 'OD0007', 'C10114', 'P00102'),
    
    ('CH2104', 'OD0006', 'C10116', 'P00106'),
    ('CH2107', 'OD0009', 'C10117', 'P00108'),
    ('CH2106', 'OD0007', 'C10118', 'P00102'),
    ('CH2108', 'OD0002', 'C10119', 'P00110'),
    ('CH2105', 'OD0001', 'C10112', 'P00107'),
    ('CH2109', 'OD0010', 'C10114', 'P00101'),
    ('CH2110', 'OD0003', 'C10113', 'P00104'),
    ('CH2101', 'OD0004', 'C10115', 'P00105'),
    ('CH2102', 'OD0005', 'C10120', 'P00108'),
    ('CH2103', 'OD0008', 'C10111', 'P00103'),
    
    ('CH2103', 'OD0007', 'C10111', 'P00105'),
    ('CH2102', 'OD0010', 'C10112', 'P00109'),
    ('CH2104', 'OD0006', 'C10113', 'P00106'),
    ('CH2106', 'OD0004', 'C10114', 'P00108'),
    ('CH2108', 'OD0002', 'C10120', 'P00103'),
    ('CH2110', 'OD0005', 'C10119', 'P00104'),
    ('CH2109', 'OD0001', 'C10117', 'P00107'),
    ('CH2107', 'OD0003', 'C10115', 'P00101'),
    ('CH2105', 'OD0008', 'C10118', 'P00102'),
    ('CH2101', 'OD0009', 'C10116', 'P00110');

CREATE TABLE Removes (
	PproducttID CHAR(13),
	SstaffsID CHAR(6),
	removeTime TIME NOT NULL,
	removeDate DATE NOT NULL,
	CONSTRAINT FK_PproducttID FOREIGN KEY(PproducttID)
	REFERENCES Product(prodID),
	CONSTRAINT FK_SstaffsID FOREIGN KEY(SstaffsID)
	REFERENCES Staff(staffID)
 );
 
INSERT INTO Removes(pproducttID, SstaffsID, removeTime, removedate) VALUES
	('8851932295796', 'ST0003', '09:00:00', '2024-11-01'),
	('8850188270106', 'ST0005', '09:00:00', '2024-11-01'),
	('8850002020245', 'ST0007', '09:00:00', '2024-11-01'),
	('8850718801213', 'ST0002', '10:00:00', '2024-11-02'),
	('8851932295796', 'ST0009', '11:00:00', '2024-11-02'),
	('4800361028004', 'ST0010', '12:00:00', '2024-12-02'),
	('8859242900713', 'ST0004', '13:00:00', '2024-12-03'),
	('8850329102112', 'ST0006', '06:00:00', '2024-12-03'),
	('8850718801213', 'ST0001', '16:00:00', '2024-11-03'),
	('4710731050163', 'ST0008', '19:00:00', '2024-11-04'),

	('4800361028004', 'ST0007', '07:00:00', '2024-10-04'),
	('8850002020245', 'ST0003', '15:00:00', '2024-10-04'),
	('8859242900713', 'ST0009', '08:00:00', '2024-12-01'),
	('8850188270106', 'ST0010', '08:00:00', '2024-12-01'),
	('8850718801213', 'ST0005', '05:00:00', '2024-12-01'),
	('8850358371343', 'ST0004', '18:00:00', '2024-12-02'),
	('8850358371343', 'ST0006', '19:00:00', '2024-12-02'),
	('8851932295796', 'ST0002', '13:00:00', '2024-10-02'),
	('4710731050163', 'ST0008', '14:00:00', '2024-10-03'),
	('8850358371343', 'ST0001', '09:00:00', '2024-10-03'),

	('8850002020245', 'ST0005', '10:00:00', '2024-11-03'),
	('8850358371343', 'ST0007', '19:00:00', '2024-11-04'),
	('4800361028004', 'ST0009', '09:00:00', '2024-11-04'),
	('8859242900713', 'ST0003', '10:00:00', '2024-11-04'),
	('8850718801213', 'ST0010', '15:00:00', '2024-09-03'),
	('4710731050163', 'ST0004', '10:00:00', '2024-09-03'),
	('8850329102112', 'ST0002', '10:00:00', '2024-10-03'),
	('8850002020245', 'ST0008', '18:00:00', '2024-11-04'),
	('4710731050163', 'ST0006', '09:00:00', '2024-11-04'),
	('8850002020245', 'ST0001', '11:00:00', '2024-12-04');

 
CREATE TABLE Adds (
	PproductsID CHAR(13),
	Sstaff_ID CHAR(6),
	addTime TIME NOT NULL,
	adddate DATE NOT NULL,
	CONSTRAINT FK_pproductsID FOREIGN KEY(PproductsID)
	REFERENCES Product(prodID),
	CONSTRAINT FK_sstaff_ID FOREIGN KEY(Sstaff_ID)
	REFERENCES Staff(staffID)
);

INSERT INTO Adds(PproductsID, Sstaff_ID, addTime, addDate) VALUES
	("8850358371343", 'ST0003', "10:00:00", "2024-10-01"),
	("8851932295796", 'ST0005', "09:00:00", "2024-10-01"),
	("8850002020245", 'ST0008', "09:00:00", "2024-10-01"),
	("4710731050163", 'ST0001', "10:00:00", "2024-10-02"),
	("8859242900713", 'ST0007', "11:00:00", "2024-10-02"),
	("8850718801213", 'ST0002', "10:00:00", "2024-12-02"),
	("4800361028004", 'ST0010', "13:00:00", "2024-12-03"),
	("8851952350796", 'ST0004', "00:00:00", "2024-12-03"),
	("8850329102112", 'ST0009', "16:00:00", "2024-11-03"),
	("8850188270106", 'ST0006', "19:00:00", "2024-11-04"),

	("8859242900713", 'ST0005', "07:00:00", "2024-12-04"),
	("4710731050163", 'ST0008', "15:00:00", "2024-12-04"),
	("8850358371343", 'ST0002', "08:00:00", "2024-12-01"),
	("8851932295796", 'ST0001', "10:00:00", "2024-12-01"),
	("8850002020245", 'ST0006', "05:00:00", "2024-12-01"),
	("4800361028004", 'ST0009', "08:00:00", "2024-12-02"),
	("8850188270106", 'ST0003', "19:00:00", "2024-12-02"),
	("8850718801213", 'ST0007', "13:00:00", "2024-08-02"),
	("8850329102112", 'ST0010', "14:00:00", "2024-01-03"),
	("8851952350796", 'ST0004', "09:00:00", "2024-01-03"),

	("4710731050163", 'ST0008', "10:00:00", "2024-02-03"),
	("4800361028004", 'ST0005', "19:00:00", "2024-11-04"),
	("8850358371343", 'ST0006', "09:00:00", "2024-05-04"),
	("8850329102112", 'ST0009', "10:00:00", "2024-11-04"),
	("8850002020245", 'ST0001', "15:00:00", "2024-06-03"),
	("8851932295796", 'ST0007', "10:00:00", "2024-09-03"),
	("8850188270106", 'ST0002', "10:00:00", "2024-10-03"),
	("8859242900713", 'ST0003', "18:00:00", "2024-07-04"),
	("4800361028004", 'ST0004', "09:00:00", "2024-07-04"),
	("8850358371343", 'ST0008', "11:00:00", "2024-07-04");


