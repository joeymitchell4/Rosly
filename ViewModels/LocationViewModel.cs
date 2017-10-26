using System.ComponentModel.DataAnnotations;

namespace Rosly.ViewModels
{
    public class LocationViewModel
    {
        [Required]
        [MaxLength(15)]
        public string Area { get; set; }
    }
}