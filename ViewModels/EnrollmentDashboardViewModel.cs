using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class EnrollmentDashboardViewModel
    {
        public IEnumerable<Enrollment> Enrollments { get; set; }

        public EnrollmentDashboardViewModel()
        {
        }

        public EnrollmentDashboardViewModel(IEnumerable<Enrollment> enrollments)
        {
            Enrollments = enrollments;
        }
    }
}
