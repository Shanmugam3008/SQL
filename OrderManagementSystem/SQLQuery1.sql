

CREATE TABLE Region(
	[RegionId] [int] IDENTITY(6001,1) PRIMARY KEY NOT NULL,
	[RegionDescription] [nvarchar](100) NULL,
 );



CREATE TABLE Suppliers(
	[SupplierId] [int] IDENTITY(4001,1)PRIMARY KEY  NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [bigint] NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [bigint] NULL,
	[Fax] [bigint] NULL,
);

CREATE TABLE Shippers(
	[ShipperId] [int] IDENTITY(8001,1)PRIMARY KEY  NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[PhoneNo] [bigint] NULL,
);

 CREATE TABLE Employees(
	[EmployeeId] [int] IDENTITY(3001,1)PRIMARY KEY NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[TitleOfCourtecy] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [bigint] NULL,
	[Country] [nvarchar](50) NULL,
	[HomePhone] [bigint] NULL,
	[ReportsTo] [int] NULL,
	CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])REFERENCES [dbo].[Employees] ([EmployeeId])
);

 CREATE TABLE Territories(
	[TerritoryId] [int] IDENTITY(7001,1)Primary key NOT NULL,
	[TerritoryDescription] [nvarchar](100) NULL,
	[RegionId] [int] NULL,
	CONSTRAINT [Fk_Territories_Region] FOREIGN KEY([RegionId])REFERENCES [dbo].[Region] ([RegionId])
);

 CREATE TABLE EmployeeTerritory(
	[EmployeeId] [int] NOT NULL,
	[TerritoryId] [int] NOT NULL,
	CONSTRAINT [Pk_EmployeeTerritory] PRIMARY KEY (EmployeeId,TerritoryId),
	CONSTRAINT [Fk_Territories_Employees] FOREIGN KEY([EmployeeId])REFERENCES [dbo].[Employees] ([EmployeeId]),
	CONSTRAINT [Fk_Territories_Territories] FOREIGN KEY([TerritoryId])REFERENCES [dbo].[Territories] ([TerritoryId])
 );


CREATE TABLE Customers(
	[CustomerId] [int] IDENTITY(2001,1)PRIMARY KEY  NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [bigint] NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [bigint] NULL,
	[Fax] [bigint] NULL,
);
CREATE TABLE Category(
	[CategoryId] [int] IDENTITY(6001,1)PRIMARY KEY  NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
);

 CREATE TABLE Products(
	[ProductId] [int] IDENTITY(5001,1)PRIMARY KEY  NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[SupplierId] [int] NULL,
	[CategoryId] [int] NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitPrice] [int] NULL,
	[UnitsInStock] [int] NULL,
	[UnitsOnOrder] [int] NULL,
	CONSTRAINT [Fk_Products_Category] FOREIGN KEY([CategoryId]) REFERENCES [dbo].[Category] ([CategoryId]),
	CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierId]) REFERENCES [dbo].[Suppliers] ([SupplierId]),
);

CREATE TABLE Orders(
	[OrderId] [int] IDENTITY(1001,1)PRIMARY KEY NOT NULL,
	[CustomerId] [int] NULL,
	[EmployeeId] [int] NULL,
	[OrderDate] [date] NULL,
	[RequiredDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[Freight] [nvarchar](50) NULL,
	[ShipperId] [int] NULL,
	[ShipVia] [int] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipCity] [nvarchar](50) NULL,
	[ShipRegion] [nvarchar](50) NULL,
	[ShipPosaltCode] [bigint] NULL,
	[ShipCountry] [nvarchar](50) NULL,
	 CONSTRAINT [Fk_Orderes_Customers] FOREIGN KEY([CustomerId])REFERENCES [dbo].[Customers] ([CustomerId]),
	 CONSTRAINT [Fk_Orderes_Employees] FOREIGN KEY([EmployeeId])REFERENCES [dbo].[Employees] ([EmployeeId]),
	 CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperId])REFERENCES [dbo].[Shippers] ([ShipperId])
);

CREATE TABLE OrderDetails(
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	CONSTRAINT [PK_OrderDetails] PRIMARY KEY (OrderId,ProductId),
	CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])REFERENCES [dbo].[Orders] ([OrderId]),
	CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])REFERENCES [dbo].[Products] ([ProductId])
 );
