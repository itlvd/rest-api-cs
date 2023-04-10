using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace APIServer.Controllers.Data
{

    public class CategoriesOfBook
    {
        public int CategoryId { get; set; }
        public int BookId { get; set; }


        //relationship
        public Book Book { get; set; }
        public Category Category { get; set; }
    }
}
