using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using Rosly.Dtos;
using Rosly.Models;

namespace Rosly.Services
{
    using Outlook = Microsoft.Office.Interop.Outlook;

    public class EmailService
    {
        private readonly UserNotification _userNotification;
        private readonly Notification _notification;
        private Schedule _course;

        public EmailService()
        {
        }

        public EmailService(UserNotification userNotification)
        {
            _userNotification = userNotification;
            _course = userNotification.Notification.Schedule;
        }

        public EmailService(Notification notification)
        {
            _notification = notification;
            _course = notification.Schedule;
        }

        public void SendEmail()
        {

            EmailDto dto = new EmailDto()
            {
                Email = _userNotification.Employee.email,
                Subject = CreateEmailSubject(_userNotification),
                Body = CreateEmailBody(_userNotification)
            };

            try
            {
                Outlook._Application _app = new Outlook.Application();
                Outlook.MailItem mail = (Outlook.MailItem)_app.CreateItem(Outlook.OlItemType.olMailItem);
                mail.To = dto.Email;
                mail.Subject = dto.Subject;
                mail.Body = dto.Body;
                mail.Importance = Outlook.OlImportance.olImportanceNormal;
                
                ((Outlook._MailItem)mail).Send();
                // set is_email_sent to true if email is sent
                _userNotification.is_email_sent = true;
                Console.WriteLine("Your email was sent successfully.");
            }
            catch (Exception e)
            {
                // set is_email_sent to true if email fails to send
                Console.WriteLine("Error sending email" + e.ToString());
                _userNotification.is_email_sent = false;
            }
        }

        private static string CreateEmailBody(UserNotification userNotification)
        {
            var course = userNotification.Notification.Schedule;
            var employee = userNotification.Employee;

            switch (userNotification.Notification.notification_type)
            {
                case NotificationType.CourseCancelled:
                {
                    var body = $"Hello {employee.fname}, \n\n" +
                               $"This is an email to notify you that the {course.Course.course_name} course that you are enrolled in at " +
                               $"{course.start_date} has been canceled. If you have any questions please email the instructor at " +
                               $"{course.Instructor.email}. \n\n" +
                               $"Thanks, \n\nRosly";
 
                    return body;
                }
                case NotificationType.CourseUpdated:
                {
                    var body = $"Hello, \n\n" +
                               $"This is an email to notify that the {course.Course.course_name} course that you are enrolled in at " +
                               $"{userNotification.Notification.original_date_time} in {userNotification.Notification.original_location} has " +
                               $"changed. \n\n" +
                               $"The course info is now:\n" +
                               $"Start time: {course.start_date}\n" +
                               $"Location: {course.area}\n" +
                               $"Instructor: {course.Instructor.fname} {course.Instructor.lname} {course.Instructor.email} \n\n" +
                               $"Thanks, \n\nRosly";

                    return body;
                }
                case NotificationType.EmployeeEnrolled:
                {
                    var body = $"Hello, \n\n" +
                               $"This is an email to notify that you have successfully enrolled in {course.Course.course_name} at {course.area}" +
                               $"Please accept this calendar invitation to let us know you will be attending the course. \n\n" +
                               $"Thanks, \n\nRosly";

                    return body;
                }
            }

            return $"body";
        }

        private static string CreateEmailSubject(UserNotification userNotification)
        {
            switch (userNotification.Notification.notification_type)
            {
                case NotificationType.CourseCancelled:
                    return $"{userNotification.Notification.Schedule.Course.course_name} has been canceled";
                case NotificationType.CourseUpdated:
                    return $"{userNotification.Notification.Schedule.Course.course_name} Update";
                default:
                    return "need to add subject";
            }
        }

