-- Create the original table
CREATE TABLE Orders_Unnormalized_Detail (
    OrderID INT,
    CustomerName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50),
    OrderDate DATE,
    ShippingMethod VARCHAR(50),
    Products VARCHAR(255),
    Quantities VARCHAR(255),
    Prices VARCHAR(255),
    Discounts VARCHAR(255)
);

-- Insert the original data
INSERT INTO Orders_Unnormalized_Detail (OrderID, CustomerName, ContactNumber, Address, City, PostalCode, Country, OrderDate, ShippingMethod, Products, Quantities, Prices, Discounts) VALUES
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

-- Create the new table to store the transformed data
CREATE TABLE Orders_Normalized_Detail (
    OrderID INT,
    CustomerName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50),
    OrderDate DATE,
    ShippingMethod VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    Discount INT
);

TRUNCATE TABLE Orders_Normalized_Detail ;
WITH SplitData AS (
    SELECT 
        OrderID, 
        CustomerName, 
        ContactNumber, 
        Address, 
        City, 
        PostalCode, 
        Country, 
        OrderDate, 
        ShippingMethod, 
        p.value AS Product, 
        q.value AS Quantity, 
        pr.value AS Price, 
        d.value AS Discount,
        ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY (SELECT NULL)) AS RowNum
    FROM Orders_Unnormalized_Detail
    CROSS APPLY STRING_SPLIT(Products, ',') AS p
    CROSS APPLY STRING_SPLIT(Quantities, ',') AS q
    CROSS APPLY STRING_SPLIT(Prices, ',') AS pr
    CROSS APPLY STRING_SPLIT(Discounts, ',') AS d
)
INSERT INTO Orders_Normalized_Detail (OrderID, CustomerName, ContactNumber, Address, City, PostalCode, Country, OrderDate, ShippingMethod, Product, Quantity, Price, Discount)
SELECT 
    OrderID, 
    CustomerName, 
    ContactNumber, 
    Address, 
    City, 
    PostalCode, 
    Country, 
    OrderDate, 
    ShippingMethod, 
    TRIM(Product) AS Product, 
    CAST(TRIM(Quantity) AS INT) AS Quantity, 
    CAST(TRIM(Price) AS DECIMAL(10, 2)) AS Price, 
    CAST(TRIM(Discount) AS INT) AS Discount
FROM SplitData
WHERE RowNum <= (SELECT COUNT(*) FROM STRING_SPLIT(Product, ','));



-- Select the data from the new table to verify the transformation
SELECT * FROM Orders_Normalized_Detail;
SELECT * FROM Orders_Unnormalized_Detail;

