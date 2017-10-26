using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;
using Rosly.ViewModels;

namespace Rosly.Repositories
{
    public class InstructorRepository
    {
        private readonly RoslyDbEntities _db;

        public InstructorRepository()
        {
            
        }

        public InstructorRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public Instructor GetInstructor(string email)
        {
            return _db.Instructor.Single(i => i.email == email);
        }

        public IEnumerable<Instructor> GetInstructors()
        {
            return _db.Instructor.ToList();
        }

        public bool DoesInstructorExist(string email)
        {
            return _db.Instructor.Any(c => c.email == email);
        }
    }
}
