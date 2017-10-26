using System.ComponentModel.DataAnnotations;

namespace Rosly.ViewModels
{
    public class BusUnitViewModel
    {
        [Required]
        [MaxLength(10)]
        public string Name { get; set; }
    }
}