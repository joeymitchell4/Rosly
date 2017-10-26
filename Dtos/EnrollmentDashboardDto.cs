using System.Collections.Generic;
using Rosly.Models;

namespace Rosly.Dtos
{
    public class EnrollmentDashboardDto
    {
        public string Area { get; set; }
        public string CourseName { get; set; }
        public string BusUnit { get; set; }
        public int Quarter { get; set; }
        public IEnumerable<Schedule> Schedules { get; set; }

        public EnrollmentDashboardDto()
        {
            Area = "";
            CourseName = "";
            BusUnit = "";
        }

        public EnrollmentDashboardDto(int quarter)
        {
            Quarter = quarter;
        }

        public EnrollmentDashboardDto(string area, string courseName, string busUnit, int quarter)
        {
            Area = area;
            BusUnit = busUnit;
            CourseName = courseName;
            Quarter = quarter;
        }
    }
}