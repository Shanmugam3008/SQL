

Create Database MedicalVisitReport;
use MedicalVisitReport;


Create Table PatientDetails(
	PatientId Int Identity(201,1),
	PatientName Nvarchar(30),
	DateOfBirth date,
	Gender Nvarchar(30),
	ContactNo Nvarchar(15),
	Constraint PK_PatientDetails Primary key (PatientId)
);

Create Table PatientAddress(
	Id Int Identity(1,1) Primary Key,
	PatientId Int,
	Address Nvarchar(200),
	Constraint FK_PatientAddress_PatientDetails Foreign key (PatientId) References PatientDetails(PatientId)

);

Create Table DepartmentDetails(
	DepartmentId Int Identity(401,1),
	DepartmentName Nvarchar(100),
	Constraint PK_DepartmentDetails Primary key (DepartmentId)

);

Create Table DoctorDetails(
	DoctorId Int Identity(301,1),
	DoctorName Nvarchar(30),
	ContactNo Nvarchar(15),
	DepartmentId Int
	Constraint PK_DoctorDetails Primary key (DoctorId)
	Constraint FK_DepartmentDetails_DoctorDetails Foreign key (DepartmentId) References DepartmentDetails(DepartmentId)
);

Create Table DoctorAddress(
	Id Int Identity(1,1)Primary Key,
	DoctorId Int,
	Address Nvarchar(200),
	Constraint FK_DoctorAddress_DoctorDetails Foreign key (DoctorId ) References DoctorDetails(DoctorId )

);

Create Table AppointmentDetails(
	AppointmentId Int Identity(101,1),
	DateOfVisit date,
	TimeOfvisit time,
	VisitType Nvarchar(30),
	PatientId Int,
	DoctorId Int,
	Constraint PK_VisiterDetails Primary key (AppointmentId),
	Constraint FK_PatientDetails_AppointmentDetails Foreign key (PatientId) References PatientDetails(PatientId),
	Constraint FK_DoctorDetails_AppointmentDetails Foreign key (DoctorId) References DoctorDetails(DoctorId),
	Constraint UK_AppointmentDetails Unique (DoctorId,DateOfVisit,TimeOfvisit)
	
);

Create Table Sympotoms(
	Id Int Identity(1,1),
	PatientId Int,
	SymptomName Nvarchar(20),
	Constraint PK_Sympotoms Primary key (Id),
	Constraint FK_PatientDetails_Sympotoms Foreign key (PatientId) References PatientDetails(PatientId),

);

Create Table PaymentDetails(
	PaymentId Int Identity(501,1),
	AppointmentId int unique,
	PaymentMode Nvarchar(30),
	Amount Bigint,
	Constraint PK_PaymentDetails Primary key (PaymentId),
	Constraint Fk_AppointmentDetails_PaymentDetails Foreign key (AppointmentId) References AppointmentDetails(AppointmentId)
);

Create Table Allergies(
	Id Int Identity(1,1),
	PatientId Int,
	AllergiesName Nvarchar(20),
	Constraint PK_Allergies Primary key (Id),
	Constraint FK_PatientDetails_Allergies Foreign key (PatientId) References PatientDetails(PatientId),

);
Create Table Insurance(
	InsuranceNo Bigint,
	InsuranceProvider Nvarchar(30),
	PatientId int,
	Constraint PK_Insurance Primary key (InsuranceNo),
	Constraint FK_PatientDetails_Insurance Foreign key (PatientId) References PatientDetails(PatientId)
);

Create Table Prescription(
	MedicationId Int Identity(601,1),
	AppointmentId int,
	MedicineName Nvarchar(30),
	Dosage int,
	Frequency Tinyint,
	Duration int,
	Constraint PK_Medications Primary key (MedicationId),
	Constraint FK_AppointmentDetails_Medications Foreign key (AppointmentId) References AppointmentDetails(AppointmentId)
);

Create Table Diagnosis (
	DiagnosisId Int Identity(701,1),
	AppointmentId Int,
	DiagnosisName Nvarchar(30),
	Constraint PK_Diagnosis Primary key (DiagnosisId),
	Constraint FK_AppointmentDetails_Diagnosis Foreign key (AppointmentId) References AppointmentDetails(AppointmentId)

);

