use RoslyDb;

-- drop enrollment.schedule_id > course.enrollments
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT [FK_Enrollment_schedule];


-- rename table
exec sp_rename 'Courses', 'Schedules';


-- add enrollment.schedule_id > schedule.id (course is now schedule)
ALTER TABLE Enrollments ADD CONSTRAINT FK_Enrollments_scheduleid FOREIGN KEY (schedule_id) REFERENCES Schedules(id);

CREATE TABLE Courses(
	id tinyint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	course_id char(10) NOT NULL,
	description nvarchar(max) NOT NULL,
);


CREATE TABLE Instructors(
	id tinyint IDENTITY(1,1) NOT NULL PRIMARY KEY ,
	
	lname varchar(24) NOT NULL,
	fname varchar(24) NOT NULL,
	email varchar(254) NOT NULL,
);


ALTER TABLE Schedules ADD instructor_id tinyint REFERENCES Instructors(id);


ALTER TABLE Schedules ADD is_canceled bit;

ALTER TABLE Schedules ADD room varchar(24);

ALTER TABLE Schedules ADD CONSTRAINT UQ_course UNIQUE(course_id);

ALTER TABLE Courses ADD CONSTRAINT FK_Courses_courseid FOREIGN KEY (course_id) REFERENCES Schedules(course_id);

/*

CREATE TABLE Course(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	start_date date NOT NULL,
	end_date date NOT NULL,

	room varchar(24),
	is_canceled bit NOT NULL,
	
	area char(15) NOT NULL FOREIGN KEY REFERENCES Locations(area),
	instructor_id tinyint FOREIGN KEY REFERENCES Instructor(id),
	course_id char(10) FOREIGN KEY REFERENCES Course(course_id),

	max_capacity tinyint NOT NULL,
	num_of_students tinyint NOT NULL,
);
*/