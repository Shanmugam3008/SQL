use Test;


Create Table Sample (
	Name varchar(20),
	Age int,
	DOB date
);
drop table Sample;
select * From Sample;

Insert Into Sample values ('san',22,'2003-05-23'),('Mani',21,'2004-05-23'),('san',22,'2001-05-02');

Create Procedure Display 
AS
select Name from Sample;
GO

exec Display;

Create Procedure SelectByDept @studentDept varchar(20)
AS 
select * from student_Data
Where student_department = @studentDept;
Go



Create Procedure SelectBy @studentDept varchar(20)
AS 
delete student_Data
Where student_department = @studentDept;
select * from student_Data;
Go

Create Procedure SelectById @studentDept varchar(20) , @Id int
AS 
BEGIN
select * From  student_Data
Where student_department = @studentDept and student_id = @Id;
END;
Go

Exec SelectByDept @studentDept ='AI&DS';
Exec SelectBy @studentDept ='AI&DS';
Exec SelectById @studentDept ='CSC' , @Id = 103;