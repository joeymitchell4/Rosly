using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rosly.Models
{
    public enum NotificationType : byte
    {
        CourseCancelled = 1,
        CourseUpdated = 2,
        CourseCreated = 3,
        EmployeeEnrolled = 4,
        EmployeeUnenrolled = 5,
        EmployeeWaitlisted = 6,
        SpotAvailable = 7
    }
}
