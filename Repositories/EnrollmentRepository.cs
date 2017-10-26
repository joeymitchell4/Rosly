using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Dtos;
using Rosly.Models;

namespace Rosly.Repositories
{
    public class EnrollmentRepository
    {
        private readonly RoslyDbEntities _db;
        private static DateTime _first;
        private static DateTime _last;
        public EnrollmentRepository()
        {

        }

        public EnrollmentRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public bool IsEnrolled(int empId, int schedId)
        {
            return _db.Enrollment.Any(e => e.employee_id == empId && e.schedule_id == schedId);
        }

        public IEnumerable<Enrollment> FindEnrollments(EnrollmentDashboardDto dto)
        {
            if (dto.Quarter != 9 && dto.Quarter != 0)
                return GetQuarterlyEnrollments(dto);
            if (dto.Schedules == null)
            {
                if (!string.IsNullOrEmpty(dto.Area))
                {
                    if (string.IsNullOrEmpty(dto.CourseName))
                        if (!string.IsNullOrEmpty(dto.BusUnit))
                            return
                                _db.Enrollment.Where(
                                    e =>
                                        e.Employee.Location.area.Contains(dto.Area) &&
                                        e.Employee.BusUnit.name == dto.BusUnit);
                        else
                            return _db.Enrollment.Where(e => e.Employee.Location.area.Contains(dto.Area));
                    {
                        if (!string.IsNullOrEmpty(dto.BusUnit))
                            return
                                _db.Enrollment.Where(
                                    e =>
                                        e.Employee.Location.area.Contains(dto.Area) &&
                                        e.Employee.BusUnit.name == dto.BusUnit &&
                                        e.Schedule.Course.course_name == dto.CourseName);
                        return
                            _db.Enrollment.Where(
                                e =>
                                    e.Employee.area.Contains(dto.Area) &&
                                    e.Schedule.Course.course_name == dto.CourseName);
                    }
                }
                if (!string.IsNullOrEmpty(dto.CourseName))
                {
                    if (!string.IsNullOrEmpty(dto.BusUnit))
                        return
                            _db.Enrollment.Where(
                                e =>
                                    e.Schedule.Course.course_name == dto.CourseName &&
                                    e.Employee.BusUnit.name == dto.BusUnit);
                    return _db.Enrollment.Where(e => e.Schedule.Course.course_name == dto.CourseName);
                }
                if (!string.IsNullOrEmpty(dto.BusUnit))
                {
                    return _db.Enrollment.Where(e => e.Employee.BusUnit.name == dto.BusUnit);
                }
                return _db.Enrollment.ToList();
            }

            return _db.Enrollment.ToList();
        }

        private IEnumerable<Enrollment> GetQuarterlyEnrollments(EnrollmentDashboardDto dto)
        {
            SetQuarter(dto.Quarter);
            if (!string.IsNullOrEmpty(dto.Area))
            {
                if (string.IsNullOrEmpty(dto.CourseName))
                    if (!string.IsNullOrEmpty(dto.BusUnit))
                        return
                            _db.Enrollment.Where(
                                e =>
                                    e.Employee.Location.area.Contains(dto.Area) &&
                                    e.Employee.BusUnit.name == dto.BusUnit &&
                                    e.Schedule.start_date >= _first
                                    && e.Schedule.start_date <= _last);
                    else
                        return _db.Enrollment.Where(e => e.Employee.Location.area.Contains(dto.Area)
                                                         && e.Schedule.start_date >= _first
                                                         && e.Schedule.start_date <= _last);
                {
                    if (!string.IsNullOrEmpty(dto.BusUnit))
                        return
                            _db.Enrollment.Where(
                                e =>
                                    e.Employee.Location.area.Contains(dto.Area) &&
                                    e.Employee.BusUnit.name == dto.BusUnit &&
                                    e.Schedule.Course.course_name == dto.CourseName &&
                                    e.Schedule.start_date >= _first
                                    && e.Schedule.start_date <= _last);
                    return
                        _db.Enrollment.Where(
                            e =>
                                e.Employee.area.Contains(dto.Area) &&
                                e.Schedule.Course.course_name == dto.CourseName &&
                                e.Schedule.start_date >= _first
                                && e.Schedule.start_date <= _last);
                }
            }
            if (!string.IsNullOrEmpty(dto.CourseName))
            {
                if (!string.IsNullOrEmpty(dto.BusUnit))
                    return
                        _db.Enrollment.Where(
                            e =>
                                e.Schedule.Course.course_name == dto.CourseName &&
                                e.Employee.BusUnit.name == dto.BusUnit && 
                                e.Schedule.start_date >= _first
                                && e.Schedule.start_date <= _last);
                return _db.Enrollment
                    .Where(e => e.Schedule.Course.course_name == dto.CourseName
                                && e.Schedule.start_date >= _first
                                && e.Schedule.start_date <= _last);
            }
            if (!string.IsNullOrEmpty(dto.BusUnit))
            {
                return _db.Enrollment.Where(e => e.Employee.BusUnit.name == dto.BusUnit
                                                 && e.Schedule.start_date >= _first
                                                 && e.Schedule.start_date <= _last);
            }
            return _db.Enrollment.Where(e => e.Schedule.start_date >= _first
                                             && e.Schedule.start_date <= _last).ToList();
        }

        private static void SetQuarter(int quarter)
        {
            switch (quarter)
            {
                case (int)Quarter.Q1:
                    _first = new DateTime(DateTime.Now.Year, 1, 1);
                    _last = new DateTime(DateTime.Now.Year, 3, 31);
                    break;
                case (int)Quarter.Q1P:
                    _first = new DateTime(DateTime.Now.Year - 1, 1, 1);
                    _last = new DateTime(DateTime.Now.Year - 1, 3, 31);
                    break;
                case (int)Quarter.Q2:
                    _first = new DateTime(DateTime.Now.Year, 4, 1);
                    _last = new DateTime(DateTime.Now.Year, 6, 30);
                    break;
                case (int)Quarter.Q2P:
                    _first = new DateTime(DateTime.Now.Year - 1, 4, 1);
                    _last = new DateTime(DateTime.Now.Year - 1, 6, 30);
                    break;
                case (int)Quarter.Q3:
                    _first = new DateTime(DateTime.Now.Year, 7, 1);
                    _last = new DateTime(DateTime.Now.Year, 9, 30);
                    break;
                case (int)Quarter.Q3P:
                    _first = new DateTime(DateTime.Now.Year - 1, 7, 1);
                    _last = new DateTime(DateTime.Now.Year - 1, 9, 30);
                    break;
                case (int)Quarter.Q4:
                    _first = new DateTime(DateTime.Now.Year, 10, 1);
                    _last = new DateTime(DateTime.Now.Year, 12, 31);
                    break;
                case (int)Quarter.Q4P:
                    _first = new DateTime(DateTime.Now.Year - 1, 10, 1);
                    _last = new DateTime(DateTime.Now.Year - 1, 12, 31);
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(quarter), quarter, null);
            }
        }
    }
}
