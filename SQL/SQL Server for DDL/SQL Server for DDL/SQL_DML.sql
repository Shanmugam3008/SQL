
-- Data Query Language

Select * from student_Data;

select * from student_personal_Data;

select student_id,student_Name ,student_Age
from student_Data
where student_Age > 20;

--truncate table student_personal_Data;
-- Data Manipulation Language

--Insert Into student_Data values (105,'Ajay',19,'ECE');

Insert Into student_personal_Data (student_id,Name,Age,father_name,mother_name) values (101,'Shanmugam',22,'sekar',null),(102,'Imran',21,'vazher','lakshmi'),(103,'Sriram',21,'lakshmanan','janu'),(104,'Mani',20,'kuppan','omjega');

Update student_personal_Data
set mother_name = 'shanthi' 
where mother_name is null and student_id = 101;


--Alter table student_personal_Data drop column mother_name;

DELETE student_personal_Data
WHERE Age BETWEEN 18 AND 20 ;  
PRINT 'Doesn"t have valid Age'


--BEGIN TRANSACTION;
-- commit;
--rollback;

select * from student_personal_Data;

Create Procedure SelectByDept @studentDept varchar(20)

AS 

select * from student_Data
Where student_department = @studentDept;

Go



Exec SelectByDept @studentDept ='AI&DS';