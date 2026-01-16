USE pj2sec03gr06db;

-- 6688069 Worasuda Ngamyingsurat --
-- Query 1
SELECT prodID, prodName, EXPdate, PpromoID
FROM product
WHERE YEAR(EXPdate) = YEAR(CURDATE()) AND PpromoID IS NOT NULL
ORDER BY prodID ASC;

-- Query 2
SELECT staffID, CONCAT(staffFname, ' ', staffLname) AS 'Staff name', staffBdate, staffTel
FROM staff
WHERE staffGender = 'M' AND YEAR(staffBdate) < 2000
ORDER BY staffID ASC;

-- Query 3
SELECT orderDate, ROUND(AVG(orderPrice), 2) AS 'Average price of orders'
FROM orders
GROUP BY orderDate
HAVING AVG(orderPrice) > 1000;

-- Query 4
SELECT DISTINCT c.cashierID, CONCAT(c.cashierFname, ' ', c.cashierLname) AS 'Cashier name', o.orderPrice, p.bankName
FROM make m
INNER JOIN orders o ON m.OorderrID = o.orderID
INNER JOIN payment p ON m.PpaymentID = p.payID
INNER JOIN cashier c ON m.CcashierID = c.cashierID
WHERE c.workingHours = 'Morning'
ORDER BY c.cashierID;

-- Query 5
SELECT p.prodID, p.prodName, m.promo_name, CONCAT(m.discount, '%') AS 'Discount'
FROM product p
LEFT OUTER JOIN promotion m ON p.PpromoID = m.promoID
WHERE p.prodID LIKE '88%'
ORDER BY p.prodID ASC;


-- 6688072 Kemjira Nugboon --
-- Query 6
SELECT customerID,concat(customerFname," ",customerLname) AS Name,
(year(curdate())-year(customerBdate)) AS Age
FROM Customer 
WHERE (year(curdate())-year(customerBdate)) > 25 AND customerGender= 'F'
ORDER BY Age ASC;

-- Query 7
SELECT orderID,ROUND(orderPrice) as Price
FROM ORDERS
ORDER BY orderPrice DESC;

-- Query 8
SELECT PproductID,SUM(amount) AS total_amount
FROM CheckAmount 
WHERE amountDate ='2024-11-05'
GROUP BY PproductID 
HAVING total_amount > 500;

-- Query 9
SELECT DISTINCT prodID,prodName,prodPrice
FROM Product p
INNER JOIN Refund r 
ON p.prodID = r.PproddID;

-- Query 10
SELECT s.staffID,concat(staffFname," ",staffLname) as Name,PproducttID,removeTime,removeDate
FROM Staff s
LEFT OUTER JOIN Removes r 
ON  s.staffID = r.SstaffsID;


-- 6688099 Nuttanan Reamprasert --
-- Query 11
SELECT promo_name , discount, specialoffers, member_bene
FROM Promotion
WHERE promo_name LIKE "H%" AND discount >= 15;

-- Query 12
SELECT customerID,UPPER(CONCAT(customerFname," ",customerLname)) AS CustomerFullName, customerGender
FROM Customer;

-- Query 13
SELECT promoID,AVG(discount) AS avgDiscount
FROM Promotion  
WHERE promo_name LIKE "H%"  
GROUP BY promoID  
HAVING avgDiscount >= 5;

-- Query 14
SELECT DISTINCT staffID, staffFname, staffLname, promo_name, specialoffers, member_bene
FROM Staff s
INNER JOIN Promotion p 
ON s.staffID = p.SstaffID;

-- Query 15
SELECT prodID, prodName , prodPrice
FROM Product
LEFT OUTER JOIN Promotion ON Product.PpromoID=Promotion.promoID
WHERE prodPrice > 50;


-- 6688129 Patsatraporn Thongdeesakul --
-- Query 16
SELECT orderID, orderName, orderPrice, orderTime
FROM Orders
WHERE orderPrice >= 300 AND orderTime >'13:00:00' 
ORDER BY orderID;

-- Query 17
SELECT customerID, CONCAT(customerFname, " ", customerLname) AS "Full name" ,customerBdate
FROM Customer
WHERE customerBdate > '1989-12-31';

-- Query 18
SELECT prodName, MIN(prodPrice) AS MinPrice
FROM Product
WHERE EXPdate < '2025-01-01'
GROUP BY prodName
ORDER BY MIN(prodPrice) ASC
LIMIT 1 ;

-- Query 19
SELECT s.supID,CONCAT(s.supFname, " ", s.supLname) AS "Full name", p.prodName
FROM Supplier s
INNER JOIN Product p 
ON s.supID = p.SsupID
WHERE s.supID = 'S00003';

-- Query 20
SELECT 
    p.prodID, 
    p.prodName, 
    d.deliverTime, 
    d.deliverDate
FROM Product p
LEFT OUTER JOIN Deliver d 
ON p.prodID = d.PproductID
WHERE p.prodID = '8850188270106';


-- 6688210 Thanaporn Pinsakul--
-- Query 21
SELECT cashierID, cashierFname, cashierTel, workingHours 
FROM Cashier 
WHERE cashierFname LIKE 'S%' AND workingHours = 'Night'; 

-- Query 22
SELECT supID, UPPER(CONCAT(supFname," ", supLname)) AS "Full Name", supEmail
FROM Supplier
WHERE supLname LIKE 'P%';

-- Query 23
SELECT orderID AS "Order ID", orderName AS "Order Name", orderPrice AS "Price"
FROM Orders
WHERE orderDate = '2024-11-02'
GROUP BY orderID
HAVING Price > 250
ORDER BY Price DESC;

-- Query 24
SELECT DISTINCT supFname AS "First Name", supLname AS "Last Name", supID AS "ID"
FROM Supplier sp
INNER JOIN Checks ch ON sp.supID = ch.SsupplierID
ORDER BY supFname ASC;

-- Query 25
SELECT p.prodName AS "Product", pr.promo_name AS "Promotion", pr.promoID AS "Promotion ID", p.prodPrice AS "Price"
FROM Product p
RIGHT OUTER JOIN Promotion pr
ON p.PpromoID = pr.promoID;
