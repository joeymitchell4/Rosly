using Rosly.Dtos;
using Rosly.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using AutoMapper;

namespace Rosly.Controllers.Api
{
    public class EnrollmentController : ApiController
    {
        private RoslyDbEntities db;

        public EnrollmentController()
        {
            db = new RoslyDbEntities();
        }

        [HttpPost]
        public IHttpActionResult Enroll(EnrollmentDto dto)
        {
            if (db.Enrollment.Any(e => e.employee_id == dto.employee_id && e.schedule_id == dto.schedule_id))
            {
                return BadRequest("This user is already enrolled in the course");
            }

            if (!db.Employee.Any(e => e.id == dto.employee_id))
            {
                // If this employee does not exist return conflict and have user create employee
                return Conflict();
            }

            var enrollment = new Enrollment
            {
                employee_id = dto.employee_id,
                schedule_id = dto.schedule_id,
                timestamp = DateTime.Now
            };

            db.Enrollment.Add(enrollment);
            db.SaveChanges();

            return Ok();
        }

        public IHttpActionResult Unenroll(int empId, int courseId)
        {
            var enrollment = db.Enrollment.Single(e => e.employee_id == empId && e.schedule_id == courseId);
            var course = db.Schedule.SingleOrDefault(s => s.id == courseId);
            if (enrollment == null || course == null)
            {
                return BadRequest("This user is not enrolled in the course");
            }

            var numEnrolled = course.Enrollments.Where(e => e.on_waitlist != true).ToList();
            if (numEnrolled.Count() >= course.max_capacity && numEnrolled.Count() - 1 < course.max_capacity)
            {
                var waitlisted = course
                    .Enrollments
                    .Where(e => e.on_waitlist == true)
                    .OrderBy(e => e.id)
                    .ToList();

                var emp = waitlisted[0];
                if (emp != null)
                {
                    emp.on_waitlist = false;
                    var employee = emp.Employee;
                    var notification = Notification.SpotAvailable(course);

                    employee.Notify(notification, true);
                }
            }
            db.Enrollment.Remove(enrollment);
            db.SaveChanges();

            return Ok();
        }

        [HttpPost]
        public IEnumerable<EnrollmentDto> GetEnrollments(EnrollmentDashboardDto dto)
        {
            var enrollments = FindEnrollments(dto);

            return enrollments.Select(Mapper.Map<Enrollment, EnrollmentDto>);
        }

        private IEnumerable<Enrollment> FindEnrollments(EnrollmentDashboardDto dto)
        {
            if (dto.Area == "" && dto.CourseName == "")
                return db.Enrollment.ToList();

            if (dto.Area != "" && dto.CourseName == "")
                return db.Enrollment
                    .Where(s => s.Schedule.area.Contains(dto.Area))
                    .ToList();

            if (dto.Area != "" && dto.CourseName != "")
                return db.Enrollment
                    .Where(s => s.Schedule.area.Contains(dto.Area)
                                && s.Schedule.Course.course_name == dto.CourseName)
                    .ToList();
            return db.Enrollment
                .Where(s => s.Schedule.Course.course_name == dto.CourseName)
                .ToList();
        }
    }
}
