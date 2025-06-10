
Create Database RetailBusiness;

use RetailBusiness;

--Create the tables and insert the values.  
CREATE TABLE dbo.SUPPLY1 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 1 and 150),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY2 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 151 and 300),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY3 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 301 and 450),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY4 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 451 and 600),  
supplier CHAR(50)  
);  
GO  
--Create the view that combines all supplier tables.  
CREATE VIEW dbo.all_supplier_view  
WITH SCHEMABINDING  
AS  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY1  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY2  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY3  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY4;  
GO
INSERT dbo.all_supplier_view VALUES ('1', 'CaliforniaCorp'), ('5', 'BraziliaLtd')    
, ('231', 'FarEast'), ('280', 'NZ')  
, ('321', 'EuroGroup'), ('442', 'UKArchip')  
, ('475', 'India'), ('521', 'Afrique');  
GO

select * from dbo.SUPPLY1;

drop view all_supplier_view;

truncate table dbo.SUPPLY1;
truncate table dbo.SUPPLY2;
truncate table dbo.SUPPLY3;
truncate table dbo.SUPPLY4;


--it won't update
update  all_supplier_view
set supplier = 'chennai'
where supplyID between 100 and 200;

EXEC sp_helptext 'all_supplier_view';

select * from all_supplier_view;





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
Truncate table Sales;

-- Inserting  Values

Insert Into Sales (SaleDate,CustomerName,Product,Quantity,PricePerUnit,PaymentMethod) 
values ('2025-05-01','Alice','Headphones',2,	150.00,	'Card'),
('2025-05-02','Bob','Smartphone',1,700.00,'Online'),
('2025-05-03','Charlie','Charger',3,25.00,'Cash'),
('2025-05-03','Alice','Laptop',1,1200.00,'Card');



select * from Sales;
Go

Create View OrderDetails 
AS
Select * from Sales;
 GO
select * from OrderDetails;

update OrderDetails
set PaymentMethod = 'Handcash'
where CustomerName = 'Bob';

Exec sp_helptext'OrderDetails';
Go


alter View OrderDetails
As 
Select SaleId,SaleDate
from Sales
Go

Drop view OrderDetails;