Create DataBase Student_Management_System ;
Use Student_Management_System;

Create Table StudentsDetails(
	Student_Id int identity(101,1) NOT NULL,
	Student_Name Varchar(30),
	Student_DOB Date,
	Gender varchar(20),
	Address Varchar(100),
	Email Varchar(30),
	Attendence_Precentage int,
	Constraint PK_StudentsDetails Primary Key (Student_Id)
);

Create Table CoursesDetails (
	Course_Id int,
	Course_Name Varchar(30)
	Constraint PK_CoursesDetails Primary Key (Course_Id)
);

Create Table ContactNo(
	Id int identity (1,1),
	Student_Id int,
	Contact_No bigint
	Constraint PK_ContactNo Primary Key (Id),
	Constraint FK_ContactNo_StudentsDetails Foreign key (Student_Id) References StudentsDetails(Student_Id)
);

Create Table GuardiansDetails(
	Id int identity (1,1),
	Student_Id int,
	Guardian_Name Varchar(30),
	Guardian_PhoneNO bigint,
	Constraint PK_GuardiansDetails Primary Key (Id),
	Constraint FK_GuardiansDetails_StudentsDetails Foreign key (Student_Id) References StudentsDetails(Student_Id)
);

Create Table Subjects (
	Subject_Id int ,
	Subject_Name Varchar(30),
	Constraint PK_Subjects Primary Key (Subject_Id),
);



Create Table CourseEnrolled (
	Student_Id int,
	Course_Id int,
	Subject_Id int,
	Mark int,
	Constraint PK_CourseEnrolled Primary Key (Student_Id,Course_Id,Subject_id),
	Constraint FK_CourseEnrolled_StudentsDetails Foreign key (Student_Id) References StudentsDetails(Student_Id),
	Constraint FK_CourseEnrolled_CoursesDetails Foreign key (Course_Id) References CoursesDetails(Course_Id),
	Constraint FK_CourseAndTheirSubjects_Subjects Foreign key (Subject_Id) References Subjects(Subject_Id)
);

Create Table PreviousSchoolDetails(
	Id int identity(1,1),
	Student_Id int,
	School_Name Nvarchar(30),
	Constraint PK_PreviousSchoolDetails Primary Key (Id),
	Constraint FK_PreviousSchoolDetails_StudentsDetails Foreign key (Student_Id) References StudentsDetails(Student_Id)
);
Create Table ExtracurricularActivities (
	Id int identity(1,1),
	Student_Id int,
	Activity Nvarchar(30),
	Constraint PK_ExtracurricularActivities Primary Key (Id),
	Constraint FK_ExtracurricularActivities_StudentsDetails Foreign key (Student_Id) References StudentsDetails(Student_Id)
);


-- Insert into StudentsDetails
INSERT INTO StudentsDetails (Student_Name, Student_DOB, Gender, Address, Email, Attendence_Precentage) VALUES
('John Doe', '2004-08-15', 'Male', '123 Main St, NY', 'john@example.com', 92),
('Alice Johnson', '2003-10-30', 'Female', '789 Oak Ave, CA', 'alice.j@example.com', 95),
('Michael Brown', '2005-01-12', 'Male', '456 Pine Rd, TX', 'mike.b@example.com', 89),
('Doe', '2004-08-15', 'Male', '123 Main St, NY', 'john@example.com', 92);

-- Insert into CoursesDetails
INSERT INTO CoursesDetails (Course_Id, Course_Name) VALUES
(201, 'BSc Computer Science'),
(202, 'BA English Literature'),
(203, 'BBA');

-- Insert into ContactNo
INSERT INTO ContactNo (Student_Id, Contact_No) VALUES
(101, 9876543210),
(101, 9123456789),
(102, 8765432109),
(103, 9988776655);

-- Insert into GuardiansDetails
INSERT INTO GuardiansDetails (Student_Id, Guardian_Name, Guardian_PhoneNO) VALUES
(101, 'Mr. Robert Doe', 9998887770),
(102, 'Mrs. Linda Smith', 8887776665),
(103, 'Mr. David Brown', 7776665554);

-- Insert into Subjects
INSERT INTO Subjects (Subject_Id, Subject_Name) VALUES
(301, 'Math'),
(302, 'Physics'),
(303, 'Programming'),
(304, 'Poetry'),
(305, 'Drama'),
(306, 'Linguistics'),
(307, 'Management'),
(308, 'Marketing');


-- Insert into CourseEnrolled
INSERT INTO CourseEnrolled (Student_Id, Course_Id,Subject_Id,Mark) VALUES
(101, 201, 301, 99),
(101, 201, 302, 92),
(101, 201, 303, 88),
(102, 202, 304, 66),
(102, 202, 305, 78),
(102, 202, 306, 66),
(103, 203, 307, 77),
(104, 201, 301, 93),
(104, 201, 302, 65),
(104, 201, 303, 98),
(103, 203, 308, 77);

-- Insert into PreviousSchoolDetails
INSERT INTO PreviousSchoolDetails (Student_Id, School_Name) VALUES
(101, 'St. Xavier''s High School'),
(101, 'ABC School'),
(102, 'Springfield School'),
(103, 'Lincoln Public School');

-- Insert into ExtracurricularActivities
INSERT INTO ExtracurricularActivities (Student_Id, Activity) VALUES
(101, 'Football'),
(101, 'Chess'),
(102, 'Debate'),
(102, 'Creative Writing'),
(103, 'Music'),
(103, 'Basketball');


Select * From StudentsDetails;
Select * From CoursesDetails;
Select * From CourseEnrolled;
Select * From GuardiansDetails;
select * From ExtracurricularActivities;
Select * From ContactNo;


Select S.Student_Id,C.Course_Id, C.Course_Name , SJ.Subject_Name , CE.Mark
From CourseEnrolled CE join StudentsDetails S ON CE.Student_Id = S.Student_Id
join CoursesDetails C on CE.Course_Id = C.Course_Id
join Subjects SJ ON CE.Subject_Id = SJ.Subject_Id
Where S.Student_Id = 104 and C.Course_Id = 201;
Go
 
Create Function SpecificStudentById (@ID int)
returns Table
as 

return(
	Select S.Student_Id,C.Course_Id, C.Course_Name , SJ.Subject_Name , CE.Mark
	From StudentsDetails S 
	join CourseEnrolled CE ON S.Student_Id = CE.Student_Id
	join CoursesDetails C ON C.Course_Id = CE.Course_Id
	join Subjects SJ ON SJ.Subject_Id = CE.Subject_id
	Where S.Student_Id = @ID 
);
GO

Select * from dbo.SpecificStudentById (102);

