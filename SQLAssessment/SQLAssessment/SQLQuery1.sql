-- Q1 -- Hospital Management 

Create Table PatientDetails(
	PatientId Int Identity(201,1)NOT NULL,
	PatientName Nvarchar(30)NOT NULL,
	DateOfBirth date NOT NULL,
	Gender Nvarchar(30)NOT NULL,
	ContactNo Nvarchar(15),
	Constraint PK_PatientDetails Primary key (PatientId)
);

Create Table PatientAddress(
	Id Int Identity(1,1) Primary Key NOT NULL,
	PatientId Int NOT NULL,
	Address Nvarchar(200),
	Constraint FK_PatientAddress_PatientDetails Foreign key (PatientId) References PatientDetails(PatientId)
);

Create Table DepartmentDetails(
	DepartmentId Int Identity(401,1) NOT NULL,
	DepartmentName Nvarchar(100) NOT NULL,
	Constraint PK_DepartmentDetails Primary key (DepartmentId)

);

Create Table DoctorDetails(
	DoctorId Int Identity(301,1)NOT NULL,
	DoctorName Nvarchar(30)NOT NULL,
	ContactNo Nvarchar(15),
	DepartmentId Int NOT NULL
	Constraint PK_DoctorDetails Primary key (DoctorId)
	Constraint FK_DepartmentDetails_DoctorDetails Foreign key (DepartmentId) References DepartmentDetails(DepartmentId)
);

Create Table DoctorAddress(
	Id Int Identity(1,1)Primary Key NOT NULL,
	DoctorId Int NOT NULL,
	Address Nvarchar(200),
	Constraint FK_DoctorAddress_DoctorDetails Foreign key (DoctorId ) References DoctorDetails(DoctorId )
);

Create Table AppointmentDetails(
	AppointmentId Int Identity(101,1) NOT NULL,
	PatientId Int NOT NULL,
	DoctorId Int NOT NULL,
	DateOfVisit date NOT NULL,
	TimeOfvisit time NOT NULL,
	Mode Nvarchar(30) NOT NULL,
	Constraint PK_VisiterDetails Primary key (AppointmentId),
	Constraint FK_PatientDetails_AppointmentDetails Foreign key (PatientId) References PatientDetails(PatientId),
	Constraint FK_DoctorDetails_AppointmentDetails Foreign key (DoctorId) References DoctorDetails(DoctorId),
	Constraint UK_AppointmentDetails Unique (AppointmentId,PatientId,DoctorId,DateOfVisit,TimeOfvisit)	
);

Create Table Prescription(
	MedicationId Int Identity(601,1)NOT NULL,
	AppointmentId int NOT NULL,
	MedicineName Nvarchar(30 ),
	Dosage int,
	Frequency Tinyint,
	Duration int,
	Constraint PK_Medications Primary key (MedicationId),
	Constraint FK_AppointmentDetails_Medications Foreign key (AppointmentId) References AppointmentDetails(AppointmentId)
);

--Q2 - Order Management System

Create Table CustomersDetails(
	CustomerId Int Identity(201,1)NOT NULL,
	CustomerName Nvarchar(30)NOT NULL,
	ContactNo Nvarchar(15),
	Street Nvarchar(50),
	City Nvarchar(50),
	PostalCode Bigint
	Constraint PK_Customers Primary key (CustomerId)
);

Create Table Orders(
	Id Int Identity(201,1)NOT NULL,
	CustomerId int NOT NULL,
	OrderDate date,
	ToatalAmount int,
	Constraint PK_Orders Primary key (Id),
	Constraint FK_Orders_Customers Foreign key (CustomerId) References CustomersDetails(CustomerId)
);
 CREATE TABLE ProductsDetails(
	ProductId int IDENTITY(5001,1)PRIMARY KEY  NOT NULL,
	ProductName nvarchar(50) NOT NULL,
	UnitPrice int ,
);
Create Table OrderItemDetails(
	Id Int Identity(201,1) NOT NULL,
	OrderId int NOT NULL,
	ProductId int NOT NULL,
	Quantity int,
	CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY(OrderId) REFERENCES Orders(Id),
	CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(ProductId) REFERENCES ProductsDetails(ProductId)
);

INSERT INTO CustomersDetails (CustomerName, ContactNo, Street, City, PostalCode) VALUES
('Alice Johnson', '555-1234', '123 Maple St', 'Springfield', 12345),
('Bob Smith', '555-5678', '456 Oak Ave', 'Greenville', 67890),
('Charlie Brown', '555-8765', '789 Pine Rd', 'Fairview', 11223),
('Diana Prince', '555-4321', '321 Elm St', 'Rivertown', 44556);


