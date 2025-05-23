CREATE DATABASE NORMAL;


-- Create an unnormalized table with >10 attributes and repeating groups
CREATE TABLE Orders_Unnormalized_Detail (
    OrderID INT,
    CustomerName VARCHAR(100),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    OrderDate DATE,
    ShippingMethod VARCHAR(100),
    Products VARCHAR(255),       -- Repeating group
    Quantities VARCHAR(100),     -- Repeating group
    Prices VARCHAR(100),         -- Repeating group
    Discounts VARCHAR(100)       -- Repeating group
);

CREATE TABLE Orders_Unnormalized_Detail_1N (
    OrderID INT,
    CustomerName VARCHAR(100),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    OrderDate DATE,
    ShippingMethod VARCHAR(100),
    ProductsName VARCHAR(255),       -- Repeating group
    QuantitiesPer VARCHAR(100), 
	PricesPer VARCHAR(100),			-- Repeating group       
    DiscountsPer VARCHAR(100)       -- Repeating group
);


-- Insert 10 rows of unnormalized data
INSERT INTO Orders_Unnormalized_Detail VALUES
(101, 'Alice', '1234567890', '123 Main St', 'New York', '10001', 'USA', '2024-05-01', 'FedEx', 'Pen, Pencil', '2, 5', '1.00, 0.50', '0, 5'),
(102, 'Bob', '9876543210', '456 Elm St', 'Los Angeles', '90001', 'USA', '2024-05-02', 'UPS', 'Notebook', '3', '2.50', '10'),
(103, 'Charlie', '5647382910', '789 Oak St', 'Chicago', '60601', 'USA', '2024-05-03', 'DHL', 'Eraser, Marker', '1, 2', '0.75, 1.25', '0, 0'),
(104, 'David', '1122334455', '321 Pine St', 'Houston', '77001', 'USA', '2024-05-04', 'USPS', 'Pen', '10', '1.00', '0'),
(105, 'Eva', '2233445566', '654 Maple St', 'Phoenix', '85001', 'USA', '2024-05-05', 'FedEx', 'Pencil, Ruler', '3, 1', '0.50, 1.00', '5, 0'),
(106, 'Frank', '9988776655', '987 Cedar St', 'Philadelphia', '19101', 'USA', '2024-05-06', 'UPS', 'Marker, Eraser, Ruler', '1, 2, 1', '1.25, 0.75, 1.00', '0, 5, 0'),
(107, 'Grace', '7766554433', '159 Walnut St', 'San Diego', '92101', 'USA', '2024-05-07', 'DHL', 'Pen', '1', '1.00', '0'),
(108, 'Henry', '4455667788', '753 Birch St', 'Dallas', '75201', 'USA', '2024-05-08', 'USPS', 'Notebook, Pencil', '2, 4', '2.50, 0.50', '10, 0'),
(109, 'Irene', '6677889900', '852 Spruce St', 'San Jose', '95101', 'USA', '2024-05-09', 'FedEx', 'Ruler', '1', '1.00', '0'),
(110, 'Jack', '3344556677', '951 Poplar St', 'Austin', '73301', 'USA', '2024-05-10', 'UPS', 'Pen, Pencil, Eraser', '1, 2, 1', '1.00, 0.50, 0.75', '0, 5, 0');



SELECT * FROM Orders_Unnormalized_Detail;

Insert Into Orders_Unnormalized_Detail_1N  ( OrderID,CustomerName ,ContactNumber,Address , City ,PostalCode,Country ,OrderDate,ShippingMethod ,ProductsName, QuantitiesPer, PricesPer,DiscountsPer  ) 
select  OrderID,CustomerName ,ContactNumber,Address , City ,PostalCode,Country ,OrderDate,ShippingMethod ,TRIM(value) AS ProductsName ,TRIM(value) AS QuantitiesPer,TRIM(value) AS PricesPer,TRIM(value) AS DiscountsPer 
from Orders_Unnormalized_Detail