using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Rosly.ViewModels;

namespace Rosly.Models
{
    public class IsShort : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var employee = (EmployeeFormViewModel) validationContext.ObjectInstance;

            short cost;
            if (!short.TryParse(employee.CostCent, out cost))
                return new ValidationResult("Invalid Cost Center");

            return ValidationResult.Success;
        }
    }
}