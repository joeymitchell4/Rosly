using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Rosly.Dtos;
using Rosly.Models;

namespace Rosly.Repositories
{
    public class ScheduleRepository
    {
        private readonly RoslyDbEntities _db;

        public ScheduleRepository()
        {
            
        }

        public ScheduleRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public IEnumerable<Schedule> GetUpcomingCourses()
        {
            return _db.Schedule
                .Where(c => c.start_date >= DateTime.Now && c.is_canceled != true)
                .OrderBy(c => c.start_date)
                .Include(c => c.Location);
        }

        public IEnumerable<Schedule> GetCoursesByQuarter(Quarter quarter)
        {
            DateTime first;
            DateTime last;

            switch (quarter)
            {
                case Quarter.Q1:
                    first = new DateTime(DateTime.Now.Year, 1, 1);
                    last = new DateTime(DateTime.Now.Year, 3, 31);
                    break;
                case Quarter.Q1P:
                    first = new DateTime(DateTime.Now.Year - 1, 1, 1);
                    last = new DateTime(DateTime.Now.Year - 1, 3, 31);
                    break;
                case Quarter.Q2:
                    first = new DateTime(DateTime.Now.Year, 4, 1);
                    last = new DateTime(DateTime.Now.Year, 6, 30);
                    break;
                case Quarter.Q2P:
                    first = new DateTime(DateTime.Now.Year-1, 4, 1);
                    last = new DateTime(DateTime.Now.Year-1, 6, 30);
                    break;
                case Quarter.Q3:
                    first = new DateTime(DateTime.Now.Year, 7, 1);
                    last = new DateTime(DateTime.Now.Year, 9, 30);
                    break;
                case Quarter.Q3P:
                    first = new DateTime(DateTime.Now.Year - 1, 7, 1);
                    last = new DateTime(DateTime.Now.Year - 1, 9, 30);
                    break;
                case Quarter.Q4:
                    first = new DateTime(DateTime.Now.Year, 10, 1);
                    last = new DateTime(DateTime.Now.Year, 12, 31);
                    break;
                case Quarter.Q4P:
                    first = new DateTime(DateTime.Now.Year-1, 10, 1);
                    last = new DateTime(DateTime.Now.Year-1, 12, 31);
                    break;
                default:
                    return
                        _db.Schedule.Where(c => c.is_canceled != true)
                            .OrderBy(c => c.start_date)
                            .Include(c => c.Location);
            }
            return _db.Schedule
                .Where(c => c.start_date >= first && c.start_date <= last && c.is_canceled != true)
                .OrderBy(c => c.start_date)
                .Include(c => c.Location);
        }

        public Schedule Find(int? id)
        {
            return _db.Schedule.Find(id);
        }

        public IEnumerable<Schedule> GetUpcomingScheduleByCourse(Course course)
        {
            return course.Schedules.ToList();
        }

        public Schedule GetScheduledCourse(int id)
        {
            return _db.Schedule.Single(c => c.id == id);
        }

        public IEnumerable<Schedule> GetUpcomingScheduleSearch(CourseSearchDto dto)
        {
            var upcomingCourses = _db.Schedule
                .Where(c => c.start_date >= DateTime.Now && c.is_canceled != true)
                .OrderBy(c => c.start_date)
                .Include(c => c.Location);

            if (string.IsNullOrEmpty(dto.CourseName))
            {
                if (!string.IsNullOrEmpty(dto.Area))
                {
                    if (string.IsNullOrEmpty(dto.Email))
                        return upcomingCourses
                            .Where(c => c.Location.area == dto.Area);
                    else
                    {
                        return upcomingCourses.Where(c => c.Location.area == dto.Area
                                                                     &&
                                                                     c.Enrollments.Any(
                                                                         e => e.Employee.email.Contains(dto.Email)));

                    }
                       
                }
                else 
                    return upcomingCourses;
            }
            else if (string.IsNullOrEmpty(dto.Area))
            {
                return upcomingCourses
                    .Where(c => c.Course.course_name.Contains(dto.CourseName));
            }

            return upcomingCourses
                .Where(c => c.Course.course_name.Contains(dto.CourseName)
                            && c.Location.area == dto.Area);
        }
    }
}
