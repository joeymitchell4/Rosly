using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;

namespace Rosly.Repositories
{
    public class CourseRepository
    {
        private readonly RoslyDbEntities _db;

        public CourseRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public Course GetCourse(int id)
        {
            return _db.Course.Single(c => c.id == id);
        }

        public bool DoesCourseExist(string name)
        {
            return _db.Course.Any(c => c.course_name == name);
        }

        public IEnumerable<Course> GetCourses()
        {
            return _db.Course
                .OrderBy(c => c.course_name).ToList();
        }
    }
}
