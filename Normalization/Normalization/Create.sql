Create Database Normalization ;

Use Normalization;

Create Table UnNormalizedTable (
	StudentId Int Identity(1,1) primary key ,
	StudentName Nvarchar(50),
	DOB date,
	CourseName Nvarchar(100),
	CourseDuration Nvarchar(50)
	
);

Drop TAble UnNormalizedTable;
Create Table N1(
	StudentId Int Identity(1,1) primary key ,
	StudentName Nvarchar(50),
	CourseName Nvarchar(100),
	CourseDuration Tinyint,
	DOB date
);

Create Table N1Student(
	StudentId Int Identity(1,1) primary key ,
	StudentName Nvarchar(50),
	DOB date
);

Create Table N1Course(
	CourseId Int Identity(1,1)Primary key,
	CourseName Nvarchar(50),
	CourseDuration TinyInt
);
Create Table N1Enroll(
	StudentId Int,
	CourseId Int
	Constraint Pk_StudentCourse Primary Key(StudentId,CourseId)

);

Create Table N2StudentCourse(
	StudentId Int ,
	CourseId Int ,
	CourseName Nvarchar(50),
	Constraint Pk_StudentCourse Primary Key(StudentId,CourseId)
);

Create Table N3StudentCourse (
	StudentId Int,
	StudentName Nvarchar(50),
	CourseName NVarchar(100),
	CourseInstructorName Nvarchar(50)
);
Create Table N3Course (
	CourseId Int,
	CourseName NVarchar(100),
	CourseInstructorName Nvarchar(50)
);

Create Table N4Student(
	StudentId Int ,
	StudentName Nvarchar(50),
	DOB date,
	hobby Nvarchar(50)
);

Create Table Hobies(
	Id Int Identity(1,1)Primary key,
	Name Nvarchar(50)
);

Create Table StudentHobies(
	StudentID int ,
	HobieId Int
);


