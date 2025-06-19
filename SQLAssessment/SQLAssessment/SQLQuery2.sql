
--Q4 with CTE

-- Create an Employee table.
CREATE TABLE dbo.MyEmployees
(
EmployeeID SMALLINT NOT NULL,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(40) NOT NULL,
Title NVARCHAR(50) NOT NULL,
DeptID SMALLINT NOT NULL,
ManagerID SMALLINT NULL,
CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC),
CONSTRAINT FK_MyEmployees_ManagerID_EmployeeID FOREIGN KEY (ManagerID) REFERENCES dbo.MyEmployees (EmployeeID)
);
-- Populate the table with values.
INSERT INTO dbo.MyEmployees VALUES
(1, N'Ken', N'Sánchez', N'Chief Executive Officer',16, NULL)
,(273, N'Brian', N'Welcker', N'Vice President of Sales', 3, 1)
,(274, N'Stephen', N'Jiang', N'North American Sales Manager', 3, 273)
,(275, N'Michael', N'Blythe', N'Sales Representative', 3, 274)
,(276, N'Linda', N'Mitchell', N'Sales Representative', 3, 274)
,(285, N'Syed', N'Abbas', N'Pacific Sales Manager', 3, 273)
,(286, N'Lynn', N'Tsoflias', N'Sales Representative', 3, 285)
,(16, N'David', N'Bradley', N'Marketing Manager', 4, 273)
,(23, N'Mary', N'Gibson', N'Marketing Specialist', 4, 16);


WITH DirectReports(ManagerID, EmployeeID, Title) AS
(
    SELECT ManagerID, EmployeeID, Title
    FROM dbo.MyEmployees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.ManagerID, e.EmployeeID, e.Title
    FROM dbo.MyEmployees AS e
        INNER JOIN DirectReports AS d
        ON e.ManagerID = d.EmployeeID
)
SELECT ManagerID, EmployeeID, Title
FROM DirectReports
ORDER BY ManagerID;

WITH DirectReports(ManagerID, EmployeeID, Title, EmployeeLevel) AS
(
    SELECT ManagerID, EmployeeID, Title, 0 AS EmployeeLevel
    FROM dbo.MyEmployees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.ManagerID, e.EmployeeID, e.Title, EmployeeLevel + 1
    FROM dbo.MyEmployees AS e
        INNER JOIN DirectReports AS d
        ON e.ManagerID = d.EmployeeID
)
SELECT ManagerID, EmployeeID, Title, EmployeeLevel
FROM DirectReports
WHERE EmployeeLevel <= 2 ;

-- Q 6
Create Table Product7DayRolling(
	ProductId int,
	salesDate Date,
	Amount int
);

select DistinctDate.*,
       avg(Total) over(partition by productid order by productid, date rows between 6 preceding and current row) as rolling_avg
  from (select ProductId, salesDate, sum(Amount) as Total
          from Product7DayRolling
         group by ProductId, salesDate) DistinctDate

-- Q15 3

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

--Q15  4

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

