
Select * from UnNormalizedTable;

-- Truncate Table UnNormalizedTable;


-- First normal form -- 1NF
-- All columns contain atomic values
-- Identify each set of related data with a primary key.
-- Eliminate repeating groups in individual tables.
-- Create a separate table for each set of related data.

Select * from N1;

-- After

Select * From N1Student;
Select * From N1Course;


-- Second normal form --2NF
-- Eliminating Partial Dependency
-- non-prime attribute is functionally dependent on part of a composite primary key (or) Primary key

Select * From N2StudentCourse;


-- After 
Select * From N1Student;
Select * From N1Course;
Select * From N1Enroll;


-- Third normal form 3NF
-- Eliminate Transitive Dependency  -- Update Anomaly,Insert Anomaly,Delete Anomaly  .
-- Suppose a new course doesn't yet have students, but you want to store its instructor:
-- a non-prime attribute depends on another non-prime attribute, which in turn depends on the primary key.

Select * From  N3StudentCourse;

Select StudentId,StudentName From N1Student;
Select * From N3Course;
Select * From N1Enroll;


-- Boyce-Codd Normal Form 
-- The table should be in the 3rd Normal Form.
-- X should be a super-key for every functional dependency (FD) X?>Y in a given relation. 

Select StudentId,CourseName,CourseInstructorName From  N3StudentCourse;



-- 4NF Multivalued Dependency

Select * from N4Student;
Select * From N1Student;

