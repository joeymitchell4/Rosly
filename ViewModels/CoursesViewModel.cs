using Rosly.Models;
using System.Collections.Generic;

namespace Rosly.ViewModels
{
    public class CoursesViewModel
    {
        public IEnumerable<Schedule> UpcomingCourses { get; set; }

        public IEnumerable<Location> Locations { get; set; }

        public bool ShowActions { get; set; }
    }
}