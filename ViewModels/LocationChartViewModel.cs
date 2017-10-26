using System.Collections.Generic;
using System.Linq;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class LocationChartViewModel
    {
        private double _locationEnrollments;

        public IEnumerable<Schedule> Schedule { get; set; }
        public IEnumerable<Location> Locations { get; set; }
        public int TotalEnrollments { get; private set; }
        
        public LocationChartViewModel()
        {
        }

        public LocationChartViewModel(IEnumerable<Schedule> schedule, IEnumerable<Location> locations)
        {
            Locations = locations;
            Schedule = schedule;
            TotalEnrollments = SetTotalEnrollments();
        }

        public double LocationEnrollments
        {
            get { return _locationEnrollments; }
            private set
            {
                _locationEnrollments = value;
                _locationEnrollments = SetTotalEnrollments();
            }
        }

        public double GetLocationEnrollments(string area)
        {
            //var locSchedule = Schedule
            //    .Where(s => s.Location.area == area)
            //    .ToList();

            //var num = locSchedule.Sum(schedule => schedule.Enrollments.Count);
            //return num;
            return Schedule.Sum(schedule => schedule.Enrollments.Count(e => e.Employee.Location.area == area));
        }

        private int SetTotalEnrollments()
        {
            return Schedule.Sum(schedule => schedule.Enrollments.Count);
        }

    }
}