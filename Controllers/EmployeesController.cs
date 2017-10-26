using Rosly.Models;
using Rosly.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Rosly.Repositories;
using Rosly.Services;

namespace Rosly.Controllers
{
    public class EmployeesController : Controller
    {
        private RoslyDbEntities _db;
        private readonly LocationRepository _locationRepository;
        private readonly EmployeeRepository _employeeRepository;
        private readonly ScheduleRepository _scheduleRepository;
        private readonly EnrollmentRepository _enrollmentRepository;
        private readonly BusUnitRepository _busUnitRepository;

        public EmployeesController()
        {
            _db = new RoslyDbEntities();
            _locationRepository = new LocationRepository(_db);
            _employeeRepository = new EmployeeRepository(_db);
            _scheduleRepository = new ScheduleRepository(_db);
            _enrollmentRepository = new EnrollmentRepository(_db);
            _busUnitRepository = new BusUnitRepository(_db);
        }

        // GET: Employees
        public ActionResult Index()
        {
            var employees = _employeeRepository.GetEmployees();

            return View(employees);
        }

        // GET: Employees/Create
        public ActionResult Create()
        {
            var areas = _locationRepository.GetLocations();

            var viewModel = new EmployeeFormViewModel()
            {
                Areas = areas
            };

            return View("EmployeeForm", viewModel);
        }

        //POST: Employees/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EmployeeFormViewModel viewModel)
        {
            short bus;
            short empId;
            bool busFlag = short.TryParse(viewModel.CostCent, out bus);
            bool empIdFlag = true;
            if (viewModel.EmployeeId != null)
            {
                empIdFlag = short.TryParse(viewModel.EmployeeId, out empId);
            }
            else
            {
                empId = 0;
            }

            if (!ModelState.IsValid || busFlag == false)
            {
                viewModel.Areas = _locationRepository.GetLocations();
                viewModel.BusUnits = _busUnitRepository.GetBusUnits();

                return View("EmployeeForm", viewModel);
            }

            if (empIdFlag == true && empId > 0)
            {
                var empService = new EmployeeService(_db);

                empService.AddEmployee(viewModel, empId);
            }
            else
            {
                var empService = new EmployeeService(_db);
                empService.AddEmployee(viewModel, null);
            }

            return RedirectToAction("Index", "Employees");
        }

        // GET: Employess/Edit
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var employee = _employeeRepository.FindEmployee(id);
            if (employee == null)
            {
                return HttpNotFound();
            }

            var viewModel = new EmployeeFormViewModel()
            {
                Id = (int) id,
                LastName = employee.lname,
                FirstName = employee.fname,
                BusUnit = employee.bus_unit,
                BusUnits = _busUnitRepository.GetBusUnits(),
                CubeLocation = employee.cube_loc,
                CostCent = employee.cost_cent.ToString(),
                Email = employee.email,
                EmployeeId = employee.employeeId.ToString(),
                Area = employee.area,
                Areas = _locationRepository.GetLocations()
            };

            return View("EmployeeForm", viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(EmployeeFormViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                viewModel.Areas = _locationRepository.GetLocations();
                viewModel.BusUnits = _busUnitRepository.GetBusUnits();

                return View("EmployeeForm", viewModel);
            }
            short cent;
            var busFlag = short.TryParse(viewModel.CostCent, out cent);

            var employee = _employeeRepository.GetEmployee(viewModel.Id);

            var empService = new EmployeeService(employee);

            empService.Modify(viewModel);

            _db.SaveChanges();

            return RedirectToAction("Index", "Employees");
        }

        // GET: Employees/Enroll
        public ActionResult Enroll(int id)
        {
            var areas = _locationRepository.GetLocations();
            var busUnits = _busUnitRepository.GetBusUnits();

            var viewModel = new EmployeeFormViewModel()
            {
                Heading = "Register For Course",
                CourseId = id,
                Areas = areas,
                BusUnits = busUnits
            };

            return View("EmployeeForm", viewModel);
        }

        //POST: Employees/Enroll/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Enroll(EmployeeFormViewModel viewModel)
        {
            var employee = _employeeRepository.GetEmployee(viewModel.LastName, viewModel.Email);

            if (employee != null)
            {
                if (_enrollmentRepository.IsEnrolled(employee.id, viewModel.Id))
                {
                    return RedirectToAction("Details", "Schedule", new { id = viewModel.CourseId });
                }

                var schedule = _scheduleRepository.GetScheduledCourse(viewModel.CourseId);
                var scheduleService = new ScheduleService(schedule, _db);
                scheduleService.Enroll(employee);

                _db.SaveChanges();

                return RedirectToAction("Details", "Schedule", new { id = viewModel.CourseId });
            }
            else
            {
                viewModel.NewEmployeeFlag = 1;
                return RedirectToAction("EnrollCreate", "Employees", viewModel);
            }
        }

        // GET: Employees/Enroll/5
        public ActionResult EnrollCreate(EmployeeFormViewModel model)
        {
            //model.NewEmployeeFlag = flag;
            model.Areas = _locationRepository.GetLocations();
            model.BusUnits = _busUnitRepository.GetBusUnits();
            model.Heading = "Register New Employee For Course";

            return View("EmployeeForm", model);
        }

        // POST: Employees/EnrollAndCreate
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EnrollAndCreate(EmployeeFormViewModel viewModel)
        {
            short bus;
            if (!ModelState.IsValid || !short.TryParse(viewModel.CostCent, out bus))
            {
                viewModel.Areas = _locationRepository.GetLocations();
                viewModel.BusUnits = _busUnitRepository.GetBusUnits();

                return View("EmployeeForm", viewModel);
            }
            
            var empService = new EmployeeService(_db);
            var employee = empService.AddEmployee(viewModel, null);
            var schedule = _scheduleRepository.GetScheduledCourse(viewModel.CourseId);

            if (employee != null && schedule != null)
            {
                var scheduleService = new ScheduleService(schedule, _db);
                scheduleService.Enroll(employee);
                
                _db.SaveChanges();

            }
            else
            {
                viewModel.Areas = _locationRepository.GetLocations();
                viewModel.BusUnits = _busUnitRepository.GetBusUnits();

                return View("EmployeeForm", viewModel);
            }

            return RedirectToAction("Details", "Schedule", new {id = schedule.id});
        }
    }
}