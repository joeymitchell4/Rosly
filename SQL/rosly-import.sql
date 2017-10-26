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


INSERT INTO [Course](course_name, description) VALUES('bricksquaw','Pre-Rosly course');
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