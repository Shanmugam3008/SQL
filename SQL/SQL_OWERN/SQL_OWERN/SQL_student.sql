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

-- Insert into Students 
INSERT INTO Students (Student_Id, Student_Name, Student_Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Mechanical Engineering'),
(3, 'Charlie', 'Electrical Engineering'),
(4, 'Diana', 'Civil Engineering'),
(5, 'Ethan', 'Computer Science'),
(6, 'Fiona', 'Mechanical Engineering'),
(7, 'George', 'Electrical Engineering'),
(8, 'Hannah', 'Civil Engineering'),
(9, 'Ian', 'Computer Science'),
(10, 'Jane', 'Mechanical Engineering');

-- Insert into Courses 
INSERT INTO Courses (Course_Id, Course_Name, Course_DurationMonth) VALUES
(101, 'Database Systems', 6),
(102, 'Thermodynamics', 4),
(103, 'Circuit Analysis', 5),
(104, 'Structural Analysis', 6),
(105, 'Operating Systems', 7);

-- Insert into Instructors 
INSERT INTO Instructors (Instructor_Id, Instructor_Name, Course_Id) VALUES
(201, 'Dr. Smith', 101),
(202, 'Dr. Johnson', 102),
(203, 'Dr. Lee', 103),
(204, 'Dr. Brown', 104),
(205, 'Dr. Davis', 105);

-- Insert into ClassRooms 
INSERT INTO ClassRooms (ClassRoom_Id, Course_Id) VALUES
(301, 101),
(302, 102),
(303, 103),
(304, 104),
(305, 105);

-- Insert into StudentCourses 
INSERT INTO StudentCourses (Student_Id, Course_Id) VALUES
(1, 101),
(1, 105),
(2, 102),
(2, 104),
(3, 103),
(3, 101),
(4, 104),
(5, 101),
(6, 102),
(7, 105);


ALter Table StudentCourses Add  Grade int;

select * from StudentCourses