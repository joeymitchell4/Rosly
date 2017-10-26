using System.Collections.Generic;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class ScheduleDetailsViewModel
    {
        public IEnumerable<Employee> EnrolledEmployees { get; set; } 
        public string Description { get; set; }
        public string Area { get; set; }
        public string Name { get; set; }
        public int Id { get; set; }
        public string StartDate { get; set; }
        public int NumOfStudents { get; set; }
        public int NumOfWaitlistedStudents { get; set; }
        public int MaxCapacity { get; set; }
    }
}