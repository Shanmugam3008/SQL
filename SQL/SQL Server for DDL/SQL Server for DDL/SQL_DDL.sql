
--Data Defination Language

Create database StudentDetails;

Create database Test;

Drop database Test;

create table student_personal_Data (
	student_id int  NOT NULL,
	Name varchar(15),
	Age tinyint ,
	father_name varchar(15),
	mother_name varchar(15)
	constraint Fk_student_id foreign key(student_id)  references student_Data(student_id)
);

--Insert Into student_personal_Data (student_id,Name,Age,father_name,mother_name) values (101,'Shanmugam',22,'sekar','shanthi'),(102,'Imran',21,'vazher','lakshmi'),(103,'Sriram',21,'lakshmanan','janu'),(104,'Mani',20,'kuppan','omjega');

--Truncate table student_personal_Data ;

Select * from student_personal_Data;


Drop table student_personal_Data;

create table student_Data (
	student_id int primary key NOT NULL,
	student_name varchar(15),
	student_Age tinyint ,
	student_department varchar(15)
);


Insert Into student_Data (student_id,student_name,student_Age,student_department) values (101,'Shanmugam',22,'AI&DS'),(102,'Imran',21,'AI&DS'),(103,'Sriram',21,'CSC'),(104,'Mani',20,'EEE');
Select * from student_Data;

exec sp_rename 'student_Data.student_name' , 'student_Name' , 'column';

exec sp_rename 'student_Data.student_department' , 'student_Department' , 'column';

exec sp_rename 'studentDetail','student_information';


-- Alter --

Alter table sample_student
Alter column student_Age int;

Alter table student_Data ADD student_Address Varchar(15);

Alter table student_Data drop column student_Address;

-- Alter Constraints

--Add foreign key

Alter table sample_student 
Add Constraint fk_student_id 
foreign key (student_id)
references student_Data(student_id);

--Add unique key

Alter table student_Data 
Add Constraint Uk_Student_Name
Unique (student_Name)

--Drop contraint 

Alter table student_Data
Drop Constraint Uk_Student_Name;



