using System.ComponentModel.DataAnnotations;

namespace APIServer.Controllers.Models
{
    public class CategoryModel
    {
        [Required]
        [MaxLength(100)]
        public string CategoryName { get; set; }
    }
}