        public void SendInvite()
        {
            Outlook.AppointmentItem appointment = GetExistingAppointment();
            Outlook.Recipients recipients = null;
            Outlook.Recipient recipient = null;

            try
            {
                Outlook._Application _app = new Outlook.Application();
                if (appointment == null)
                    appointment = (Outlook.AppointmentItem)_app.CreateItem(Outlook.OlItemType.olAppointmentItem);
                appointment.Subject = $"{_course.Course.course_name} {_course.id}";
                appointment.Body = CreateEmailBody(_userNotification);
                appointment.Start = _course.start_date;
                appointment.Duration = 60;
                appointment.MeetingStatus = Outlook.OlMeetingStatus.olMeeting;
                appointment.Location = _course.Location.area;
                recipients = appointment.Recipients;
                recipient = recipients.Add(_userNotification.Employee.email);
                recipient.Type = (int)Outlook.OlMeetingRecipientType.olRequired;

                if (recipient.Resolve())
                    appointment.Send();
            }
            finally
            {
                if (recipient != null) Marshal.ReleaseComObject(recipient);
                if (recipients != null) Marshal.ReleaseComObject(recipients);
                if (appointment != null) Marshal.ReleaseComObject(appointment);
            }

            //var smtpClient = new SmtpClient
            //{
            //    Host = "smtp.gmail.com",
            //    Port = 587,
            //    EnableSsl = true,
            //    //Timeout = 10000,
            //    Credentials = new NetworkCredential("dawuah3@gmail.com", "s0ccerr0cks"),
            //    //DeliveryMethod = SmtpDeliveryMethod.Network
            //};
            ////smtpClient.Host = "smtp.aol.com:465:1";
            //MailMessage mail = new MailMessage();
            
            ////Setting From , To and CC
            //mail.Headers.Add("Content-class", "urn:content-classes:calendarmessage");
            //mail.From = new MailAddress("dawuah3@gmail.com");
            //mail.Body = "Hello this is a test for smtp";
            //mail.To.Add(new MailAddress($"{_userNotification.Employee.email}"));
            //var str = CreateAppointment(mail);
            //Attachment attachment = Attachment.CreateAttachmentFromString(str, new ContentType("text/calendar"));
            //attachment.TransferEncoding = TransferEncoding.Base64;
            //attachment.Name = $"{_course.Course.course_name}.ics";
            
            //mail.Attachments.Add(attachment);

            //smtpClient.Send(mail);
        }

        //private string CreateAppointment(MailMessage msg)
        //{
        //    StringBuilder str = new StringBuilder();
        //    str.AppendLine("BEGIN:VCALENDAR");
        //    str.AppendLine("PRODID:-//Schedule a Meeting");
        //    str.AppendLine("VERSION:2.0");
        //    str.AppendLine("METHOD:REQUEST");
        //    str.AppendLine("BEGIN:VEVENT");
        //    str.AppendLine(string.Format("DTSTART:{0:yyyyMMddTHHmmssZ}", DateTime.Now.AddMinutes(+330)));
        //    str.AppendLine(string.Format("DTSTAMP:{0:yyyyMMddTHHmmssZ}", DateTime.UtcNow));
        //    str.AppendLine(string.Format("DTEND:{0:yyyyMMddTHHmmssZ}", DateTime.Now.AddMinutes(+660)));
        //    str.AppendLine("LOCATION: " + _course.Location.area);
        //    str.AppendLine(string.Format("UID:{0}", $"{_course.Course.course_name}"));
        //    str.AppendLine(string.Format("DESCRIPTION:{0}", msg.Body));
        //    str.AppendLine(string.Format("X-ALT-DESC;FMTTYPE=text/html:{0}", msg.Body));
        //    str.AppendLine(string.Format("SUMMARY:{0}", msg.Subject));
        //    str.AppendLine(string.Format("ORGANIZER:MAILTO:{0}", msg.From.Address));

        //    str.AppendLine(string.Format("ATTENDEE;CN=\"{0}\";RSVP=TRUE:mailto:{1}", msg.To[0].DisplayName, msg.To[0].Address));

        //    str.AppendLine("BEGIN:VALARM");
        //    str.AppendLine("TRIGGER:-PT15M");
        //    str.AppendLine("ACTION:DISPLAY");
        //    str.AppendLine("DESCRIPTION:Reminder");
        //    str.AppendLine("END:VALARM");
        //    str.AppendLine("END:VEVENT");
        //    str.AppendLine("END:VCALENDAR");

