using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;
using Rosly.ViewModels;

namespace Rosly.Repositories
{
    public class EmployeeRepository
    {
        private readonly RoslyDbEntities _db;

        public EmployeeRepository()
        {
        }

        public EmployeeRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public IEnumerable<Employee> GetEmployees()
        {
            return _db.Employee.ToList();
        }

        public Employee FindEmployee(int? id)
        {
            return _db.Employee.Find(id);
        }

        public Employee GetEmployee(int id)
        {
            return _db.Employee.SingleOrDefault(e => e.id == id);
        }

        public Employee GetEmployee(string lname, string email)
        {
            return _db.Employee.SingleOrDefault(e => e.lname == lname && e.email == email);
        }
    }
}
