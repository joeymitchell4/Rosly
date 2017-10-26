using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rosly.Models;
using Rosly.Repositories;
using Rosly.ViewModels;

namespace Rosly.Services
{
    public class EmployeeService
    {
        private readonly Employee _employee;
        private readonly EmployeeRepository _employeeRepository;
        private readonly RoslyDbEntities _db;
        public EmployeeService()
        {
            _db = new RoslyDbEntities();
            _employeeRepository = new EmployeeRepository(_db);
        }

        public EmployeeService(Employee employee)
        {
            _employee = employee;
            _db = new RoslyDbEntities();
            _employeeRepository = new EmployeeRepository(_db);
        }

        public EmployeeService(Employee employee, RoslyDbEntities db)
        {
            _employee = employee;
            _db = db;
            _employeeRepository = new EmployeeRepository(_db);
        }

        public EmployeeService(RoslyDbEntities db)
        {
            _db = db;
            _employeeRepository = new EmployeeRepository(_db);
        }

        // Add Employee to database
        public Employee AddEmployee(EmployeeFormViewModel viewModel, short? empId)
        {
            var employee = _employeeRepository.GetEmployee(viewModel.LastName, viewModel.Email);
            if (employee != null)
                return null;

            employee = new Employee
            {
                lname = viewModel.LastName,
                fname = viewModel.FirstName,
                email = viewModel.Email,
                bus_unit = viewModel.BusUnit,
                cost_cent = viewModel.GetCostCent(),
                cube_loc = viewModel.CubeLocation,
                area = viewModel.Area,
                employeeId = empId ?? null
            };

            _db.Employee.Add(employee);
            //_db.SaveChanges();

            var id = employee.id;

            return employee;
        }

        public void Modify(EmployeeFormViewModel viewModel)
        {
            _employee.fname = viewModel.FirstName;
            _employee.lname = viewModel.LastName;
            _employee.email = viewModel.Email;
            _employee.bus_unit = viewModel.BusUnit;
            _employee.area = viewModel.Area;
            _employee.cube_loc = viewModel.CubeLocation;
            _employee.cost_cent = viewModel.GetCostCent();

            if (viewModel.EmployeeId != null)
            {
                short empId;
                var empIdFlag = short.TryParse(viewModel.EmployeeId, out empId);
                if (empIdFlag)
                {
                    _employee.employeeId = empId;
                }
            }
        }

        public void Notify(Notification notification, bool isEmailNotification)
        {
            var userNotification = new UserNotification(_employee, notification, isEmailNotification);

            _db.UserNotification.Add(userNotification);

            //if (isEmailNotification)
            //{
            //    EmailService emailService = new EmailService(userNotification);
            //    emailService.SendEmail();
            //}
        }
    }
}