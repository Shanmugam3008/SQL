
Use OrderManagementSystem;
-- Function
-- 1.	Create a scalar function fn_TotalOrderAmount(@OrderId INT) that returns the total amount for the given order.
GO
Create or Alter Function fn_TotalOrderAmount(@OrderId INT)
Returns Integer
AS
BEGIN
	Declare @TotalAmount Int;
	Select @TotalAmount =  Sum(Quantity*UnitPrice)
	From OrderDetails 
	where OrderId = @OrderId

	return @TotalAmount
END

Select dbo.fn_TotalOrderAmount(1006) As totalAmount;

Go
-- 2.	Create a scalar function fn_GetEmployeeFullName(@EmployeeId INT) that returns the concatenated full name (FirstName + LastName) of the employee.

Create Or Alter Function fn_GetEmployeeFullName(@EmployeeId INT)
Returns NVarchar(100)
AS
BEGIN
	Declare @FullName NVarchar(100);
	Select @FullName = FirstName+' '+LastName
	From Employees
	Where EmployeeId = @EmployeeId;
	Return @FullName
END

Select dbo.fn_GetEmployeeFullName(3001) AS FullName;
go
-- 3.	Create a table-valued function fn_GetOrdersByDateRange(@StartDate DATE, @EndDate DATE) to list orders between two dates.

Create or Alter Function fn_GetOrdersByDateRange(@StartDate DATE, @EndDate DATE)
Returns Table
AS
Return(
	Select * From Orders
	Where OrderDate Between @StartDate And @EndDate
)
Select * From dbo.fn_GetOrdersByDateRange('2025-02-01','2025-04-30');
Go
-- 4.	Create a scalar function fn_ProductStockValue(@ProductId INT) that calculates stock value (UnitPrice * UnitsInStock) of a product.

Create Or Alter Function fn_ProductStockValue(@ProductId INT)
Returns Int
AS
BEGIN
	Declare @TotalAmount NVarchar(100);
	Select @TotalAmount = UnitPrice * UnitsInStock 
	From Products
	Where ProductId = @ProductId
	Return @TotalAmount
END

Select dbo.fn_ProductStockValue(5006)As TotalAmount;

