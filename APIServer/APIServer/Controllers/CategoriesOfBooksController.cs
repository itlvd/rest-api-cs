using APIServer.Controllers.Data;
using APIServer.Controllers.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net;

namespace APIServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesOfBooksController : ControllerBase
    {
        private readonly BookDBContext _context;

        public CategoriesOfBooksController(BookDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_context.CategoriesOfBooks.ToList());
        }

        [HttpGet("getCategories/{BookId}")]
        public IActionResult GetCategoriesOfBookId(int BookId)
        {
            var categoriesId = _context.CategoriesOfBooks.Where(e => e.BookId == BookId).Select(e => e.CategoryId);
            return Ok(categoriesId.ToList());
        }

        [HttpGet("getBooks/{CategoryId}")]
        public IActionResult GetBooksOfCategoryId(int CategoryId)
        {
            var booksId = _context.CategoriesOfBooks.Where(e => e.CategoryId == CategoryId).Select(e => e.BookId);
            return Ok(booksId.ToList());
        }

        [HttpPost]
        public IActionResult AddNewCategoriesOfBook(CategoriesOfBookModel categoriesOfBook)
        {
            try
            {
                var categories = new CategoriesOfBook()
                {
                    CategoryId = categoriesOfBook.CategoryId,
                    BookId = categoriesOfBook.BookId,
                };
                _context.CategoriesOfBooks.Add(categories);
                _context.SaveChanges();
                return Ok(categories);
            }
            catch (Exception ex)
            {
                return BadRequest("Please make sure don't duplicate id of categories and id of book. " + ex.Message);
            }
        }

        [HttpGet("getCategoriesName/{bookId}")]
        public IActionResult GetCategoriesNameByBookId(int bookId)
        {
            var categoriesId = _context.CategoriesOfBooks.Where(e => e.BookId == bookId).Select(e => e.CategoryId);
            var name = _context.Categories.Where(e => categoriesId.Contains(e.CategoryId)).Select(e => e.CategoryName);
            return Ok(name);
        }

        [HttpGet("getBooksName/{categoryId}")]
        public IActionResult GetBooksNameByCategoryId(int categoryId)
        {
            var booksId = _context.CategoriesOfBooks.Where(e => e.CategoryId == categoryId).Select(e => e.BookId);
            var name = _context.Books.Where(e => booksId.Contains(e.Id)).Select(e => e.Title);
            return Ok(name);
        }

        private Book _GetBookById(int id)
        {
            var book = _context.Books.SingleOrDefault(e => e.Id == id);
            return book;
        }

        private Category _GetCategoryById(int id)
        {
            var category = _context.Categories.SingleOrDefault(e => e.CategoryId == id);
            return category;
        }
    }
}
