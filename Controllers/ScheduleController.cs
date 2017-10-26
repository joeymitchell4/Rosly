using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Rosly.Dtos;
using Rosly.Models;
using Rosly.Repositories;
using Rosly.Services;
using Rosly.ViewModels;

namespace Rosly.Controllers
{
    public class ScheduleController : Controller
    {
        private readonly RoslyDbEntities _db;
        private readonly LocationRepository _locationRepository;
        private readonly ScheduleRepository _scheduleRepository;
        private readonly CourseRepository _courseRepository;
        private readonly InstructorRepository _instructorRepository;

        public ScheduleController()
        {
            _db = new RoslyDbEntities();
            _courseRepository = new CourseRepository(_db);
            _scheduleRepository = new ScheduleRepository(_db);
            _locationRepository = new LocationRepository(_db);
            _instructorRepository = new InstructorRepository(_db);
        }

        // GET: Schedule
        public ActionResult Index()
        {
            return View();
        }

        // Get: Courses/Create
        [Authorize]
        public ActionResult Create()
        {
            var areas = _locationRepository.GetLocations();
            var instructors = _instructorRepository.GetInstructors();
            //var course = _db.Courses.SingleOrDefault(c => c.id == id);
            var courses = _courseRepository.GetCourses();

            var viewModel = new ScheduleFormViewModel()
            {
                Areas = areas,
                Instructors = instructors,
                Courses = courses
            };

            return View("ScheduleForm", viewModel);
        }

        // Post: Courses/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create(ScheduleFormViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                viewModel.Areas = _locationRepository.GetLocations();
                viewModel.Instructors = _instructorRepository.GetInstructors();
                //viewModel.Course = viewModel.Course;
                viewModel.Courses = _courseRepository.GetCourses();

                return View("ScheduleForm", viewModel);
            }

            var course = new Schedule()
            {
                Course = _courseRepository.GetCourse(viewModel.Course),
                start_date = viewModel.GetDateTime(),
                end_date = viewModel.GetDateTime(),
                area = viewModel.Area,
                Instructor = _instructorRepository.GetInstructor(viewModel.Instructor),
                max_capacity = viewModel.MaxCapacity,
                num_of_students = 0,
            };

            _db.Schedule.Add(course);
            _db.SaveChanges();

            return RedirectToAction("Index", "Courses");
        }

        [Authorize]
        public ActionResult Edit(int id)
        {
            var course = _scheduleRepository.GetScheduledCourse(id);

            if (course == null)
                return HttpNotFound();

            var viewModel = new ScheduleFormViewModel()
            {
                Id = id,
                StartDate = course.start_date.ToString("d MMM yyyy"),
                StartTime = course.start_date.ToString("HH:mm"),
                Areas = _locationRepository.GetLocations(),
                Area = course.area,
                MaxCapacity = course.max_capacity,
                Courses = _courseRepository.GetCourses(),
                Instructors = _instructorRepository.GetInstructors(),
                Instructor = course.Instructor.email,
                Course = course.Course.id
            };

            return View("ScheduleForm", viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Update(ScheduleFormViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                viewModel.Areas = _locationRepository.GetLocations();
                viewModel.Courses = _courseRepository.GetCourses();
                viewModel.Instructors = _instructorRepository.GetInstructors();

                return View("ScheduleForm", viewModel);
            }

            var course = _scheduleRepository.GetScheduledCourse(viewModel.Id);

            var scheduleService = new ScheduleService(course, _db);
            var instructor = _instructorRepository.GetInstructor(viewModel.Instructor);
            scheduleService.Modify(viewModel.GetDateTime(), viewModel.Area, instructor, viewModel.MaxCapacity);

            _db.SaveChanges();

            return RedirectToAction("Index", "Courses");
        }

        // Get: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var schedule = _scheduleRepository.Find(id);
            if (schedule == null)
            {
                return HttpNotFound();
            }

            var students = schedule.Enrollments.Select(e => e.Employee);
            var enrolledEmployees = schedule.Enrollments.Where(e => e.on_waitlist != true).ToList();

            var viewModel = new ScheduleDetailsViewModel()
            {
                EnrolledEmployees = students,
                Area = schedule.area,
                Id = schedule.id,
                StartDate = schedule.start_date.ToString("MMM dd, yyyy"),
                NumOfStudents = enrolledEmployees.Count(),
                NumOfWaitlistedStudents = schedule.Enrollments.Count - enrolledEmployees.Count(),
                MaxCapacity = schedule.max_capacity,
                Description = schedule.Course.description,
                Name = schedule.Course.course_name
            };

            return View(viewModel);
        }

        public ActionResult GetSpecificCourses(CourseSearchDto dto)
        {
            //var sixMonthsAgo = DateTime.Now.AddMonths(-6);

            var user = User.Identity.IsAuthenticated;

            var viewModel = new CoursesViewModel()
            {
                UpcomingCourses = _scheduleRepository.GetUpcomingScheduleSearch(dto).ToList(),
                Locations = _locationRepository.GetLocations().ToList(),
                ShowActions = user
            };

            return PartialView(viewModel);
        }
    }
}