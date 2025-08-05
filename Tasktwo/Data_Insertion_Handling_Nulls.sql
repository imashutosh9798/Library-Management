-- 1. Create Database and Use It
CREATE DATABASE IF NOT EXISTS MobileStore;
USE MobileStore;

-- 2. Create Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Brand VARCHAR(50),
    Price DECIMAL(10,2) DEFAULT 0.00,
    Stock INT DEFAULT 0,
    ReleaseDate DATE,
    WarrantyMonths INT
);


-- Normal insert 
INSERT INTO Products (ProductName, Brand, Price, Stock, ReleaseDate, WarrantyMonths)
VALUES ('Galaxy S22', 'Samsung', 799.99, 50, '2023-05-15', 24);

-- Insert with NULL values
INSERT INTO Products (ProductName, Brand, Price, Stock, ReleaseDate, WarrantyMonths)
VALUES ('iPhone 14', 'Apple', NULL, 30, '2023-09-20', NULL);

-- Insert using default values
INSERT INTO Products (ProductName, Brand)
VALUES ('OnePlus 11', 'OnePlus');

-- Insert partial values
INSERT INTO Products (ProductName, Price)
VALUES ('Pixel 7', 699.99);

-- Insert using SELECT
INSERT INTO Products (ProductName, Brand, Price, Stock, ReleaseDate, WarrantyMonths)
SELECT 'Galaxy S22 Ultra', 'Samsung', 1199.99, 20, '2023-06-10', 24;

-- 4. UPDATE Examples

-- Update single row
UPDATE Products
SET Price = 749.99
WHERE ProductID = 1;

-- Update multiple rows
UPDATE Products
SET Stock = Stock + 10
WHERE Brand = 'Samsung';

-- 5. DELETE Examples

-- Delete with condition
DELETE FROM Products
WHERE Stock = 0;


-- DELETE FROM Products;

-- 6. Handling NULLs

-- Find rows with NULL price
SELECT * FROM Products
WHERE Price IS NULL;

-- Replace NULL values in SELECT
SELECT ProductID, ProductName, IFNULL(Price, 0.00) AS Price
FROM Products;

-- 7. Example of ON DELETE CASCADE

-- Create Orders table linked to Products
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Insert sample order
INSERT INTO Orders (ProductID, Quantity)
VALUES (1, 2);

-- Now, deleting ProductID=1 from Products will also delete from Orders
DELETE FROM Products WHERE ProductID = 1;

-- Check Orders table
SELECT * FROM Orders;
