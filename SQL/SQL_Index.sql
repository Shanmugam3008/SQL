-- Make sure the table exists
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    StudentName NVARCHAR(100)
);
GO

-- Declare the variable and start the loop
DECLARE @i INT = 1;

WHILE @i <= 500
BEGIN
    INSERT INTO Students (StudentName)
    VALUES ('Student ' + CAST(@i AS NVARCHAR));

    SET @i = @i + 1;
END


select * from Students;

select StudentID,StudentName
From Students
Where StudentID = 250;

Alter table Students 
drop Constraint PK__Students__32C52A79BAE301CF;

Create Clustered Index Idx_StudentID
on Students(StudentID);

EXEC sp_helpindex 'Students';


create NOnclustered index nonIDx_studentName
on Students(StudentName);

select StudentName from Students Where StudentName = 'Student 255';

create table san(
	Name varchar(20)
);

go

declare @cou Int = 1;
while @cou <= 20
begin 
	INsert into san(Name)
	values('san '+cast(@cou as nvarchar) );

	set @cou = @cou + 1;
end
select *from san;