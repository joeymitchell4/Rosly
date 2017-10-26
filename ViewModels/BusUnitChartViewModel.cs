using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class BusUnitChartViewModel
    {
        private double _busUnitEnrollments;

        public IEnumerable<Schedule> Schedule { get; set; }
        public IEnumerable<BusUnit> BusUnits { get; set; }
        public int TotalEnrollments { get; private set; }

        public BusUnitChartViewModel()
        {
        }

        public BusUnitChartViewModel(IEnumerable<Schedule> schedule, IEnumerable<BusUnit> busUnits)
        {
            BusUnits = busUnits;
            Schedule = schedule;
            TotalEnrollments = SetTotalEnrollments();
        }

        public double BusEnrollments
        {
            get { return _busUnitEnrollments; }
            private set
            {
                _busUnitEnrollments = value;
                _busUnitEnrollments = SetTotalEnrollments();
            }
        }

        public double GetBusUnitEnrollments(string area)
        {
            return Schedule.Sum(schedule => schedule.Enrollments.Count(e => e.Employee.BusUnit.name == area));
        }

        private int SetTotalEnrollments()
        {
            return Schedule.Sum(schedule => schedule.Enrollments.Count);
        }
    }
}