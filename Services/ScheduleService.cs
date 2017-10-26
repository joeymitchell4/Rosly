using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rosly.Models;

namespace Rosly.Services
{
    public class ScheduleService
    {
        private readonly Schedule _schedule;
        private readonly RoslyDbEntities _db;

        public ScheduleService()
        {
        }

        public ScheduleService(Schedule schedule, RoslyDbEntities db)
        {
            _schedule = schedule;
            _db = db;
        }

        public void Enroll(Employee employee)
        {
            if (_schedule.is_canceled == true)
                return;

            var enrollment = new Enrollment()
            {
                Employee = employee,
                Schedule = _schedule,
                timestamp = DateTime.Now
            };

            var service = new EmployeeService(employee, _db);
            if (_schedule.Enrollments.Count() >= _schedule.max_capacity)
            {
                enrollment.on_waitlist = true;
                var notification = Notification.EmployeeWaitlisted(_schedule);
                service.Notify(notification, true);
            }
            else
            {
                var notification = Notification.EmployeeEnrolled(_schedule);
                //employee.SendInvite(notification, _schedule, true);
                service.Notify(notification, true);
            }

            _schedule.Enrollments.Add(enrollment);
        }

        public void Modify(DateTime dateTime, string area, Instructor instructor, int MaxCapacity)
        {
            if (_schedule.is_canceled == true)
                return;

            var notification = Notification.CourseUpdated(_schedule, _schedule.start_date, area);

            _schedule.start_date = dateTime;
            _schedule.area = area;
            _schedule.Instructor = instructor;
            _schedule.max_capacity = MaxCapacity;

            foreach (var employee in _schedule.Enrollments.Select(e => e.Employee))
            {
                employee.Notify(notification, true);
            }
        }

        public void Cancel()
        {
            _schedule.is_canceled = true;

            var notification = Notification.CourseCanceled(_schedule);

            EmailService emailService = new EmailService(notification);
            emailService.CancelCourse();
            foreach (var employee in _schedule.Enrollments.Select(e => e.Employee))
            {
                employee.Notify(notification, true);

                //SendNotification(employee.email);
            }
        }
    }
}