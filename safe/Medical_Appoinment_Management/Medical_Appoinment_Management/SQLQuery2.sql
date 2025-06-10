Create Database Appointment_Management ;

use Appointment_Management;

Create Table Patient_Details(
	Patient_Id Int Identity(1001,1) Primary key Not Null,
	Patient_Name Nvarchar(50),
	Patient_Gender Nvarchar(10),
	Patient_DOB Date,
	Patient_Mobile_No Bigint
);

Create Table Doctor_Details(
	Doctor_Id Int Identity(2001,1) Primary key Not Null,
	Doctor_Name Nvarchar(50),
	specialty Nvarchar(60),
	Doctor_Mobile_No Bigint,
	Fees Money,
);

Create Table Appointment (
	Appointment_ID Int Identity(3001,1) Primary Key Not Null,
	Patient_Id Int,
	Appointment_Date Date,
	Appointment_Time Time,
	Mode Nvarchar(10),
	
	Constraint FK_Appointment_Patient_Details Foreign Key (Patient_Id) References Patient_Details(Patient_Id)
);

Create Table Hospital_details(
	Hospital_Id Int Identity(4001,1) Primary Key Not Null,
	Hospital_Name Nvarchar(100)
);

Create Table Doctor_Appointment_Deteails (
	Doctor_Id Int,
	Appointment_Id Int,
	prescription Nvarchar(100),
	Payment Nvarchar(30),
	Constraint PK_Doctor_Appointment_Deteails Primary Key (Doctor_Id,Appointment_Id),
	Constraint FK_Doctor_Appointment_Deteails_Doctor_Details Foreign Key (Doctor_Id) references Doctor_Details(Doctor_Id),
	Constraint FK_Doctor_Appointment_Deteails_Appointment Foreign Key (Appointment_Id) references Appointment(Appointment_Id),
);

Create Table Hospital_Doctor_Details(
	Hospital_Id Int,
	Doctor_Id Int,
	Constraint PK_Hospital_Doctor_Details Primary Key (Hospital_Id,Doctor_Id),
	Constraint FK_Hospital_Doctor_Details_Hospital_Details Foreign Key (Hospital_Id) references Hospital_Details(Hospital_Id),
	Constraint FK_Hospital_Doctor_Details_Doctor_Details Foreign Key (Doctor_Id) references Doctor_Details(Doctor_Id)
);
INSERT INTO Patient_Details (Patient_Name, Patient_Gender, Patient_DOB, Patient_Mobile_No)
VALUES 
('Arjun Mehta', 'Male', '1995-04-12', 9876543210),
('Priya Sharma', 'Female', '1992-08-24', 8765432109),
('Rahul Verma', 'Male', '1988-06-30', 9988776655),
('Sneha Nair', 'Female', '2000-01-15', 8899776655),
('Karan Kapoor', 'Male', '1991-12-05', 9988665544),
('Anjali Rao', 'Female', '1996-09-17', 9877665544),
('Ravi Desai', 'Male', '1990-03-25', 9988991122),
('Divya Iyer', 'Female', '1993-07-10', 8877991133),
('Suresh Menon', 'Male', '1985-11-22', 7766889944),
('Meena Joshi', 'Female', '1989-05-19', 6655778899),
('Vikram Singh', 'Male', '1997-02-02', 7555667788);


INSERT INTO Doctor_Details (Doctor_Name, Specialty, Doctor_Mobile_No, Fees)
VALUES
('Dr. Rajiv Khanna', 'Cardiologist', 9123456789, 1500),
('Dr. Anita Bansal', 'Dermatologist', 9234567890, 800),
('Dr. Manoj Sinha', 'Neurologist', 9345678901, 2000),
('Dr. Neha Jain', 'Gynecologist', 9456789012, 1000),
('Dr. Alok Das', 'Orthopedic', 9567890123, 1200),
('Dr. Snehal Patil', 'Psychiatrist', 9678901234, 1800),
('Dr. Amitabh Roy', 'ENT Specialist', 9789012345, 700),
('Dr. Pooja Deshpande', 'Pediatrician', 9890123456, 900),
('Dr. Ramesh Iyer', 'Oncologist', 9012345678, 2200),
('Dr. Kavita Reddy', 'Ophthalmologist', 9123456790, 1100),
('Dr. Faizan Qureshi', 'General Physician', 9234567810, 600);

INSERT INTO Hospital_Details (Hospital_Name)
VALUES
('Apollo Hospital'),
('Fortis Healthcare'),
('Max Super Specialty'),
('AIIMS Delhi'),
('Kauvery Hospital'),
('Rainbow Children’s Hospital'),
('Manipal Hospital'),
('Global Health City'),
('Medanta – The Medicity'),
('CMC Vellore'),
('Artemis Hospital');

INSERT INTO Hospital_Doctor_Details (Hospital_Id, Doctor_Id)
VALUES
(4001, 2001),
(4002, 2002),
(4003, 2003),
(4004, 2004),
(4005, 2005),
(4006, 2006),
(4007, 2007),
(4008, 2008),
(4009, 2009),
(4010, 2010),
(4011, 2011);

