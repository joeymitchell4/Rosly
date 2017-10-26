using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class CourseChartViewModel
    {
        public IEnumerable<Course> Courses { get; set; }
        public IEnumerable<Schedule> Schedules { get; set; }
        public IEnumerable<Location> Locations { get; set; }

        public CourseChartViewModel()
        {    
        }

        public CourseChartViewModel(IEnumerable<Course> courses, IEnumerable<Location> modelLocations, IEnumerable<Schedule> schedules)
        {
            Courses = courses;
            Locations = modelLocations;
            Schedules = schedules;
        }
    }
}
