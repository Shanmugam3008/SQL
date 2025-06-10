Create Database StudentDetails;

use StudentDetails;

create Table Students (
	Student_Id int Not Null,
	Student_Name Varchar(20),
	Student_Department Varchar(50),

	Constraint  PK_Students primary key (Student_Id)
);

Create Table Courses(
	Course_Id int Not Null,
	Course_Name Varchar(50),
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

select * from Students;
select * from Courses;
select * from StudentCourses;
select * from Instructors;
select * from ClassRooms;

-- Select all students from the Students table.

Select Student_Id , Student_Name from Students;

-- Select the names of all courses.

Select * from Courses;

-- Find all students who belong to the 'Computer Science' department.

Select * from Students 
Where Student_Department = 'Computer Science';

-- List all instructors teaching the course 'Thermodynamics'.

Select I.Instructor_Name from Instructors I join Courses C on I.Course_Id = C.Course_Id
Where C.Course_Name = 'Thermodynamics';

-- List all students and the courses they are enrolled in.

Select S.Student_Name , C.Course_Name 
From StudentCourses SC 
JOIN Students S ON SC.Student_Id = S.Student_Id 
Join Courses C ON SC.Course_Id = C.Course_Id ;


-- Find the number of students enrolled in each course.

Select C.Course_Id,C.Course_Name , COUNT(C.Course_Id) As NumberOfStudent
From StudentCourses SC 
Join Courses C ON  SC.Course_Id = C.Course_Id 
GRoup BY C.Course_Id,C.Course_Name;

-- Find all courses with duration more than 5 months.
Select Course_Id , Course_Name , Course_DurationMonth 
From Courses
Where Course_DurationMonth > 5;


--Find all students who are enrolled in more than one course.

Select S.Student_Id, S.Student_Name , COUNT(S.Student_Id) As NumberOfCourseEnrolled
From StudentCourses SC
join Students S ON S.Student_Id = SC.Student_Id
Group by S.Student_Id,S.Student_Name
Having Count(S.Student_Id) > 1;

-- Find the instructor name and classroom ID for each course.

Select I.Instructor_Name , C.Course_Name,CS.ClassRoom_Id
From ClassRooms CS 
join Courses C ON CS.Course_Id = C.Course_Id
join Instructors I ON I.Course_Id = CS.Course_Id

-- List all courses along with the total number of students enrolled and the total number of classrooms assigned.

SELECT 
  C.Course_Name,
  COUNT(DISTINCT SC.Student_Id) AS TotalStudents,
  COUNT(DISTINCT CS.ClassRoom_Id) AS TotalClassrooms
FROM Courses C
JOIN StudentCourses SC ON C.Course_Id = SC.Course_Id
JOIN ClassRooms CS ON C.Course_Id = CS.Course_Id
GROUP BY C.Course_Name;


-- List instructors who are not currently assigned to any course.

Select Instructor_Id,Instructor_Name
From Instructors
Where Course_Id is Null;

-- List all students who are not enrolled in any course.

Select S.Student_Id , S.Student_Name
From Students S 
Where S.Student_Id NOT IN (
	Select Sc.Student_Id
	From StudentCourses SC
)


Select S.Student_Id , S.Student_Name
From Students S 
left join StudentCourses SC ON SC.Student_Id = S.Student_Id
Where SC.Student_Id is null;

-- Find courses that have no students enrolled.

Select  C.Course_Id ,C.Course_Name 
From Courses C
left join StudentCourses SC ON SC.Course_Id = C.Course_Id
Where SC.Course_Id is null;


-- List the names of students along with the names of all instructors teaching the courses they are enrolled in.

Select S.Student_Name , I.Instructor_Name , C.Course_Name
From Students S 
 Join StudentCourses SC ON S.Student_Id = SC.Student_Id
 Join Courses C ON C.Course_Id = SC.Course_Id
 Join Instructors I ON C.Course_Id = I.Course_Id


 -- Display the number of students per department who are enrolled in at least one course.

 Select S.Student_Department , Count( S.Student_Department ) As NoOfStudent 
 From Students S join StudentCourses SC ON S.Student_Id = SC.Student_Id
 Group by S.Student_Department
 Having COUNT(S.Student_Id) >= 1;

 -- Show students and their enrolled courses where course duration is more than 5 months.S

Select S.Student_Name ,C.Course_Name,C.Course_DurationMonth
From Students S join StudentCourses SC ON S.Student_Id = SC.Student_Id
join Courses C On SC.Course_Id = C.Course_Id
Where C.Course_DurationMonth > 5;

-- Display each instructor’s name along with the count of students enrolled in their course.

Select I.Course_Id,I.Instructor_Name,C.Course_Name,COUNT(C.Course_Name) AS NoOfStudentEnrolled
From Instructors I 
join StudentCourses SC On SC.Course_Id = I.Course_Id
join Courses C On C.Course_Id = I.Course_Id
Group by C.Course_Name,I.Course_Id,I.Instructor_Name;

