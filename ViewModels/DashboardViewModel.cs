using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class DashboardViewModel
    {
        public IEnumerable<string> Quarters { get; set; }
        public string Quarter { get; set; }
        public IEnumerable<Course> Courses { get; set; }
        public IEnumerable<Location> Locations { get; set; }
        public IEnumerable<Schedule> Schedules { get; set; }
        public IEnumerable<BusUnit> BusUnits { get; set; }
        public Course Course { get; set; }
        public string CourseName { get; set; }
        public string Location { get; set; }
        public Schedule Schedule { get; set; }
        public BusUnit BusUnit { get; set; }
        public string BusUnitName { get; set; }
    }
}
