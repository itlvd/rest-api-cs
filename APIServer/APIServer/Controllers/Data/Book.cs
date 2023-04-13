using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace APIServer.Controllers.Data
{
    [Table("Book")]
    public class Book
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string Title { get; set; }

        public string DatePublished { get; set; }

        public string Author { get; set; }

        public string Image { get; set; } // url

        [Range(0,double.MaxValue)]
        public double Price { get; set; }

        public int Amount { get; set; }

        // public int? CategoryID { get; set; }
        // [ForeignKey("CategoryID")]
        // public Category Category { get; set; }

        public ICollection<CategoriesOfBook> CategoriesOfBooks { get; set; }

        public Book()
        {
            CategoriesOfBooks = new List<CategoriesOfBook>();
        }
    }
}
