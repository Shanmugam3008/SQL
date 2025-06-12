

-- UnNormalized Table
Insert Into UnNormalizedTable Values 
('shanmugam','DSA,SQL','6,5','2025-05-09'),
('Vijay','C#,SQL','8,5','2025-06-19'),
('Ajith','DSA','6','2025-05-09'),
('Arun','SQL','5','2025-08-22')


-- N1 - Nomaization :
Insert Into N1 Values 
('shanmugam','DSA',6,'2025-05-09'),
('shanmugam','SQL',5,'2025-05-09'),
('Vijay','C#',8,'2025-06-19'),
('Vijay','SQL',5,'2025-06-19'),
('Ajith','DSA',6,'2025-05-09'),
('Arun','SQL',5,'2025-08-22')

Insert Into N1Student Values
('Shanugam','2025-05-09'),
('Vijay','2025-06-19'),
('Ajith','2025-05-09'),
('Arun','2025-08-22')

Insert Into N1Course Values
(6,'DSA'),
(5,'SQl'),
(8,'C#');

Insert Into N1Enroll values 
(1,1),
(1,2),
(2,3),
(2,2),
(3,1),
(4,2);

Insert Into N2StudentCourse Values 
(1,1,'DSA'),
(1,2,'SQl'),
(2,3,'C#'),
(2,2,'SQl'),
(3,1,'DSA'),
(4,2,'SQl');


Insert Into N3StudentCourse Values 
(1,'shanmugam','DSA','Subin'),
(2,'mani','SQL','Raja'),
(1,'shanmugam','SQL','Subin'),
(3,'sriram','C#','Jeya');

Insert Into N3Course Values
(1,'DSA','Subin'),
(2,'SQl','Raja'),
(3,'C#','Jeya');

Insert Into N4Student Values
(1,'Shanugam','2025-05-09','drawing'),
(1,'Shanugam','2025-05-09','football'),
(1,'Shanugam','2025-05-09','potery'),
(2,'Vijay','2025-06-19','gameing'),
(2,'Vijay','2025-06-19','listing musics'),
(3,'Ajith','2025-05-09','drawing'),
(4,'Arun','2025-08-22','singing')

Insert Into Hobies Values ('drawing'),('singing'),('poetry'),('football'),('listing musics'),('gaming')

insert into StudentHobies values (1,1),(1,4),(1,3),(2,6),(2,5),(3,1),(4,12)