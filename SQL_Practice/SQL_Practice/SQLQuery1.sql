-- creating Database

create database RetailBusiness;

-- Create Table 

Create table Sales(
	
	SaleId Int Identity(101,1),
	SaleDate Date,
	CustomerName varchar(15),
	Product varchar(15),
	Quantity Int,
	PricePerUnit decimal(10,2),
	PaymentMethod varchar(15)

);

--drop table Sales;
--Truncate table Sales;

-- Inserting  Values

Insert Into Sales (SaleDate,CustomerName,Product,Quantity,PricePerUnit,PaymentMethod) 
values ('2025-05-01','Alice','Headphones',2,	150.00,	'Card'),
('2025-05-02','Bob','Smartphone',1,700.00,'Online'),
('2025-05-03','Charlie','Charger',3,25.00,'Cash'),
('2025-05-03','Alice','Laptop',1,1200.00,'Card');


-- Update the payment method to 'Online' for all sales made by 'Alice'

Update Sales
Set PaymentMethod = 'Online'
Where CustomerName = 'Alice';

--  Update the price per unit of 'Charger' to 30.00.

Update Sales
Set PricePerUnit = 30
Where Product = 'Charger';

-- Delete all sales records where the quantity is less than 2.

Delete  Sales
Where  CustomerName = 'Bob';

-- Delete the record of any sale made by 'Bob'

Delete  Sales
Where  Quantity < 2; 


Insert Into Sales (SaleDate,CustomerName,Product,Quantity,PricePerUnit,PaymentMethod) 
values ('2025-05-01','Alice','Headphones',2,	1500.00,	'Card');

-- List all sales made using the 'Card' payment method

Select * from Sales
Where PaymentMethod = 'Card';

-- Calculate the total revenue generated (Quantity × PricePerUnit).

select CustomerName,(PricePerUnit * Quantity) As TotalRevenue
from Sales;

select SUM(PricePerUnit * Quantity) As TotalRevenue
from Sales;

-- Display the total quantity of each product sold.

Select Product , sum(Quantity) as TotalQuantity
from Sales
group by Product ;

-- Show all sales where the quantity sold is more than 1.

Select * from Sales
Where Quantity > 1;

--  Find the customer who spent the most in a single transaction

select SaleId , CustomerName , PricePerUnit * Quantity as maxSpent 
from Sales
Where PricePerUnit * Quantity = (select max(PricePerUnit * Quantity) from Sales);


Select top 1 CustomerName , PricePerUnit* Quantity As spent
from Sales
Order by spent desc ;


select * from Sales;
