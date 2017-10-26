using Rosly.Models;
using Rosly.ViewModels;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Rosly.Repositories;

namespace Rosly.Controllers
{
    public class CoursesController : Controller
    {
        private readonly RoslyDbEntities _db;
        private readonly InstructorRepository _instructorRepository;
        private readonly LocationRepository _locationRepository;
        private readonly CourseRepository _courseRepository;
        private readonly ScheduleRepository _scheduleRepository;

        public CoursesController()
        {
            _db = new RoslyDbEntities();
            _instructorRepository = new InstructorRepository(_db);
            _courseRepository = new CourseRepository(_db);
            _locationRepository = new LocationRepository(_db);
            _scheduleRepository = new ScheduleRepository(_db);
        }
        
        // GET: Courses
        public ActionResult Index()
        {
            //var sixMonthsAgo = DateTime.Now.AddMonths(-6);

            var user = User.Identity.IsAuthenticated;

            var viewModel = new CoursesViewModel()
            {
                UpcomingCourses = _scheduleRepository.GetUpcomingCourses().ToList(),
                Locations = _locationRepository.GetLocations().ToList(),
                ShowActions = user
            };

            return View(viewModel);
        }

        // Get: Courses/Create
        [Authorize]
        public ActionResult Create()
        {
            var areas = _locationRepository.GetLocations();
            var instructors = _instructorRepository.GetInstructors();
            //var course = db.Courses.SingleOrDefault(c => c.id == id);
            var courses = _courseRepository.GetCourses();

            var viewModel = new CourseFormViewModel()
            {
                
            };

            return PartialView("CreateModalView", viewModel);
            //return PartialView("CourseForm", viewModel);
        }

        // Post: Courses/Create
        [System.Web.Mvc.HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create(CourseFormViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                return PartialView("CourseForm", viewModel);
            }

            var course = new Course()
            {
               description = viewModel.Description,
               course_name = viewModel.CourseId
            };

            if (_db.Course.Any(c => c.course_name == viewModel.CourseId))
                return PartialView("CourseForm", viewModel);

            _db.Course.Add(course);
            _db.SaveChanges();

            return RedirectToAction("Index", "Courses");
        }

        public ActionResult Edit(int id)
        {
            var course = _courseRepository.GetCourse(id);

            if (course == null)
            {
                return HttpNotFound();
            }

            var viewModel = new CourseFormViewModel()
            {
                Id = id,
                CourseId = course.course_name,
                Description = course.description
            };

            return View("CourseForm", viewModel);
        }

        [System.Web.Mvc.HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(CourseFormViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                return View("CourseForm", viewModel);
            }

            var course = _courseRepository.GetCourse(viewModel.Id);
            if (course == null)
            {
                return HttpNotFound();
            }

            course.description = viewModel.Description;
            course.course_name = viewModel.CourseId;

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

            var course = _courseRepository.GetCourse((int)id);

            if (course == null)
            {
                return HttpNotFound();
            }

            var viewModel = new CourseDetailsViewModel()
            {
                //EnrolledEmployees = students,
                CourseSchedule = _scheduleRepository.GetUpcomingScheduleByCourse(course),
                Id = course.id,
                Description = course.description,
                Name = course.course_name
            };

            return View(viewModel);
        }

        public ActionResult SelectCourse()
        {
            var courses = _courseRepository.GetCourses();
            var viewModel = new CourseListViewModel()
            {
                Courses = courses
            };

            return View("List", viewModel);
        }


    }
}