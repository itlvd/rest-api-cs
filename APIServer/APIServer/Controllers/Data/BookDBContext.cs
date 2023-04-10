using Microsoft.EntityFrameworkCore;

namespace APIServer.Controllers.Data
{
    public class BookDBContext :DbContext
    {
        public BookDBContext(DbContextOptions options) : base(options) { }


        #region DbSet
        public DbSet<Book> Books { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<CategoriesOfBook> CategoriesOfBooks { get; set; } 
        #endregion

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CategoriesOfBook>(e =>
            {
                e.ToTable("CategoryOfBook");
                e.HasKey(e =>
                new {
                    e.BookId, e.CategoryId
                });
                e.Property(e => e.BookId).IsRequired();
                e.Property(e => e.CategoryId).IsRequired();

                e.HasOne(e => e.Category)
                    .WithMany(e => e.CategoriesOfBooks)
                    .HasForeignKey(e => e.CategoryId)
                    .HasConstraintName("FK_CategoriesOfBooks_Category");

                e.HasOne(e => e.Book)
                    .WithMany(e => e.CategoriesOfBooks)
                    .HasForeignKey(e => e.BookId)
                    .HasConstraintName("FK_CategoriesOfBooks_Book");

            });
        }
    }
}
