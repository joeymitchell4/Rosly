using Rosly.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Rosly.Models;

namespace Rosly.Controllers.Api
{
    public class EmailController : ApiController
    {
        private RoslyDbEntities db;

        public EmailController()
        {
            db = new RoslyDbEntities();
        }

        [HttpGet]
        public IEnumerable<UserNotification> ResendFailedEmails()
        {
            var userNotifications = db.UserNotification
                .Where(un => un.is_email_sent == false);

            List<UserNotification> failedEmails = new List<UserNotification>();

            foreach (var notification in userNotifications)
            {
                Services.EmailService emailService = new Services.EmailService(notification);
                emailService.SendEmail();
                failedEmails.Add(notification);
            }

            return failedEmails;
        }

        [HttpGet]
        public IEnumerable<String> DeclinedEmployee()
        {
            Services.EmailService emailService = new Services.EmailService();

            var upcomingCourses = db.Schedule
                .Where(c => c.start_date > DateTime.Now)
                .OrderBy(c => c.start_date)
                .ToList();

            var emails = emailService.CheckAttendeeStatus(upcomingCourses);

            return emails;
        }
    }
}
