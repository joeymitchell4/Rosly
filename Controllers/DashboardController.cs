using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using Rosly.Dtos;
using Rosly.Models;
using Rosly.Repositories;
using Rosly.ViewModels;
using System.Data;

namespace Rosly.Controllers
{
    public class DashboardController : Controller
    {
        private readonly RoslyDbEntities _db;
        private readonly LocationRepository _locationRepository;
        private readonly CourseRepository _courseRepository;
        private readonly ScheduleRepository _scheduleRepository;
        private readonly EnrollmentRepository _enrollmentRepository;
        private readonly BusUnitRepository _busUnitRepository;

        public DashboardController()
        {
            _db = new RoslyDbEntities();
            _locationRepository = new LocationRepository(_db);
            _courseRepository = new CourseRepository(_db);
            _scheduleRepository = new ScheduleRepository(_db);
            _enrollmentRepository = new EnrollmentRepository(_db);
            _busUnitRepository = new BusUnitRepository(_db);
        }

        // GET: Dashboard
        [HttpGet]
        public ActionResult Index()
        {
            var quarters = new[]
            {
                $"Q1 {DateTime.Now.Year - 1}", $"Q2 {DateTime.Now.Year - 1}", $"Q3 {DateTime.Now.Year - 1}",
                $"Q4 {DateTime.Now.Year - 1}", "Q1", "Q2", "Q3", "Q4"
            };
            Quarter quarter = 0;
            if (DateTime.Now.Month < 4)
                quarter = Quarter.Q1;
            else if (DateTime.Now.Month < 7)
                quarter = Quarter.Q2;
            else if (DateTime.Now.Month < 10)
                quarter = Quarter.Q3;
            else if (DateTime.Now.Month <= 12)
                quarter = Quarter.Q4;

            int quarterVal = (int) quarter;
            var viewModel = new DashboardViewModel
            {
                Locations = _locationRepository.GetLocations(),
                Courses = _courseRepository.GetCourses(),
                Schedules = _scheduleRepository.GetCoursesByQuarter(quarter),
                BusUnits = _busUnitRepository.GetBusUnits(),
                Quarter = quarterVal.ToString(),
            };

            return View("Index", viewModel);
        }

        [HttpGet]
        public ActionResult ByQuarter(int? val)
        {
            Quarter quarter = GetQuarter(val);

            var viewModel = new DashboardViewModel
            {
                Locations = _locationRepository.GetLocations(),
                Courses = _courseRepository.GetCourses(),
                Schedules = _scheduleRepository.GetCoursesByQuarter(quarter),
                BusUnits = _busUnitRepository.GetBusUnits(),
                Quarter = ((int)quarter).ToString(),
            };

            return View("Index", viewModel);
        }

        private static Quarter GetQuarter(int? val)
        {
            Quarter quarter;

            switch (val)
            {
                case 1:
                    quarter = Quarter.Q1P;
                    break;
                case 2:
                    quarter = Quarter.Q2P;
                    break;
                case 3:
                    quarter = Quarter.Q3P;
                    break;
                case 4:
                    quarter = Quarter.Q4P;
                    break;
                case 5:
                    quarter = Quarter.Q1;
                    break;
                case 6:
                    quarter = Quarter.Q2;
                    break;
                case 7:
                    quarter = Quarter.Q3;
                    break;
                case 8:
                    quarter = Quarter.Q4;
                    break;
                default:
                    quarter = Quarter.All;
                    break;
            }

            return quarter;
        }

        public ActionResult HiddenFields(string area, string courseName, string busUnit, int quarter)
        {
            var viewModel = new HiddenFieldsViewModel
            {
                Area = area,
                CourseName = courseName,
                BusUnit = busUnit,
                Quarter = (int)GetQuarter(quarter)
            };

            return PartialView(viewModel);
        } 

