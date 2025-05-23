-- Create the original table
CREATE TABLE Students (
    StudentID INT,
    Name VARCHAR(50),
    Courses VARCHAR(255)
);

-- Insert the original data
INSERT INTO Students (StudentID, Name, Courses) VALUES
(1, 'Alice', 'Math, Science, History'),
(2, 'Bob', 'Math, English');


select * from Students;
select * from StudentCourses ;

-- Create the new table to store the transformed data
CREATE TABLE StudentCourses (
    StudentID INT,
    Name VARCHAR(50),
    Course VARCHAR(50)
);

-- Insert the transformed data into the new table

INSERT INTO StudentCourses (StudentID, Name, Course)
SELECT StudentID, Name, TRIM(value) AS Course
FROM Students
CROSS APPLY STRING_SPLIT(Courses, ',');


-- Select the data from the new table to verify the transformation
SELECT * FROM StudentCourses;
