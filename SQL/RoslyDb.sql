Create Database RoslyDb
Go

Use RoslyDb
Go

Create Table Course(
	id int Identity(1,1) Not Null,
	course_id char(10) Not Null,
	start_date datetime Not Null,
	end_date datetime Not Null,
	area char(15) Not Null,
	description nvarchar(max) Null
);
Go

Alter Table Course
Add max_capacity int Not Null;

Alter Table Course
Add num_of_students int Not Null;

Alter Table Course
Add is_canceled bit Null;

Create Table Employee(
	id int Identity(1,1) Not Null,
	fname varchar(20) Not Null,
	lname varchar(20) Not Null,
	email varchar(254) NOt Null,
	bus_unit varchar(10) Not Null,
	cost_cent smallint Not Null,
	cube_loc varchar(10) Not Null,
	area char(15) Not Null,
	employeeId smallint Null
);
Go

Create Table Enrollment(
	id int Identity(1,1) Not Null,
	timestamp datetime Not Null,
	employee_id int Not Null,
	schedule_id int Not Null
);
Go

Create Table Location(
	id int Identity(1,1) Not Null,
	area char(15) Not Null
);
Go

Create Table Notification(
	id int Identity(1, 1) Not Null,
	date_time datetime Not Null,
	notification_type int Not Null,
	original_date_time datetime null,
	original_location varchar(20) Not Null
);
Go

Alter Table Notification
Add course_id int Not Null;
Go

Alter Table Notification
Alter Column notification_type tinyint Not Null;
Go

Alter Table Notification
Alter Column original_location VARCHAR(20) Not Null;
Go

Create Table UserNotification(
	user_id int Not Null,
	notification_id int Not Null,
	is_read bit  Not Null
);
Go

----------------------------------------------------
-- Creating Primary Key constraints
----------------------------------------------------
Alter Table Course
Add Constraint [PK_Course]
	Primary Key Clustered(id ASC);
Go

Alter Table Employee
Add Constraint [PK_Employee]
	Primary Key Clustered(id ASC);
Go

Alter Table Enrollment
Add Constraint [PK_Enrollment]
	Primary Key Clustered (id ASC);
Go

Alter Table Location
Add Constraint [PK_Location]
	Primary Key Clustered (area ASC);
Go

Alter Table Notification
Add Constraint [PK_Notification]
	Primary Key Clustered (id ASC);
Go

Alter Table UserNotification
Add Constraint [PK_UserNotification]
	Primary Key Clustered (user_id ASC, notification_id ASC)
Go
-- -------------------------------------------------
-- Creating Foreign Key constraints
-- -------------------------------------------------
Alter Table Course
Add Constraint [FK_Course_area]
	Foreign Key (area)
	References [dbo].[Location]
		(area)
	On Delete NO Action On Update No Action;
Go

Create Index [IX_FK_Course_area]
On [dbo].[Course]
	(area);
Go

Alter Table Employee
Add Constraint [FK_Employee_area]
	Foreign Key (area)
	References [dbo].[Location]
		(area)
	On Delete NO Action On Update No Action;
Go

Create Index [IX_FK_Employee_area]
On [dbo].[Employee]
	(area);
Go

Alter Table Enrollment
Add Constraint [FK_Enrollment_employee]
	Foreign Key (employee_id)
	References [dbo].[Employee]
		(id)
	On Delete NO Action On Update NO Action;
Go

Create Index [IX_FK_Enrollment_employee]
On [dbo].[Enrollment]
	(employee_id);
Go

Alter Table Enrollment
Add Constraint [FK_Enrollment_schedule]
	Foreign Key (schedule_id)
	References [dbo].[Course]
		(id)
	On Delete No Action On Update No Action;
Go

Create Index [IX_FK_Enrollment_schedule]
On [dbo].[Enrollment]
	(schedule_id);
Go

Alter Table Notification
Add Constraint [FK_Notification_course]
	Foreign Key (course_id)
	References [dbo].[Course]
		(id)
	On Delete No Action On Update No Action;
Go

Alter Table UserNotification
Add Constraint [FK_UserNotification_user]
	Foreign Key (user_id)
	References [dbo].[Employee]
		(id)
	On Delete No Action On Update No Action;
Go

Alter Table UserNotification
Add Constraint [FK_UserNotification_notification]
	Foreign Key (notification_id)
	References [dbo].[Notification]
		(id)
	On Delete No Action On Update No Action;
Go