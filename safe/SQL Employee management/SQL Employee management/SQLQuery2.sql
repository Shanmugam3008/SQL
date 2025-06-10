Create Database Employee_Management_System;

Use Employee_Management_System;

Create Table EmployeeDetails
(
    Id int identity(101,1) NOT NULL,
    Name Nvarchar(30),
	DOB Date,
	Gender Nvarchar(15),
	ContactNo bigint,
	JoinDate Date,
	Status Nvarchar(30),
	Manager_Id int,
	Constraint PK_EmployeeDetails primary key (Id) ,
	Constraint FK_Manager Foreign key (Manager_Id) REFERENCES EmployeeDetails(Id)
);

Create Table DepartmentDetails(
	Id int identity(201,1) NOT NULL,
	Name Nvarchar(30),
	Constraint PK_DepartmentDetails primary key (Id) 
);

Create table EmployeesDepartments(
	Employee_Id int NOT NULL,
	Departmant_Id int NOT NULL,
	Constraint PK_EmployeesDepartments primary key (Employee_Id,Departmant_Id),
	Constraint FK_EmployeesDepartments_EmployeeDetails Foreign key (Employee_Id) References EmployeeDetails(Id),
	Constraint FK_EmployeesDepartments_DepartmentDetails Foreign key (Departmant_Id) References DepartmentDetails(Id)

); 

Create Table JobDetails(
	Id int NOT NULL,
	Employee_Id int,
	Title Nvarchar(30)NOT NULL,
	StartDate Date NOT NULL,
	EndDate Date NULL,
	Constraint PK_JobDetails Primary key (Id),
	Constraint FK_JobDetails_EmployeeDetails Foreign key (Employee_Id) References EmployeeDetails(Id)
);

Create Table AddressDetails(
	Id int identity(1,1),
	Employee_Id int ,
	Type nvarchar(20)NOT NULL,
	Address Nvarchar(200)NOT NULL,
	Constraint PK_AddressDetails primary key (Id),
	Constraint FK_AddressDetails_EmployeeDetails Foreign key (Employee_Id) References EmployeeDetails(Id)

);

Create Table EmergencyContactDetails (
	Id int identity(1,1),
	Employee_Id int ,
	Name nvarchar(30),
	Relation Nvarchar(30),
	Contact_No bigint,
	Constraint PK_EmergencyContactDetails primary key (Id),
	Constraint FK_EmergencyContactDetails_EmployeeDetails Foreign key (Employee_Id) References EmployeeDetails(Id)

);

create Table EmployeeSkills(
	Id int identity(1,1),
	Employee_Id int,
	Skill nvarChar(30),
	SkillLevel Varchar(30),
	Constraint PK_EmployeeSkills Primary key (Id),
	Constraint FK_EmployeeSkills_EmployeeDetails Foreign key (Employee_Id) References EmployeeDetails(Id),

);

Create table ProjectsDetails(
	Id int identity (301,1)NOT NULL,
	Title Nvarchar(30),
	Constraint PK_ProjectsDetails Primary key (Id)
);

Create Table EmployeeProjectDetails(
	Employee_Id int NOT NULL,
	Project_Id int NOT NULL,
	Role Nvarchar(30),
	Duration int,
	Constraint PK_EmployeeProjectDetails primary key (Employee_Id,Project_Id),
	Constraint FK_EmployeeProjectDetails_EmployeeDetails Foreign key (Employee_Id) References EmployeeDetails(Id),
	Constraint FK_EmployeeProjectDetails_Projects_details Foreign key (Project_Id) References ProjectsDetails(Id)
);

