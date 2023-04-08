using Microsoft.EntityFrameworkCore;

namespace APIServer.Controllers.Data
{
    public class BookDBContext :DbContext
    {
        public BookDBContext(DbContextOptions options) : base(options) { }


        #region DbSet
        public DbSet<Book> Books { get; set; }
        public DbSet<Category> Categories { get; set; }


        #endregion
    }
}
