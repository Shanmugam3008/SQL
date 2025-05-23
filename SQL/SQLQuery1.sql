Create table Subscribers_Details(
	Subscriber_id int ,
	Subsciber_Name Varchar(15),
	Subscriber_Email varchar(15),
	Subscriber_Plan Varchar(15),

	Constraint PK_Subscriber  Primary key (Subscriber_id) 
);
Drop Table Subscribers_Details;
select * from Subscribers_Details;

Create Table Movie_List (
	Movie_id int,
	Movie_name varchar(20),
	Movie_Genre Varchar(20), 
	Constraint PK_MovieList primary key (Movie_id)
);


Create Table Movie_Watched (
	Subscriber_id int,
	Movie_id int,
	primary key(Subscriber_id,Movie_id),
	--Constraint FK_Subscriber_Movies foreign key (Subscriber_id) References Subscribers_Details (Subscriber_id),
	--Constraint FK_Movies_List foreign key (Movie_id) References Movie_List (Movie_id)
);

create Table Device(
	Subscriber_id int,
	Device_Used Varchar(15),
	constraint FK_Subscriber_Device foreign key (Subscriber_id) References Subscribers_Details (Subscriber_id)
);