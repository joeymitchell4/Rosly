using Rosly.Models;
using System.Collections.Generic;

namespace Rosly.ViewModels
{
    public class CourseDetailsViewModel
    {
        public IEnumerable<Schedule> CourseSchedule { get; set; } 
        public string Description { get; set; }
        public string Name { get; set; }
        public int Id { get; set; }
    }
}