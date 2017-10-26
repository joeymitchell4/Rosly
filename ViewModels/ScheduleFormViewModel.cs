using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Web.Mvc;
using Rosly.Controllers;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class ScheduleFormViewModel
    {
        public int Id { get; set; }

        //[Required]
        //[MaxLength(10)]
        //public string CourseId { get; set; }

        [Required]
        public int Course { get; set; }

        //public Course Course { get; set; }
        public IEnumerable<Course> Courses { get; set; }

        [Required]
        public string StartDate { get; set; }

        [Required]
        public string StartTime { get; set; }

        public string EndDate { get; set; }

        [Required]
        public string Area { get; set; }

        public IEnumerable<Location> Areas { get; set; }

        [Required]
        public int MaxCapacity { get; set; }

        [Required]
        public string Instructor { get; set; }

        public IEnumerable<Instructor> Instructors { get; set; }

        public string Action
        {
            get
            {
                Expression<Func<ScheduleController, ActionResult>> update =
                    (c => c.Update(this));

                Expression<Func<ScheduleController, ActionResult>> create =
                    (c => c.Create(this));

                var action = (Id != 0) ? update : create;

                return (action.Body as MethodCallExpression).Method.Name;
            }
        }

        public DateTime GetDateTime()
        {
            return DateTime.Parse(string.Format("{0} {1}", StartDate, StartTime));
        }
    }
}