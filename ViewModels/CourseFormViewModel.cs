using Newtonsoft.Json;
using Rosly.Controllers;
using Rosly.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Web.Mvc;

namespace Rosly.ViewModels
{
    public class CourseFormViewModel
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(64)]
        public string CourseId { get; set; }

        //[Required]
        //public int Course { get; set; }

        ////public Course Course { get; set; }
        //public IEnumerable<Course> Courses { get; set; }

        [Required]
        public string Description { get; set; }

        public string Action
        {
            get
            {
                Expression<Func<CoursesController, ActionResult>> update =
                    (c => c.Update(this));

                Expression<Func<CoursesController, ActionResult>> create =
                    (c => c.Create(this));

                var action = (Id != 0) ? update : create;

                return (action.Body as MethodCallExpression).Method.Name;
            }
        }
    }
}