INSERT INTO Appointment (Patient_Id, Appointment_Date, Appointment_Time, Mode)
VALUES
(1001, '2025-12-15', '10:30:00', 'Online'),
(1002, '2025-03-16', '14:00:00', 'Offline'),
(1003, '2025-11-17', '09:00:00', 'Online'),
(1004, '2025-06-18', '16:00:00', 'Offline'),
(1005, '2025-10-19', '11:15:00', 'Online'),
(1006, '2025-05-20', '13:30:00', 'Offline'),
(1007, '2025-06-21', '08:00:00', 'Online'),
(1008, '2025-07-22', '15:45:00', 'Offline'),
(1009, '2025-06-23', '10:00:00', 'Online'),
(1010, '2025-09-24', '14:30:00', 'Offline'),
(1011, '2025-01-25', '09:45:00', 'Online')



INSERT INTO Doctor_Appointment_Deteails (Doctor_Id, Appointment_Id, prescription, Payment)
VALUES
(2001, 3001, 'Take Aspirin 100mg daily', 'Paid'),
(2002, 3002, 'Apply ointment twice daily', 'Pending'),
(2003, 3003, 'Schedule MRI scan', 'Paid'),
(2004, 3004, 'Rest and hydration', 'Paid'),
(2005, 3005, 'Physical therapy exercises', 'Pending'),
(2006, 3006, 'Counseling sessions weekly', 'Paid'),
(2007, 3007, 'Use nasal spray as prescribed', 'Paid'),
(2008, 3008, 'Vitamin supplements daily', 'Pending'),
(2009, 3009, 'Chemotherapy consultation', 'Paid'),
(2010, 3010, 'Eye drops twice daily', 'Pending'),
(2011, 3011, 'General check-up', 'Paid')


INSERT INTO Doctor_Appointment_Deteails (Doctor_Id, Appointment_Id, prescription, Payment)
VALUES
(2001, 3012, 'Take Aspirin 100mg daily', 'Paid'),
(2002, 3013, 'Apply ointment twice daily', 'Pending'),
(2003, 3014, 'Schedule MRI scan', 'Paid')

Create Procedure ToptenDoctorofthemonthbyyear @month Int ,@year Int
AS
Select top 10 D.Doctor_Id , D.Doctor_Name,Count (*) As AppointmentCount
From Doctor_Appointment_Deteails DA 
join Appointment A on DA.Appointment_Id = A.Appointment_Id
Join Doctor_Details D on DA.Doctor_id = D.Doctor_Id
Where MONTH(A.Appointment_Date) = @month and Year(A.Appointment_Date) = @year
Group by D.Doctor_Id , D.Doctor_Name
Order by AppointmentCount desc

Go
Drop Procedure ToptenDoctorofthemonthbyyear;
exec ToptenDoctorofthemonthbyyear @month = 6 , @year = 2025; 

SElect * From Doctor_Appointment_Deteails Da  Join Appointment A on Da.Appointment_Id = A.Appointment_Id



Select Appointment_ID,Patient_Id,Appointment_Date,Appointment_Time,Mode
From  Appointment A 
Where month(A.Appointment_Date) >month( GETDATE())

Go
SElect Mode,COunt (Mode) As COUNT
from Appointment 
group by Mode
Order By COUNT desc

Select * From Doctor_Appointment_Deteails;

Select HD.Hospital_Id , H.Hospital_Name,Count(HD.Doctor_id) AS DOCcount
From Hospital_Doctor_Details HD 
join Doctor_Details D On HD.Doctor_Id = D.Doctor_Id
join Hospital_details H On HD.Hospital_Id = H.Hospital_Id
Group by HD.Hospital_Id , H.Hospital_Name
Order BY DOCcount desc
;

Create Procedure Patient_Appointment @Patient_Name Nvarchar(100)
AS
Begin 
Select A.Appointment_ID,A.Patient_Id,P.Patient_Name,A.Appointment_Date 
From Appointment A join Patient_Details P On A.Patient_Id = P.Patient_Id
Where P.Patient_Name = @Patient_Name;
End

Go

Select DA.Appointment_Id ,A.Patient_Id,P.Patient_Name,DA.Doctor_Id,D.Doctor_Name
From Doctor_Appointment_Deteails DA
join Doctor_Details D ON DA.Doctor_Id = D.Doctor_Id
join Appointment A ON DA.Appointment_Id = A.Appointment_Id
join Patient_Details P ON A.Patient_Id = P.Patient_Id
Where D.specialty = 'Cardiologist';


--Create a view that displays Appointment_ID, Patient_Name, Doctor_Name, Appointment_Date, and Payment.\
GO

Create view AppointmentDetails 
As 
Select A.Appointment_Id,P.Patient_Name,D.Doctor_Name,A.Appointment_Date,DA.Payment
From Doctor_Appointment_Deteails DA
join Doctor_Details D ON DA.Doctor_Id = D.Doctor_Id
join Appointment A ON DA.Appointment_Id = A.Appointment_Id
join Patient_Details P ON A.Patient_Id = P.Patient_Id
--order by Appointment_Id
--OFFSET 0 rows

Drop View AppointmentDetails;
select * from AppointmentDetails
Order by Appointment_Id;

Select * from  Doctor_Appointment_Deteails
Where prescription like '%daily%';