INSERT INTO ProductsDetails (ProductName, UnitPrice) VALUES
('Laptop', 1200),
('Smartphone', 800),
('Keyboard', 50),
('Mouse', 30);

INSERT INTO Orders (CustomerId, OrderDate, ToatalAmount) VALUES
(201, '2025-06-01', 1280), 
(202, '2025-06-05', 830),  
(201, '2025-06-10', 80),   
(203, '2025-06-11', 50);   

INSERT INTO OrderItemDetails (OrderId, ProductId,Quantity) VALUES
(201, 5001,3), 
(201, 5004,4), 
(202, 5002,2), 
(203, 5003,3), 
(204, 5003,1); 


-- Q3 - find customers who have placed at least one order in each of the past 6 months

Create Table OrderTable(
	OrderId int,
	CustomerId int,
	Orderdate Date,
	TotalAmount int
);

INSERT INTO OrderTable (OrderId, CustomerId, OrderDate, TotalAmount) VALUES
(1, 101, '2025-01-01', 100),
(2, 101, '2025-01-05', 150),
(3, 101, '2025-01-10', 200),
(4, 101, '2025-01-15', 250),
(5, 101, '2025-01-20', 300),
(6, 101, '2025-01-25', 350),  -- 6 orders for customer 101
(7, 102, '2025-02-01', 120),
(11, 102, '2025-02-09', 140),
(7, 106, '2024-12-01', 100),
(7, 106, '2025-01-01', 100),
(7, 106, '2025-02-01', 100),
(7, 106, '2025-03-01', 100),
(7, 106, '2025-04-01', 100),
(7, 106, '2025-05-01', 100),
(7, 106, '2025-06-01', 100)


SELECT CustomerID
FROM OrderTable
WHERE OrderDate >= DATEADD(month, -6, GETDATE())
GROUP BY CustomerID
HAVING COUNT(DISTINCT MONTH(OrderDate)) = 6;


-- Q4 -- write a query to retrieve all employees who report directly or indirectly to a specific manager
 
-- Without CTE
use StudentDetails;
CREATE TABLE Employees (
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50),
    ReportsTo INT NULL,
	Salary int,
    CONSTRAINT FK_Employees_ReportsTo FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeId)
);

-- Insert top-level manager (no one to report to)
INSERT INTO Employees (FirstName, LastName, ReportsTo,Salary) VALUES
('Alice', 'Johnson', NULL,200000),
('Bob', 'Smith', 1,40000),
('Charlie', 'Brown', 1,500000),
('Diana', 'Prince', 2,40000),
('Eve', 'Adams', 3,30000);


Select E1.EmployeeId As ManagerId,E1.FirstName AS ManagerName,E.EmployeeId, E.FirstName As EmployeeName
From Employees E left join Employees E1 on E1.EmployeeId = E.ReportsTo

go
WITH DirectReports(ReportsTo, EmployeeID, FirstName) AS
(
    SELECT ReportsTo, EmployeeId, FirstName
    FROM dbo.Employees
    WHERE ReportsTo IS NULL
    UNION ALL
    SELECT e.ReportsTo, e.EmployeeId, e.FirstName
    FROM dbo.Employees AS e
        INNER JOIN DirectReports AS d
        ON e.ReportsTo = d.EmployeeId
)
SELECT ReportsTo As Manager, EmployeeId, FirstName
FROM DirectReports
ORDER BY ReportsTo;


-- Q5
-- SecondMaxSalary

Select MAX(Salary)
From Employees
Where Salary < (
	Select max(Salary)
	From Employees
)

-- Q6 can't able to figure out logic

-- Q7
-- stored procedure that:
--Accepts an OrderID as input
--Calculates the total cost of the order by joining Order Details and Products Returns the total
--Logs the result into an AuditLog table with the current timestamp


Create Table AuditLog (
	OrderId int,
	TotalAmount  Decimal(10,2),
	logdate Date
);

Create or alter Procedure Sp_TotalAmount @OrderId Int
AS
Begin
	
	Declare @TotalAmount decimal(10,2);


	Select @TotalAmount =  Sum(O.Quantity*P.UnitPrice)
	From OrderItemDetails O join ProductsDetails P ON O.ProductId = P.ProductId
	Where OrderId = @OrderId

	Insert Into AuditLog Values(@OrderId,@TotalAmount,GetDate())

	Select @TotalAmount As TotalAmount 

End

exec Sp_TotalAmount 201;

-- Q8 -- Write a table-valued function that returns customers who have not placed any orders in the last N months, where N is a parameter.


