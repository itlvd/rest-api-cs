using APIServer.Controllers.Data;
using APIServer.Controllers.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace APIServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly BookDBContext _context;

        public CategoryController(BookDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            var Categories = _context.Categories.ToList();
            return Ok(Categories);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var Category = _context.Categories.SingleOrDefault(x => x.CategoryId == id);

            if (Category == null)
            {
                return NotFound();
            }
            return Ok(Category);
        }

        


        [HttpPost]
        public IActionResult addNewCategory(CategoryModel category)
        {
            try
            {
                var newCategory = new Category()
                {
                    CategoryName = category.CategoryName
                };
                _context.Categories.Add(newCategory);
                _context.SaveChanges();
                return Ok(newCategory);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPut("{id}")]
        public IActionResult updateCategory(int id, CategoryModel categoryModel)
        {
            var Category = _context.Categories.SingleOrDefault(x => x.CategoryId == id);

            if (Category == null)
            {
                return NotFound();
            }
            Category.CategoryName = categoryModel.CategoryName;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