USE MedicalVisitReport;

-- Insert Patients
INSERT INTO PatientDetails (PatientName, DateOfBirth, Gender, ContactNo)
VALUES
('John Doe', '1985-06-15', 'Male', 9876543210 ),
('Jane Smith', '1990-11-20', 'Female', 9876543211 ),
('Alice Brown', '1978-03-05', 'Female', 9876543212 ),
('Bob Johnson', '1982-08-25', 'Male', 9876543213 ),
('Charlie Lee', '1995-02-14', 'Male', 9876543214),
('Diana Green', '1988-12-10', 'Female', 987654325),
('Eve White', '1992-07-07', 'Female', 9876543216),
('Frank Black', '1980-05-18', 'Male', 9876543217),
('Grace King', '1975-09-09', 'Female', 9876543218),
('Hank Wright', '1983-04-22', 'Male', 9876543219),
('Ivy Scott', '1994-10-30', 'Female', 9876543220);

-- Insert Departments
INSERT INTO DepartmentDetails (DepartmentName)
VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Surgery'),
('Dermatology'),
('Gynecology'),
('Radiology'),
('Psychiatry'),
('Urology'),
('Endocrinology');

-- Insert Doctors (linking to departments)
INSERT INTO DoctorDetails (DoctorName, DepartmentId)
VALUES
('Dr. Adams', 401),
('Dr. Baker', 402),
('Dr. Clark', 403),
('Dr. Davis', 404),
('Dr. Evans', 405),
('Dr. Foster', 406),
('Dr. Gray', 407),
('Dr. Harris', 408),
('Dr. Irving', 409),
('Dr. Johnson', 410),
('Dr. King', 411);

-- Insert Visits
INSERT INTO AppointmentDetails (DateOfVisit, TimeOfvisit, VisitType, PatientId, DoctorId)
VALUES
('2020-05-01', '09:30:00', 'Regular Checkup', 201, 301),
('2023-05-02', '10:00:00', 'Emergency', 202, 302),
('2022-05-03', '11:15:00', 'Follow-up', 203, 303),
('2021-05-04', '12:45:00', 'Regular Checkup', 204, 304),
('2022-05-05', '14:00:00', 'Consultation', 205, 305),
('2021-05-06', '15:30:00', 'Regular Checkup', 206, 306),
('2022-05-07', '16:00:00', 'Emergency', 207, 307),
('2025-05-08', '09:00:00', 'Consultation', 208, 308),
('2025-05-09', '10:30:00', 'Follow-up', 209, 309),
('2025-05-10', '11:45:00', 'Regular Checkup', 210, 310),
('2025-05-11', '13:00:00', 'Consultation', 211, 311);

-- Insert Payments
INSERT INTO PaymentDetails (VisitId, PaymentMode, Amount)
VALUES
(101, 'Cash', 1500),
(102, 'Card', 3000),
(103, 'Insurance', 4500),
(104, 'Cash', 2000),
(105, 'Card', 3500),
(106, 'Cash', 4000),
(107, 'Insurance', 5000),
(108, 'Card', 2800),
(109, 'Cash', 3300),
(110, 'Insurance', 3900),
(111, 'Card', 4200);

-- Insert Symptoms with repeated PatientIds
INSERT INTO Sympotoms (PatientId, SymptomName)
VALUES
(201, 'Fever'),
(201, 'Cough'),
(202, 'Headache'),
(203, 'Fatigue'),
(203, 'Nausea'),
(204, 'Back Pain'),
(205, 'Dizziness'),
(205, 'Shortness of Breath'),
(206, 'Chest Pain'),
(207, 'Joint Pain'),
(207, 'Swelling');

-- Insert Allergies with repeated PatientIds
INSERT INTO Allergies (PatientId, AllergiesName)
VALUES
(201, 'Pollen'),
(201, 'Dust'),
(202, 'Peanuts'),
(203, 'Penicillin'),
(203, 'Latex'),
(204, 'Shellfish'),
(205, 'Bee Sting'),
(205, 'Eggs'),
(206, 'Milk'),
(207, 'Gluten'),
(207, 'Soy');

