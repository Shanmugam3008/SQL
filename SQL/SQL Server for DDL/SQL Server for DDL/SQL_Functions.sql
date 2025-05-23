
-- Create Function 

Create Function GetDetails ()
Returns Table
AS return (
	select * From student_Data
);
go

Select * From dbo.GetDetails();

select * from student_Data;

SELECT @@VERSION As [SQL Version]  
Go

Create Function multipication(@num1 int , @num2 int)

returns int
Begin 
declare @result int
Set @result = @num1 + @num2
return @result;

End
Go

Alter Table student_Data 
Add MUl int;

Update student_Data
Set MUl = dbo.multipication(student_id ,Student_Age)
where MUl is null ;
Go

