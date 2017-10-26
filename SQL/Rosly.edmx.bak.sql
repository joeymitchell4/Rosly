
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/15/2017 11:27:37
-- Generated from EDMX file: C:\Users\Abdul\Documents\quick git\other rosly\rosly\Rosly\Models\Rosly.edmx
-- --------------------------------------------------
SET XACT_ABORT ON --revert everything if something bad happens

CREATE DATABASE [RoslyDb];
GO

SET QUOTED_IDENTIFIER OFF;
GO
USE [RoslyDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Employee_area]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_area];
GO
IF OBJECT_ID(N'[dbo].[FK_Enrollment_employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_employee];
GO
IF OBJECT_ID(N'[dbo].[FK_UserNotification_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserNotification] DROP CONSTRAINT [FK_UserNotification_user];
GO
IF OBJECT_ID(N'[dbo].[FK_UserNotification_notification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserNotification] DROP CONSTRAINT [FK_UserNotification_notification];
GO
IF OBJECT_ID(N'[dbo].[FK_Schedule_courseid]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [FK_Schedule_courseid];
GO
IF OBJECT_ID(N'[dbo].[FK_Enrollment_schedule1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [FK_Enrollment_schedule1];
GO
IF OBJECT_ID(N'[dbo].[FK_Schedule_instructorid]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [FK_Schedule_instructorid];
GO
IF OBJECT_ID(N'[dbo].[FK_Schedule_area]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [FK_Schedule_area];
GO
IF OBJECT_ID(N'[dbo].[FK_Notification_course1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_course1];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRole];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUser];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeBusUnit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_EmployeeBusUnit];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Course]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Course];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Enrollment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Enrollment];
GO
IF OBJECT_ID(N'[dbo].[Location]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Location];
GO
IF OBJECT_ID(N'[dbo].[Notification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notification];
GO
IF OBJECT_ID(N'[dbo].[UserNotification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserNotification];
GO
IF OBJECT_ID(N'[dbo].[Instructor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Instructor];
GO
IF OBJECT_ID(N'[dbo].[Schedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedule];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[BusUnit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BusUnit];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Course'
CREATE TABLE [dbo].[Course] (
    [id] int IDENTITY(1,1) NOT NULL,
    [course_name] char(64)  NOT NULL,
    [description] nvarchar(max)  NULL
);
GO

-- Creating table 'Employee'
CREATE TABLE [dbo].[Employee] (
    [id] int IDENTITY(1,1) NOT NULL,
    [fname] varchar(32)  NOT NULL,
    [lname] varchar(32)  NOT NULL,
    [email] varchar(254)  NOT NULL,
    [cost_cent] smallint  NOT NULL,
    [cube_loc] varchar(10)  NOT NULL,
    [area] char(15)  NOT NULL,
    [employeeId] smallint  NULL,
    [bus_unit] varchar(10)  NOT NULL
);
GO

-- Creating table 'Enrollment'
CREATE TABLE [dbo].[Enrollment] (
    [id] int IDENTITY(1,1) NOT NULL,
    [timestamp] datetime  NOT NULL,
    [employee_id] int  NOT NULL,
    [schedule_id] int  NOT NULL,
    [on_waitlist] bit  NULL
);
GO

-- Creating table 'Location'
CREATE TABLE [dbo].[Location] (
    [id] int IDENTITY(1,1) NOT NULL,
    [area] char(15)  NOT NULL
);
GO

-- Creating table 'Notification'
CREATE TABLE [dbo].[Notification] (
    [id] int IDENTITY(1,1) NOT NULL,
    [date_time] datetime  NOT NULL,
    [notification_type] tinyint  NOT NULL,
    [original_date_time] datetime  NULL,
    [original_location] varchar(20)  NOT NULL,
    [course_id] int  NOT NULL
);
GO

-- Creating table 'UserNotification'
CREATE TABLE [dbo].[UserNotification] (
    [user_id] int  NOT NULL,
    [notification_id] int  NOT NULL,
    [is_read] bit  NOT NULL,
    [is_email_sent] bit  NULL,
    [is_email] bit  NULL
);
GO

-- Creating table 'Instructor'
CREATE TABLE [dbo].[Instructor] (
    [id] int IDENTITY(1,1) NOT NULL,
    [fname] varchar(32)  NOT NULL,
    [lname] varchar(32)  NOT NULL,
    [email] varchar(254)  NOT NULL
);
GO

-- Creating table 'Schedule'
CREATE TABLE [dbo].[Schedule] (
    [id] int IDENTITY(1,1) NOT NULL,
    [start_date] datetime  NOT NULL,
    [end_date] datetime  NOT NULL,
    [area] char(15)  NOT NULL,
    [max_capacity] int  NOT NULL,
    [num_of_students] int  NOT NULL,
    [is_canceled] bit  NULL,
    [course_id] int  NOT NULL,
    [instructor_id] int  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'BusUnit'
CREATE TABLE [dbo].[BusUnit] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(10)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Course'
ALTER TABLE [dbo].[Course]
ADD CONSTRAINT [PK_Course]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [PK_Employee]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Enrollment'
ALTER TABLE [dbo].[Enrollment]
ADD CONSTRAINT [PK_Enrollment]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [area] in table 'Location'
ALTER TABLE [dbo].[Location]
ADD CONSTRAINT [PK_Location]
    PRIMARY KEY CLUSTERED ([area] ASC);
GO

-- Creating primary key on [id] in table 'Notification'
ALTER TABLE [dbo].[Notification]
ADD CONSTRAINT [PK_Notification]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [user_id], [notification_id] in table 'UserNotification'
ALTER TABLE [dbo].[UserNotification]
ADD CONSTRAINT [PK_UserNotification]
    PRIMARY KEY CLUSTERED ([user_id], [notification_id] ASC);
GO

-- Creating primary key on [id] in table 'Instructor'
ALTER TABLE [dbo].[Instructor]
ADD CONSTRAINT [PK_Instructor]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Schedule'
ALTER TABLE [dbo].[Schedule]
ADD CONSTRAINT [PK_Schedule]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [name] in table 'BusUnit'
ALTER TABLE [dbo].[BusUnit]
ADD CONSTRAINT [PK_BusUnit]
    PRIMARY KEY CLUSTERED ([name] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [area] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [FK_Employee_area]
    FOREIGN KEY ([area])
    REFERENCES [dbo].[Location]
        ([area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Employee_area'
CREATE INDEX [IX_FK_Employee_area]
ON [dbo].[Employee]
    ([area]);
GO

-- Creating foreign key on [employee_id] in table 'Enrollment'
ALTER TABLE [dbo].[Enrollment]
ADD CONSTRAINT [FK_Enrollment_employee]
    FOREIGN KEY ([employee_id])
    REFERENCES [dbo].[Employee]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Enrollment_employee'
CREATE INDEX [IX_FK_Enrollment_employee]
ON [dbo].[Enrollment]
    ([employee_id]);
GO

-- Creating foreign key on [user_id] in table 'UserNotification'
ALTER TABLE [dbo].[UserNotification]
ADD CONSTRAINT [FK_UserNotification_user]
    FOREIGN KEY ([user_id])
    REFERENCES [dbo].[Employee]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [notification_id] in table 'UserNotification'
ALTER TABLE [dbo].[UserNotification]
ADD CONSTRAINT [FK_UserNotification_notification]
    FOREIGN KEY ([notification_id])
    REFERENCES [dbo].[Notification]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserNotification_notification'
CREATE INDEX [IX_FK_UserNotification_notification]
ON [dbo].[UserNotification]
    ([notification_id]);
GO

-- Creating foreign key on [course_id] in table 'Schedule'
ALTER TABLE [dbo].[Schedule]
ADD CONSTRAINT [FK_Schedule_courseid]
    FOREIGN KEY ([course_id])
    REFERENCES [dbo].[Course]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Schedule_courseid'
CREATE INDEX [IX_FK_Schedule_courseid]
ON [dbo].[Schedule]
    ([course_id]);
GO

-- Creating foreign key on [schedule_id] in table 'Enrollment'
ALTER TABLE [dbo].[Enrollment]
ADD CONSTRAINT [FK_Enrollment_schedule1]
    FOREIGN KEY ([schedule_id])
    REFERENCES [dbo].[Schedule]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Enrollment_schedule1'
CREATE INDEX [IX_FK_Enrollment_schedule1]
ON [dbo].[Enrollment]
    ([schedule_id]);
GO

-- Creating foreign key on [instructor_id] in table 'Schedule'
ALTER TABLE [dbo].[Schedule]
ADD CONSTRAINT [FK_Schedule_instructorid]
    FOREIGN KEY ([instructor_id])
    REFERENCES [dbo].[Instructor]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Schedule_instructorid'
CREATE INDEX [IX_FK_Schedule_instructorid]
ON [dbo].[Schedule]
    ([instructor_id]);
GO

-- Creating foreign key on [area] in table 'Schedule'
ALTER TABLE [dbo].[Schedule]
ADD CONSTRAINT [FK_Schedule_area]
    FOREIGN KEY ([area])
    REFERENCES [dbo].[Location]
        ([area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Schedule_area'
CREATE INDEX [IX_FK_Schedule_area]
ON [dbo].[Schedule]
    ([area]);
GO

-- Creating foreign key on [course_id] in table 'Notification'
ALTER TABLE [dbo].[Notification]
ADD CONSTRAINT [FK_Notification_course1]
    FOREIGN KEY ([course_id])
    REFERENCES [dbo].[Schedule]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Notification_course1'
CREATE INDEX [IX_FK_Notification_course1]
ON [dbo].[Notification]
    ([course_id]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [bus_unit] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [FK_EmployeeBusUnit]
    FOREIGN KEY ([bus_unit])
    REFERENCES [dbo].[BusUnit]
        ([name])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeBusUnit'
CREATE INDEX [IX_FK_EmployeeBusUnit]
ON [dbo].[Employee]
    ([bus_unit]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------

--Locations
INSERT INTO [Location](area) VALUES('MAY');
INSERT INTO [Location](area) VALUES('PAZ');
INSERT INTO [Location](area) VALUES('VJO');
INSERT INTO [Location](area) VALUES('MKE');
INSERT INTO [Location](area) VALUES('MEQ');
INSERT INTO [Location](area) VALUES('MCM');

--BusUnits
--Allow insertion of unknown BusUnits from the original excel file
INSERT INTO [BusUnit](name) VALUES(' ');

INSERT INTO [BusUnit](name) VALUES('CVB');
INSERT INTO [BusUnit](name) VALUES('ISPB');
INSERT INTO [BusUnit](name) VALUES('Motion');
INSERT INTO [BusUnit](name) VALUES('PCB');

DECLARE @thisInstructorID int; 
DECLARE @thisCourseID int;
DECLARE @thisSchedID int;


INSERT INTO [Instructor](fname, lname, email) VALUES('Marzell', 'Brown', 'mlbrown@ra.rockwell.com');
SET @thisInstructorID = SCOPE_IDENTITY();


INSERT INTO [Course](course_name, description) VALUES('Logix Basics training class','Pre-Rosly course');
SET @thisCourseID = SCOPE_IDENTITY();


-- schedule set 1
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-01-18T00:00:00', '2016-01-22T00:00:00', 'MAY', 25, 14, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY();


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Venkata','Somanchi','VBSomanc@ra.rockwell.com','CVB',15507,'CNC258','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kamal','Tejwani','krtejwan@ra.rockwell.com',' ',0,'ND301','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Dan','Richter','TBD@ra.rockwell.com',' ',0,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mark','Sladen','TBD@ra.rockwell.com',' ',0,'CN-C216','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sam','Massari','slmassar@ra.rockwell.com',' ',0,'CN-D213','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('James','Hannum','jhannum@ra.rockwell.com',' ',0,'CN-C221','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jan','Cooper','jccooper@ra.rockwell.com',' ',0,'CN-C217','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Douglas','Mace','DSMACEII@RA.ROCKWELL.COM','CVB',15506,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Long T','Vo','LTVO@RA.ROCKWELL.COM','CVB',15506,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Chase','Melius','clardi@ra.rockwell.com','CVB',15518,'CS-D352','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Justin','McCaffery','clardi@ra.rockwell.com','CVB',15518,'CS-D351','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Brad','Arnold','barnold@ra.rockwell.com','CVB',15533,'CN-C337','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Diana','Esch-Mosher','deschmoshe@ra.rockwell.com','CVB',15522,'CN-D313','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Matthew','Cameron','macamero@ra.rockwell.com','ISPB',15043,'NA201','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-01-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



-- schedule set 2
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-07-11T00:00:00', '2016-07-15T00:00:00', 'PAZ', 17, 25, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY();


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Davis','Erickson-Reed','smerickson@ra.rockwell.com','CVB',15552,'N/A','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Richard','Drain','@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Larry','Orlowski','lworlows@ra.rockwell.com','CVB',15552,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Nikhil','Kaniyath Poothakandiyil','nkaniyathpoothakandiyil@ra.rockwell.com','CVB',15552,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Adrian','Pantea','@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Aaron (Tyler)','Johnson','ATJohnso@ra.rockwell.com','CVB',15930,' ','VJO',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Nicolas','Subotich','NDSuboti@ra.rockwell.com','CVB',15552,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kim','Gentes','kagentes@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('sayeeda','banu','sbanu@ra.rockwell.com','CVB',15552,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('John','Armstrong','jrarmstr@ra.rockwell.com','CVB',1000,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Yixian','Zhao','yzhao@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Corey','Jallen','@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Christopher','Hays','chays@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Laura','Nagy','@ra.rockwell.com','CVB',15553,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Dolly','Colgrove','lfolden@ra.rockwell.com','CVB',15564,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('David','Mannion','dmannion@ra.rockwell.com','CVB',15930,' ','VJO',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Debra','Lewis',' DTLEWIS@ra.rockwell.com','CVB',15554,' ','PAZ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-07-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



-- schedule set 3
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students ,is_canceled, course_id, instructor_id) 
	VALUES('2015-07-20T00:00:00', '2015-07-24T00:00:00', 'MAY', 25, 14, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY();


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Lou','Antloga',' LANTLOGA@RA.ROCKWELL.COM',' ',0,'CS-D 348','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Thomas','White','TRWhite@ra.rockwell.com',' ',0,'CS-D254','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sergio','Martinez-Rios','SMarti34@ra.rockwell.com',' ',0,'CSC-216','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Yogesh','Patel','ypatel2@ra.rockwell.com',' ',0,'CN-A212','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Bennett','Sherman','bsherma@ra.rockwell.com',' ',0,'CS-D352','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Aaron','Maharry','amaharr@ra.rockwell.com',' ',0,'CS-D352','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kei','Hitomi','khitomi@ra.rockwell.com',' ',0,'CS-D351','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sean','Buckley','sbuckle@ra.rockwell.com',' ',0,'CS-C345','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sudeshna','Chakraborty','schakraborty2@ra.rockwell.com',' ',0,'CS-A340','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kevin','Gonzalez','KRGONZAL@ra.rockwell.com',' ',0,'CSD 306','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Faisal','Ahmed','rjchiles@ra.rockwell.com',' ',0,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Brian','Knight','bcknight@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Nick','Lockard','NLockar@ra.rockwell.com',' ',0,'ND306','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Eugene','Foley','Efoley@ra.rockwell.com',' ',0,'CS-C328','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-07-21T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



--schedule set 4
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students ,is_canceled, course_id, instructor_id) 
	VALUES('2016-06-13T00:00:00', '2016-06-17T00:00:00', 'MAY', 25, 10, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Levi','Burner','LBurner@ra.rockwell.com','CVB',15518,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kevin','Griesser','KTGriess@ra.rockwell.com','CVB',15518,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Allie','Meier','AMeier@ra.rockwell.com','CVB',15518,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Michael','Shullick','MShulli@ra.rockwell.com','CVB',15518,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mary','Hicks','mbhicks@ra.rockwell.com','CVB',15518,'N - C109','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Janet','Cooper','@ra.rockwell.com','CVB',15507,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Alberto','Romanach','@ra.rockwell.com','CVB',15522,'N-C109','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Bryan','Kumataka','bkumata@ra.rockwell.com','PCB',10039,' ','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Michael','Lemberger','mjlemberger@ra.rockwell.com','PCB',10039,'6-U28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Douglas','Neu','dneu1@ra.rockwell.com','CVB',10088,'4-S26','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-14T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 5
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-06-06T00:00:00', '2016-06-10T00:00:00', 'MKE', 25, 11, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Cheryl','Whitten','cljohnston@ra.rockwell.com','CVB',15518,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


-- INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Lynette','Nettles','lnettles@ra.rockwell.com','CVB',15522,' ','MAY',null);
INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Lynette','Nettles','lnettles@ra.rockwell.com','CVB',15522,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jason','Pickens','jjpickens@ra.rockwell.com','CVB',15507,'CN-C208','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Walt','Guseman','wgusema@ra.rockwell.com','CVB',15507,'CN-C224','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


-- INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jeremy','Stratton','JPStratt@ra.rockwell.com@ra.rockwell.com','CVB',15533,'CN-C349','MAY',null);
INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jeremy','Stratton','jpstratt@ra.rockwell.com','CVB',15533,'CN-C349','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Ailin','Yu','@ra.rockwell.com','CVB',15560,'TDB','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Anno ','Akker','@ra.rockwell.com','CVB',15506,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sam','Petty','@ra.rockwell.com','CVB',15506,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Huvra','Mehta','klskippers@ra.rockwell.com','CVB',15521,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Joe','Hirschfeld','JBHirsch@ra.rockwell.com','CVB',15507,'CN-C280','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sean','Tomecko','smtomeck@ra.rockwell.com','CVB',15507,'CN-C272','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 6
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-06-06T00:00:00', '2016-06-10T00:00:00', 'MKE', 25, 4, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kristin','Roth','keroth@ra.rockwell.com','CVB',10246,'4-N22','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Chirag','Malkan','clmalkan@ra.rockwell.com','PCB',10039,' ','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Darryl','Whitley','dewhitley@ra.rockwell.com','PCB',10046,'6-U28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Doug','Champe','dchampe@ra.rockwell.com','CVB',15560,'A12','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-06-07T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 7
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-03-14T00:00:00', '2016-03-18T00:00:00', 'MKE', 25, 6, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Tejswini','Deshpande','TSDeshpa@ra.rockwell.com','Motion',6029,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-15T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Rondi','Bystrom','rcbystrom@ra.rockwell.com','CVB',15560,'3B9','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-15T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Chirag','Malkan','clmalkan@ra.rockwell.com','PCB',10039,'6W28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-15T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Alpesh','Viramgami','aviramg@ra.rockwell.com','CVB',10039,'6-U28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-15T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Shirley','He','@ra.rockwell.com','Motion',6027,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-15T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Ilya','Gurevich','igurevich@ra.rockwell.com','Motion',6029, '3-1 H-3','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-15T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 8
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-03-21T00:00:00', '2016-03-25T00:00:00', 'MKE', 25, 8, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Amanda','Bruessel','@ra.rockwell.com','CVB',15521,'4-T20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Ronald','Neckuty','rrneckuty@ra.rockwell.com','CVB',10070,'3B12','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Greg','Shuler','@ra.rockwell.com','CVB',15566,'16 3 A12','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Meena','Held','mvheld@ra.rockwell.com','Motion',6027,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jocelyn','Lazo','jlazo@ra.rockwell.com','CVB',10088,'4-S26','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sudheer','Bysani','sbysani@ra.rockwell.com','CVB',10088,'4-T27','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Sarah','Nelson','smnelso1@ra.rockwell.com',' ',0,'NA','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Chirag','Malkan','clmalkan@ra.rockwell.com','PCB',10039,' ','MKE',null); --
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-03-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


----------------------------------------------
-- schedule set 9
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2015-05-11T00:00:00', '2015-05-15T00:00:00', 'MKE', 25, 10, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Kelly','Laughlin-Parker','klaughl@ra.rockwell.com',' ',0,'6-U26','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jack','Batzner','jabatzner@ra.rockwell.com',' ',0,'4-R22','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mike','Banducci','mebanduc@ra.rockwell.com',' ',0,'3-B9','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Leo','Schnitzler','lgschnitzler@ra.rockwell.com',' ',0,'3-A14','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Darrell','Faber','dfaber@ra.rockwell.com',' ',0,'4-O21','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jes','Asmussen','jasmussen@ra.rockwell.com',' ',0,'U28 floor6','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jesse','Hein','jjhein@ra.rockwell.com',' ',0,'4-P21','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Robert','Schlaf','@ra.rockwell.com',' ',0,'3K18','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Peter','Queen','ptqueen@ra.rockwell.com',' ',0,'3-A11','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Rigoberto','Macias','rmacias@ra.rockwell.com',' ',0,'3-C12','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-12T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 10
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2015-05-18T00:00:00', '2015-05-22T00:00:00', 'MKE', 25, 11, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Doug','Fieldbinder','dfieldbinder@ra.rockwell.com',' ',0,'6-V28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('David','Messersmith','dmmessersmith@ra.rockwell.com',' ',0,'6-P28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Darrick','White','dkwhite@ra.rockwell.com',' ',0,'4-R20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Alex','Lubimov','aylubimov@ra.rockwell.com',' ',0,'4-R20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Dave','Johnson','dkjohnson@ra.rockwell.com',' ',0,'3-A11','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Haison','Lu','hplu@ra.rockwell.com',' ',0,'3-C7','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Dean','Dowsett','dadowsett@ra.rockwell.com',' ',0,'3-A8','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Phillip','Falck','prfalck@ra.rockwell.com',' ',0,'4S-20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('James','Fyne','jfyne@ra.rockwell.com',' ',0,'5-O26','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Eric','Waydick','emwaydick@ra.rockwell.com',' ',0,'6-W27','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('William','Glaser','wtglaser@ra.rockwell.com',' ',0,'6P28','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-05-19T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 11
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2015-11-09T00:00:00', '2015-11-13T00:00:00', 'MAY', 25, 11, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mark','Jenkins','mwjenkins@ra.rockwell.com',' ',0,'CNA-214','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Chris','DePolo','cmdepolo@ra.rockwell.com',' ',0,'csd304','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Bennett','Gold','bgold@ra.rockwell.com',' ',0,'CN-D223','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Dimitre','Todorov','dmtodoro@ra.rockwell.com',' ',0,'CN-D202','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('John','Burky','jjburky@ra.rockwell.com',' ',0,'N-D313','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Cheryl','Johnston','cljohnston@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('christopher','DePolo','cmdepolo@ra.rockwell.com',' ',0,'csd-301','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Russell','Bishop','RCBishop@ra.rockwell.com',' ',0,'CS-C232','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Brad','Arnold','barnold@ra.rockwell.com',' ',0,'CN-C337','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Nathan','Smith','NBSMITH1@RA.ROCKWELL.COM',' ',0,'CS-C318','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Patrick','Murphy','PMurphy2@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-11-10T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 12
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-10-17T00:00:00', '2016-10-21T00:00:00', 'MKE', 25, 10, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Utsab','Pant','upant@ra.rockwell.com','CVB',15566,'3-B10','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Terrence ','Clement','tclement1@ra.rockwell.com','PCB',6017,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('David','Gardner','djgardner@ra.rockwell.com','CVB',10078,'4-P21','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jeffrey','Dujmovic','jwdujmov@ra.rockwell.com','Motion',6029,'2-2 K-2','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Adrianne','Light','@ra.rockwell.com','Motion',6029,' ','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Yahya ','Sendi','ysendi@ra.rockwell.com','Motion',6011,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Zeljko','Jankovic','zjankov@ra.rockwell.com','PCB',6011,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Utsab','Pant','upant@ra.rockwell.com','CVB',10088,'3-B10','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mohit','Sahay','msahay1@ra.rockwell.com','CVB',10088,'3-B10','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Amy','Domini','amhanson@ra.rockwell.com','Motion',32,' ','MCM',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


----------------------------------------------
--schedule set 13
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2015-10-17T00:00:00', '2015-10-21T00:00:00', 'MKE', 25, 11, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Michael','Moriarty','MJMoriar@ra.rockwell.com',' ',0,'4Q20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Eric','Jonardi','EMJONAR1@ra.rockwell.com',' ',0,'4-U21','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Torii','Swader','tswader@ra.rockwell.com',' ',0,'4-T20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Samir','Patel','spatel10@ra.rockwell.com',' ',0,'4-R22','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('James','Pfingsten','jrpfingsten@ra.rockwell.com',' ',0,'eval','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Josh','Bartz','jabartz@ra.rockwell.com',' ',0,' ','MEQ',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Randall','Neu','RSNeu@ra.rockwell.com',' ',0,' ','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Craig','Steinfort','cdsteinf@ra.rockwell.com',' ',0,'4-U20','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('John','Hintz','jmhintz@ra.rockwell.com',' ',0,'U21','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mark','Winney','mjwinney@ra.rockwell.com',' ',0,'3-C12','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Brian','Riedl','briedl@ra.rockwell.com',' ',0,'4-R22','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-10-18T00:00:00', SCOPE_IDENTITY(), @thisSchedID);



----------------------------------------------
--schedule set 14
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id) 
	VALUES('2016-09-19T00:00:00', '2016-09-23T00:00:00', 'MAY', 25, 4, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Jason','Pickens',' jjpickens@ra.rockwell.com','CVB',15507,'CN-C208','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-09-20T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Ashish','Anand','aanand2@ra.rockwell.com','CVB',15507,'MAY-N-A123','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-09-20T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Emily','Sabaka','ESabaka@ra.rockwell.com','CVB',15507,'MAY-N-A121','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-09-20T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Denise','Lafuse','drlafuse@ra.rockwell.com','CVB',15507,'MAY-N-A106','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2016-09-20T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


----------------------------------------------
--schedule set 15
----------------------------------------------
INSERT INTO [Schedule](start_date, end_date, area, max_capacity, num_of_students, is_canceled, course_id, instructor_id)
	VALUES('2015-09-21T00:00:00', '2015-09-25T00:00:00', 'MAY', 25, 18, 0, @thisInstructorID, @thisCourseID);
SET @thisSchedID = SCOPE_IDENTITY(); 


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Nayana','Dhaveji','NDHAVEJ@RA.ROCKWELL.COM',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Faisal','Ahmed','fahmed@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Faisal','Ahmed','fahmed1@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Piyush','Mohabansi','pmohaba@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Mike','Lampkin','mlampki1@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Heath','Bewley','habewley@ra.rockwell.com',' ',0,'N-D307','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Louis','Antloga','lantloga@ra.rockwell.com',' ',0,'CS-D348','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Eugene','Mourzine','emourzi1@ra.rockwell.com',' ',0,'CND-216','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('David','Fricke','DEFRICKE@ra.rockwell.com',' ',0,'CS-C331','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Patrick','Feeley','PGFEELEY@ra.rockwell.com',' ',0,'CS-C329','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Anthony','Christensen','achristensen1@ra.rockwell.com',' ',0,'CN-D223','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Starr','Andersen','sanders7@ra.rockwell.com',' ',0,'C12','MKE',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Chris','Isabella','CAIsabel@ra.rockwell.com',' ',0,' ','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Bernard','Geary','BTGEARY@RA.ROCKWELL.COM',' ',0,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Russell','Bishop','RCBISHOP@RA.ROCKWELL.COM',' ',0,'TBD','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Olivia','Morales Leslie','OMORALE2@ra.rockwell.com',' ',0,'CN-C313','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Nathan','Smith','NBSmith1@ra.rockwell.com',' ',0,'CS-C318','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);


INSERT INTO [Employee](fname, lname, email, bus_unit, cost_cent, cube_loc, area, employeeId) VALUES('Benjamin','Henderson','bhenderson@ra.rockwell.com','CVB',15507,'MAY-N-A122','MAY',null);
INSERT INTO [Enrollment](timestamp, employee_id, schedule_id) VALUES('2015-09-22T00:00:00', SCOPE_IDENTITY(), @thisSchedID);