        public ActionResult GetEnrollments(EnrollmentDashboardDto dto)
        {
            var enrollments = _enrollmentRepository.FindEnrollments(dto);
            var viewModel = new EnrollmentDashboardViewModel
            {
                Enrollments = enrollments
            };

            return PartialView(viewModel);
        }

        [HttpPost]
        public ActionResult ExportButton()
        {

            DataTable dt = new DataTable();
            //make a huge datacolumn to store all the db stuff
            dt.Columns.AddRange(new DataColumn[17]{
                new DataColumn("fname", typeof(string)),
                new DataColumn("lname", typeof(string)),
                new DataColumn("area", typeof(string)),
                new DataColumn("cube", typeof(string)),
                new DataColumn("email", typeof(string)),
                new DataColumn("cost", typeof(string)),
                new DataColumn("bus", typeof(string)),
                new DataColumn("empid", typeof(string)),

                new DataColumn("stdate", typeof(string)),
                new DataColumn("endate", typeof(string)),
                new DataColumn("maxcap", typeof(string)),
                new DataColumn("numofstu", typeof(string)),
                new DataColumn("carea", typeof(string)),

                new DataColumn("cname", typeof(string)),

                new DataColumn("ifname", typeof(string)),
                new DataColumn("ilname", typeof(string)),
                new DataColumn("iemail", typeof(string)),

            });

            //Headers
            //employee dump
            DataRow header = dt.NewRow();
            header["fname"] = "First Name";
            header["lname"] = "Last Name";
            header["area"] = "Area";
            header["cube"] = "cube_loc";
            header["email"] = "Email";
            header["cost"] = "Cost Center";
            header["bus"] = "Business Unit";
            header["empid"] = "Employee ID";

            //schedule dump
            header["stdate"] = "Start Date";
            header["endate"] = "End Date";
            header["maxcap"] = "Maximum Capacity";
            header["numofstu"] = "Registered Students";

            header["carea"] = "Course Area";

            header["cname"] = "Course Name";

            //instructor
            header["ifname"] = "Instructor First Name";
            header["ilname"] = "Instructor Last Name";
            header["iemail"] = "Instructor Email";

            dt.Rows.Add(header);

            foreach (Enrollment en in _db.Enrollment.ToList())
            {
                DataRow emprow = dt.NewRow();
                //get references
                Employee e = _db.Employee.Find(en.employee_id);
                Schedule s = _db.Schedule.Find(en.schedule_id);
                Course c = _db.Course.Find(s.course_id);
                Instructor ins = _db.Instructor.Find(s.instructor_id);


                //employee dump
                emprow["fname"] = e.fname.ToString();
                emprow["lname"] = e.lname.ToString();
                emprow["area"] = e.area.ToString();
                emprow["cube"] = e.cube_loc.ToString();
                emprow["email"] = e.email.ToString();
                emprow["cost"] = e.cost_cent.ToString();
                emprow["bus"] = e.bus_unit.ToString();
                emprow["empid"] = e.employeeId.ToString();

                //schedule dump
                emprow["stdate"] = s.start_date.ToString();
                emprow["endate"] = s.end_date.ToString();
                emprow["maxcap"] = s.max_capacity.ToString();
                emprow["numofstu"] = s.num_of_students.ToString();

                emprow["carea"] = s.area.ToString();

                emprow["cname"] = c.course_name.ToString();

                //instructor
                emprow["ifname"] = ins.fname.ToString();
                emprow["ilname"] = ins.lname.ToString();
                emprow["iemail"] = ins.email.ToString();

                dt.Rows.Add(emprow);

            }

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            //throw all of these into a string
            foreach (DataRow x in dt.Rows)
            {
                sb.Append(string.Join(",", x.ItemArray));
                sb.Append(System.Environment.NewLine);
            }


            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment; filename=myfile.csv");
            Response.ContentType = "text/csv";

            // Write all my data
            Response.Write(sb);
            Response.End();

            return null;
        }

    }
}