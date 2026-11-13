-- ==================================================
-- PLP WEEK 7 ASSIGNMENT
-- DATABASE DESIGN AND NORMALIZATION
-- Student Name: Peter Ochihai Omiyang
-- Date: 2026-11-13
-- ==================================================


-- ==========================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ==========================================

-- Each row will contain only one product per order.
-- The composite primary key is OrderID and Product.

-- Create the normalized table

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert the normalized records

INSERT INTO ProductDetail_1NF
    (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Display the normalized records

SELECT * FROM ProductDetail_1NF;


-- ==========================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- ==========================================

-- Partial dependency:
-- CustomerName depends only on OrderID,
-- not on the complete composite key (OrderID, Product).
--
-- To achieve 2NF, separate order information
-- from product and quantity information.


-- Create the Orders table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the OrderItems table

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert records into the Orders table

INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Insert records into the OrderItems table

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Display the Orders records

SELECT * FROM Orders;

-- Display the OrderItems records

SELECT * FROM OrderItems;

-- Display order information together with products

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID;


-- ==========================================
-- END OF WEEK 7 ASSIGNMENT
-- ==========================================