use Test;
Create Table CustomersDet(
	CustomerId Int Identity(201,1)NOT NULL,
	CustomerName Nvarchar(30)NOT NULL,
);

Create Table Orderrs(
	Id Int Identity(201,1)NOT NULL,
	CustomerId int NOT NULL,
	OrderDate date,
);

-- Insert customers
INSERT INTO CustomersDet (CustomerName) VALUES
('Alice'),
('Bob'),
('Charlie'),
('Diana'),
('Eve');

-- Insert orders
-- Alice (CustomerId 201) has 2 recent orders
INSERT INTO Orderrs (CustomerId, OrderDate) VALUES
(201, DATEADD(DAY, -10, GETDATE())),
(201, DATEADD(DAY, -5, GETDATE())),
(202, DATEADD(MONTH, -6, GETDATE())),
(204, DATEADD(DAY, -15, GETDATE()));



CREATE OR ALTER FUNCTION fn_Customer_Details (@N INT)
RETURNS TABLE
AS
RETURN (
    SELECT C.CustomerId, C.CustomerName
    FROM CustomersDet C
    LEFT JOIN Orderrs O 
        ON C.CustomerId = O.CustomerId 
        AND O.OrderDate BETWEEN DATEADD(MONTH, -@N, GETDATE()) AND GETDATE()
    GROUP BY C.CustomerId, C.CustomerName
    HAVING COUNT(O.Id) = 0
);
Select * From dbo.fn_Customer_Details(6);


--Q9 -- Create a view that shows each customer's most recent order, along with the order amount

Create Table OrderTable(
	OrderId int,
	CustomerId int,
	Orderdate Date,
	TotalAmount int
);

INSERT INTO OrderTable (OrderId, CustomerId, OrderDate, TotalAmount) VALUES
(1, 101, '2025-01-01', 100),
(2, 101, '2025-01-05', 150),
(3, 101, '2025-01-10', 200),
(4, 101, '2025-01-15', 250),
(5, 101, '2025-01-20', 300),
(6, 101, '2025-01-25', 350),  -- 6 orders for customer 101
(7, 102, '2025-02-01', 120),
(8, 102, '2025-02-03', 180),
(9, 102, '2025-02-05', 220),
(10, 102, '2025-02-07', 160),
(11, 102, '2025-02-09', 140);

INSERT INTO OrderTable (OrderId, CustomerId, OrderDate, TotalAmount) VALUES
(7, 106, '2024-12-01', 100),
(7, 106, '2025-01-01', 100),
(7, 106, '2025-02-01', 100),
(7, 106, '2025-03-01', 100),
(7, 106, '2025-04-01', 100),
(7, 106, '2025-05-01', 100),
(7, 106, '2025-06-01', 100)

CREATE or alter VIEW CustomerRecentOrders AS
WITH LatestOrders AS (
    SELECT 
        CustomerID,
        MAX(OrderDate) AS LastOrderDate
    FROM OrderTable
    GROUP BY CustomerID
    HAVING COUNT(CustomerID) > 5
)
SELECT 
    lo.CustomerID,
    lo.LastOrderDate,
    o.TotalAmount AS LastOrderAmount
FROM 
    LatestOrders lo
JOIN 
    OrderTable o 
    ON o.CustomerID = lo.CustomerID AND o.OrderDate = lo.LastOrderDate;

Select * From CustomerRecentOrders;



-- Q10 -- Create a deterministic scalar function that returns the square of a number and can be used in an indexed view

Create Or Alter Function fn_Square (@Number int)
returns Int
WITH SCHEMABINDING
As
Begin
	Declare @Square int;
	Set @Square = @Number * @Number;
	Return @Square;
End

Select Dbo.fn_Square(2) as SquareValue;

--Q11. Write a trigger that prevents a prouduct's price from being reduced by more than 20% of its prvious value during an update.

use StudentDetails;

