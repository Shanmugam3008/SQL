create Table Students (
	Student_Id int Not Null,
	Student_Name Varchar(20),
	Student_Department Varchar(20),

	Constraint  PK_Students primary key (Student_Id)
);

Create Table Courses(
	Course_Id int Not Null,
	Course_Name Varchar(29),
	Course_DurationMonth int ,

	Constraint  PK_Courses primary key (Course_Id)
);

Create Table Instructors(
	Instructor_Id int Not Null,
	Instructor_Name varchar(20),
	Course_Id int ,
	Constraint PK_Instructors Primary Key (Instructor_Id),
	Constraint FK_Instructors_Courses foreign Key (Course_Id) References Courses(Course_Id)

);

Create Table ClassRooms (
	ClassRoom_Id int Not Null,
	Course_Id int,
	Constraint PK_ClassRoom primary Key (ClassRoom_Id),
	Constraint FK_ClassRooms_Courses foreign Key (Course_Id) References Courses(Course_Id)
);

Create Table StudentCourses (
	Student_Id int Not Null,
	Course_Id int Not Null,
	primary key(Student_Id,Course_id),
	Constraint FK_StudentCourses_Courses foreign Key (Course_Id) References Courses(Course_Id),
	Constraint FK_StudentCourses_Students foreign Key (Student_Id) References Students(Student_Id)
);



ALter Table StudentCourses Add  Grade int;

select * from StudentCourses