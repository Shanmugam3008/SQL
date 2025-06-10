Create Table SuplierDetails (
	Suplier_Id int identity(101,1),
	Suplier_Name Nvarchar(30),
	Constraint PK_SuplierDetails Primary Key (Suplier_Id)
);

Create Table ProductDetails (
	Product_Id int Identity (201,1),
	Product_Name Nvarchar(30),
	Constraint PK_ProductDetails Primary Key (Product_Id)
);

Create Table LocationDetails(
	Location_code int,
	Location_Name Nvarchar(30),
	Constraint PK_LocationDetails Primary Key (Location_code)

);

Create Table SaleDetails(
	Suplier_Id int,
	Product_Id int,
	Location_code int,
	Constraint PK_SaleDetails Primary key (Suplier_Id,Product_Id,Location_code),
	Constraint FK_SalesDetail_SuplierDetails Foreign key (Suplier_Id) References SuplierDetails(Suplier_Id),
	Constraint FK_SalesDetail_ProductDetails Foreign key (Product_Id) References ProductDetails(Product_Id),
	Constraint FK_SalesDetail_LocationDetails Foreign key (Location_code) References LocationDetails(Location_code)
);