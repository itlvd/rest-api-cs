﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace APIServer.Controllers.Data
{
    [Table("Category")]
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required]
        public string CategoryName { get; set; } = string.Empty;

        public ICollection<CategoriesOfBook> CategoriesOfBooks { get; set; }
        public Category()
        {
            CategoriesOfBooks = new List<CategoriesOfBook>();
        }
    }
}
