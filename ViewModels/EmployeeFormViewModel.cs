using Rosly.Controllers;
using Rosly.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Web.Mvc;

namespace Rosly.ViewModels
{
    public class EmployeeFormViewModel
    {
        public int Id { get; set; }

        public int CourseId { get; set; }

        public string Heading { get; set; }
        
        [Required]
        [MaxLength(32)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(32)]
        public string LastName { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string BusUnit { get; set; }

        public IEnumerable<BusUnit> BusUnits { get; set; }

        [Required]
        [IsShort]
        public string CostCent { get; set; }

        [Required]
        public string CubeLocation { get; set; }

        [Required]
        public string Area { get; set; }

        public IEnumerable<Location> Areas { get; set; }

        public string EmployeeId { get; set; }

        public int NewEmployeeFlag { get; set; }

        public string Action
        {
            get
            {
                Expression<Func<EmployeesController, ActionResult>> update =
                    (c => c.Update(this));

                Expression<Func<EmployeesController, ActionResult>> create =
                    (c => c.Create(this));

                Expression<Func<EmployeesController, ActionResult>> enroll 
                    = (c => c.Enroll(this));

                Expression<Func<EmployeesController, ActionResult>> enrollCreate 
                    = (c => c.EnrollAndCreate(this));

                if (CourseId != 0)
                {
                    var act = (NewEmployeeFlag == 1) ? enrollCreate : enroll;

                    return (act.Body as MethodCallExpression).Method.Name;
                }

                var action = (Id != 0) ? update : create;

                return (action.Body as MethodCallExpression).Method.Name;
            }
        }

        public short GetCostCent()
        {
            return short.Parse(CostCent);
        }
    }
}