        //    return str.ToString();
        //}

        private Outlook.AppointmentItem GetExistingAppointment()
        {

            try
            {
                Outlook._Application _app = new Outlook.Application();
                var appointment = (Outlook.AppointmentItem)_app.
                        Session.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderCalendar).
                        Items.Find($"[Subject]='{_course.Course.course_name} {_course.id}'");

                return appointment;   
            }
            catch
            {
                // return null if appointment does not exist
                return null;
            }
        }

        //private void SendAppointment()
        //{
        //    iCalendar iCal = new iCalendar();
        //}
        private bool CheckIfAppointmentExists()
        {
            return false;
        }

        public void AlterMeeting(Notification notification)
        {
            Outlook.AppointmentItem appointment = GetExistingAppointment();
            Outlook.Recipients recipients = null;
            //Outlook.Recipient recipient = null;

            try
            {
                Outlook._Application _app = new Outlook.Application();
                if (appointment == null)
                    appointment = (Outlook.AppointmentItem)_app.CreateItem(Outlook.OlItemType.olAppointmentItem);
                appointment.Subject = $"{_course.Course.course_name} {_course.id}";
                //appointment.Body = CreateEmailBody(_userNotification);
                appointment.Start = _course.start_date;
                appointment.Duration = 60;
                appointment.MeetingStatus = Outlook.OlMeetingStatus.olMeeting;
                appointment.Location = notification.Schedule.area;
                recipients = appointment.Recipients;
                //recipient.Type = (int)Outlook.OlMeetingRecipientType.olRequired;
                //if (recipient.Resolve())
                appointment.Save();
            }
            finally
            {
                //if (recipient != null) Marshal.ReleaseComObject(recipient);
                if (recipients != null) Marshal.ReleaseComObject(recipients);
                if (appointment != null) Marshal.ReleaseComObject(appointment);
            }

        }

        public void CancelCourse()
        {
            Outlook.AppointmentItem appointment = GetExistingAppointment();
            Outlook.Recipients recipients = null;

            try
            {
                Outlook._Application _app = new Outlook.Application();
                if (appointment == null)
                    appointment = (Outlook.AppointmentItem) _app.CreateItem(Outlook.OlItemType.olAppointmentItem);

                appointment.MeetingStatus = Outlook.OlMeetingStatus.olMeetingCanceled;
                appointment.Body = $"{_course.course_id} {_course.id}has been canceled";
                appointment.Save();
                appointment.Send();
                //var del = appointment.ForceUpdateToAllAttendees;
                //if (del == true)
                //    appointment.Send();
            }
            catch
            {
                //_notification.edit_successful = false;
            }
        }

        public IEnumerable<String> CheckAttendeeStatus(IEnumerable<Schedule> upcomingCourses)
        {
            var declinedEmails = new List<string>();

            foreach (var course in upcomingCourses)
            {
                _course = course;
                Outlook.AppointmentItem appointment = GetExistingAppointment();
                if (appointment == null || appointment.MeetingStatus == Outlook.OlMeetingStatus.olMeetingCanceled)
                    continue;
                foreach (Outlook.Recipient recipient in appointment.Recipients)
                {
                    switch (recipient.MeetingResponseStatus)
                    {
                        case Outlook.OlResponseStatus.olResponseDeclined:
                            var email = recipient.Address;
                            Debug.WriteLine("Declined: " + recipient.Name);
                            declinedEmails.Add(email);
                            declinedEmails.Add(appointment.Subject);
                            break;
                        case Outlook.OlResponseStatus.olResponseNone:
                            break;
                        case Outlook.OlResponseStatus.olResponseOrganized:
                            break;
                        case Outlook.OlResponseStatus.olResponseTentative:
                            break;
                        case Outlook.OlResponseStatus.olResponseAccepted:
                            break;
                        case Outlook.OlResponseStatus.olResponseNotResponded:
                            break;
                        default:
                            throw new ArgumentOutOfRangeException();
                    }
                }
            }

            return declinedEmails;
        }
    }
}