-- Insert Insurance
INSERT INTO Insurance (InsuranceNo, InsuranceProvider, PatientId)
VALUES
(10001, 'HealthFirst', 201),
(10002, 'MediCare', 202),
(10003, 'SafeHealth', 203),
(10004, 'HealthFirst', 204),
(10005, 'MediCare', 205),
(10006, 'SafeHealth', 206),
(10007, 'HealthFirst', 207),
(10008, 'MediCare', 208),
(10009, 'SafeHealth', 209),
(10010, 'HealthFirst', 210),
(10011, 'MediCare', 211);

-- Insert Medications
INSERT INTO Prescription (VisitId, MedicineName, Dosage, Frequency, Duration)
VALUES
(101, 'Paracetamol', 500, 3, 5),
(102, 'Ibuprofen', 200, 2, 7),
(103, 'Amoxicillin', 250, 3, 10),
(104, 'Metformin', 500, 2, 30),
(105, 'Atorvastatin', 20, 1, 90),
(106, 'Aspirin', 75, 1, 365),
(107, 'Lisinopril', 10, 1, 60),
(108, 'Omeprazole', 40, 1, 14),
(109, 'Albuterol', 90, 4, 7),
(110, 'Levothyroxine', 50, 1, 30),
(111, 'Simvastatin', 20, 1, 60);

-- Insert Diagnosis
INSERT INTO Diagnosis (VisitId, DiagnosisName)
VALUES
(101, 'Flu'),
(102, 'Migraine'),
(103, 'Bacterial Infection'),
(104, 'Diabetes'),
(105, 'High Cholesterol'),
(106, 'Heart Disease'),
(107, 'Hypertension'),
(108, 'GERD'),
(109, 'Asthma'),
(110, 'Hypothyroidism'),
(111, 'Hyperlipidemia');
 

SELECT * FROM PatientDetails;
SELECT * FROM DepartmentDetails;
SELECT * FROM DoctorDetails;
SELECT * FROM AppointmentDetails;
SELECT * FROM Sympotoms;
SELECT * FROM Allergies;
SELECT * FROM PaymentDetails;
SELECT * FROM Insurance;
SELECT * FROM Prescription;
SELECT * FROM Diagnosis;

go
CREATE PROCEDURE BookAppointment
    @DateOfVisit DATE,
    @TimeOfVisit TIME,
    @VisitType NVARCHAR(30),
    @PatientId INT,
    @DoctorId INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF EXISTS (
            SELECT 1
            FROM AppointmentDetails
            WHERE DoctorId = @DoctorId 
              AND DateOfVisit = @DateOfVisit 
              AND TimeOfVisit = @TimeOfVisit
        )
        BEGIN
            RAISERROR ('Appointment already exists for this doctor at the given date and time.', 16, 1);
            RETURN;
        END
        INSERT INTO AppointmentDetails (DateOfVisit, TimeOfVisit, VisitType, PatientId, DoctorId)
        VALUES (@DateOfVisit, @TimeOfVisit, @VisitType, @PatientId, @DoctorId);

        PRINT 'Appointment booked successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error booking the visit: ' + ERROR_MESSAGE();
    END CATCH
END;

GO
Drop Procedure BookAppointment;
GO

EXEC BookAppointment
    @DateOfVisit = '2025-05-04',
    @TimeOfVisit = '12:00',
    @VisitType = 'Regular Checkup',
    @PatientId = 201,
    @DoctorId = 304;


SELECT * FROM AppointmentDetails;
go
-- 16.	Delete all appointments that are older than 2 years from today’s date.

Create Procedure sp_RemoveOldAppointment 
AS
Begin
Delete From AppointmentDetails 
Where DATEDIFF(Year,DateOfVisit,GETDATE()) > 2
End

Select DateOfVisit From AppointmentDetails 
Where DATEDIFF(Year,DateOfVisit,GETDATE()) > 2

Exec sp_RemoveOldAppointment ;

Delete From AppointmentDetails
Where Datediff(Year,DateOfVisit,GETDATE()) = 2