CREATE TRIGGER trg_PreventLargePriceDrop
ON ProductsDetails
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        Select 1
        From inserted i
        JOIN deleted d ON i.ProductID = d.ProductID
        Where i.UnitPrice < d.UnitPrice * 0.8
    )
    BEGIN
        RAISERROR('Update blocked', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    UPDATE p
    Set 
        p.ProductName = i.ProductName,
        p.UnitPrice = i.UnitPrice
    From ProductsDetails p
    JOIN inserted i ON p.ProductID = i.ProductID;
END;

Update ProductsDetails
set UnitPrice = 10
where ProductName = 'Keyboard';
 

 -- Q12 --  Write a trigger that captures any row deleted from the Employee table and inserts it into an Employee Archive table, along with the current timestamp.

CREATE TABLE emp(
    id INT Identity(1,1) PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100)
);
CREATE TABLE EmployeeArchive (
    id INT,
    name VARCHAR(100),
    position VARCHAR(100),
    deleted_at	Datetime DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO emp (name, position)
VALUES ('Alice Johnson', 'Manager'),
       ('Bob Smith', 'Developer'),
       ('Carol White', 'Analyst');



CREATE TRIGGER TriggerOnDelete
ON emp
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeArchive (id,name, position)
    SELECT id, name, position
    FROM deleted;
END;

Delete emp
Where position = 'Analyst';

select * From EmployeeArchive;

-- Q13 -- Define a user-defined data type (UDDT) for international phone numbers that: Must begin with a + sign

Create Type PhoneNumber From Nvarchar(20);
CREATE TABLE EmployeeDetails (
    EmployeeID INT Identity(1,1) PRIMARY KEY ,
    Name VARCHAR(255),
	ContactNo PhoneNumber CHECK (ContactNo LIKE '+%[0-9]%')
);

Insert Into EmployeeDetails values('san','+9876765432');

Select * From EmployeeDetails;


--Q14. 
--Write a T-SQL block using TRY...CATCH that:
--Attempts to insert a row into a table
--On failure, rolls back the transaction
--Logs the error number and message to an ErrorLog table

Create Table ErrorLog (
	ErrorNumber int,
	ErrorMessage Nvarchar(500)
);

BEGIN TRY
    BEGIN TRANSACTION;
    INSERT INTO EmployeeDetails ( Name,ContactNo)
    VALUES ('Mani', '9962075982'); 
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    DECLARE @ErrNum INT = ERROR_NUMBER();
    DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
    INSERT INTO ErrorLog (ErrorNumber, ErrorMessage)
    VALUES (@ErrNum, @ErrMsg);
END CATCH;

 Select * From ErrorLog;

-- Q15 -- Design a Training Management System that manages

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(20)
);
 
CREATE TABLE Trainees (
    TraineeID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    ContactNo NVARCHAR(20),
    DateOfBirth DATE,
);
 
CREATE TABLE Sessions (
    SessionID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    TrainerID INT NOT NULL,
    StartDateTime DATETIME NOT NULL,
    EndDateTime DATETIME NOT NULL,
    Location NVARCHAR(100),
    CONSTRAINT FK_Session_Trainers FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);
 
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    SessionID INT NOT NULL,
    TraineeID INT NOT NULL,
    AttendanceStatus NVARCHAR(20) NOT NULL CHECK (AttendanceStatus IN ('Present', 'Absent')),
    AttendanceDateTime DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Attendance_Session FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    CONSTRAINT FK_Attendance_Trainee FOREIGN KEY (TraineeID) REFERENCES Trainees(TraineeID),
    CONSTRAINT UQ_Attendance_Session_Trainee UNIQUE (SessionID, TraineeID)
);

-- Insert Trainers
INSERT INTO Trainers (Name, Email, Phone)
VALUES
    ('John Doe', 'john.doe@example.com', '123-456-7890'),
    ('Jane Smith', 'jane.smith@example.com', '987-654-3210');

-- Insert Trainees
INSERT INTO Trainees (Name, Email, ContactNo, DateOfBirth)
VALUES
    ('Michael Johnson', 'michael.johnson@example.com', '555-0101', '1995-06-15'),
    ('Sarah Williams', 'sarah.williams@example.com', '555-0102', '1996-07-25'),
    ('David Brown', 'david.brown@example.com', '555-0103', '1994-12-10');

-- Insert Sessions
INSERT INTO Sessions (Title, Description, TrainerID, StartDateTime, EndDateTime, Location)
VALUES
    ('SQL Basics', 'Introduction to SQL and relational databases', 1, '2025-06-19 09:00', '2025-06-19 12:00', 'Room 101'),
    ('Advanced SQL Queries', 'Deep dive into SQL queries, subqueries, and joins', 2, '2025-06-20 09:00', '2025-06-20 12:00', 'Room 102'),


-- Insert Attendance
INSERT INTO Attendance (SessionID, TraineeID, AttendanceStatus)
VALUES
    (1, 1, 'Present'),
    (2, 2, 'Absent');


CREATE PROCEDURE AddTraineeAttendance
    @SessionID INT,
    @TraineeID INT,
    @AttendanceStatus NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    -- Validate AttendanceStatus
    IF @AttendanceStatus NOT IN ('Present', 'Absent')
    BEGIN
        RAISERROR('Invalid attendance status. Must be either "Present" or "Absent".', 16, 1);
        RETURN;
    END

    -- Check if attendance already exists for this trainee in the session
    IF EXISTS (
        SELECT 1 
        FROM Attendance 
        WHERE SessionID = @SessionID AND TraineeID = @TraineeID
    )
    BEGIN
        RAISERROR('Attendance already recorded for this trainee in the session.', 16, 1);
        RETURN;
    END

    -- Insert attendance record
    INSERT INTO Attendance (SessionID, TraineeID, AttendanceStatus)
    VALUES (@SessionID, @TraineeID, @AttendanceStatus);
    
    PRINT 'Attendance recorded successfully.';
END;

exec AddTraineeAttendance 1,3,'Present';

select * From Attendance;


-- Q3 didn't complete

CREATE or alter  VIEW vw_TraineeAttendanceRate AS
SELECT 
    T.TraineeID,
    T.Name AS TraineeName,
    COUNT(A.SessionID) AS TotalSessions,
    SUM(CASE WHEN A.AttendanceStatus = 'Present' THEN 1 ELSE 0 END) AS SessionsPresent,
    CAST(
        100.0 * SUM(CASE WHEN A.AttendanceStatus = 'Present' THEN 1 ELSE 0 END) / COUNT(A.SessionID)
        AS DECIMAL(5,2)
    ) AS AttendanceRatePercent
FROM 
    Trainees T
JOIN 
    Attendance A ON T.TraineeID = A.TraineeID
GROUP BY 
    T.TraineeID, T.Name;

	Select * From vw_TraineeAttendanceRate;

Create Table Warning(
	TraineeId int,
	AttentancePrecentage Decimal(10,2),
	Warning Nvarchar(100)
);

Create or Alter Function AttendencePrecentage (@TrainneID int)
Returns Decimal(10,2)
AS
Begin

	Declare @Percent Decimal(10,2);
	Select @Percent =  CAST(100.0 * SUM(CASE WHEN A.AttendanceStatus = 'Present' THEN 1 ELSE 0 END) / COUNT(A.SessionID) AS Decimal(10,2)) 
	From Attendance A
	Where @TrainneID  = A.TraineeID
	Group by A.TraineeId
	Return @Percent;

End
Select Dbo.AttendencePrecentage(2);

--Q4

Create Or Alter Trigger WarnningTrigger On Attendance
After Insert 
AS
Begin 
	INSERT INTO Warning (TraineeId, AttentancePrecentage, Warning)
    SELECT i.TraineeId, dbo.AttendencePrecentage(i.TraineeId), 'Less Attendance Percentage'
    FROM inserted i
    WHERE dbo.AttendencePrecentage(i.TraineeId) < 70.00;
	
End

Select * from Attendance;

INSERT INTO Attendance (SessionID, TraineeID, AttendanceStatus)
VALUES
    (1, 2, 'Present');

Select * from Warning;

CREATE  TABLE Attendancelog (
    AttendanceID ,
    SessionID INT NOT NULL,
    TraineeID INT NOT NULL,
    AttendanceStatus NVARCHAR(20) NOT NULL CHECK (AttendanceStatus IN ('Present', 'Absent')),
    AttendanceDateTime DATETIME NOT NULL,
	InsertOrDelete NVarchar(20) Check(InsertOrDelete in ('Insert','Delete')),
	DateTimeOfLog DateTime Default GetDate()
);
Drop Table Attendancelog;
Go

Create Or Alter Trigger DeleteEvent On Attendance
After insert,Delete

As 
Begin
	SET IDENTITY_INSERT Attendancelog ON;
	if Exists(
		Select 1 From inserted
	)
	Begin
		Insert Into Attendancelog (AttendanceId,SessionID,TraineeID,AttendanceStatus,AttendanceDateTime,InsertOrDelete)
		Select AttendanceId,SessionID,TraineeID,AttendanceStatus,AttendanceDateTime,'Insert'
		From Inserted
	End

	if Exists(
		Select 1 From deleted
	)
	Begin
		Insert Into Attendancelog (AttendanceId,SessionID,TraineeID,AttendanceStatus,AttendanceDateTime,InsertOrDelete)
		Select AttendanceId,SessionID,TraineeID,AttendanceStatus,AttendanceDateTime,'Delete'
		From deleted
	End
	SET IDENTITY_INSERT Attendancelog OFF;
End

Go


truncate Table Attendance;
Truncate Table Warning;


Select * From Attendance;
Select * from Warning;
Select * from Attendancelog;

Delete Attendance
Where TraineeId = 2;