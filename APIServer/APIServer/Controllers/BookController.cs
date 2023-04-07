using APIServer.Controllers.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace APIServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        public static List<Book> books = new List<Book>() {
        new Book
        {
            Id = 1,
            Title = "Tôi thấy hoa vàng trên cỏ xanh",
            Author = "Nguyễn Nhật Ánh",
            DatePublished = "12/07/2022",
            Price = 23000,
            Category = new string[] {"tiểu thuyết", "truyện thiếu nhi" },
            Image = "https://image.com",
        }, 

        new Book
        {
            Id = 2,
            Title = "Hai số phận",
            Author = "Feffer",
            DatePublished = "21/01/2023",
            Price = 23000,
            Category = new string[] {"tiểu thuyết", "truyện nước ngoài" },
            Image = "https://image.com",
        }
        };

        [HttpGet] public IActionResult GetBook()
        {
            return Ok(books);
        }

        [HttpGet("{id}")] public IActionResult GetBook(int id)
        {
            try
            {
                var book = books.SingleOrDefault(x => x.Id == id);
                if(book == null)
                {
                    return NotFound();
                }
                return Ok(book);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost] public IActionResult Create(BookTemplate newbook)
        {
            var book = new Book()
            {
                Id = 1,
                Title = newbook.Title,
                Author = newbook.Author,
                DatePublished = newbook.DatePublished,
                Price = newbook.Price,
                Category = newbook.Category,
                Image = newbook.Image,
            };
            books.Add(book);
            return Ok(new {
                Success = true, Data = book
            });
        }


        [HttpPut] public IActionResult updateBook(int id, BookTemplate bookEdit)
        {
            try
            {
                var book = books.SingleOrDefault(book => book.Id == id);
                if (book == null)
                {
                    return NotFound();
                }

                if (book.Id != id)
                {
                    return NotFound();
                }

                book.Title = bookEdit.Title;
                book.Author = bookEdit.Author;
                book.DatePublished = bookEdit.DatePublished;
                book.Price = bookEdit.Price;
                book.Category = bookEdit.Category;
                book.Image = bookEdit.Image;
                return Ok(book);
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
            

        }


        [HttpDelete("{id}")] public IActionResult deleteBook(int id)
        {
            try
            {
                var book = books.SingleOrDefault(x => x.Id == id);

                if (book == null)
                {
                    return NotFound();
                }

                if (book.Id != id)
                {
                    return NotFound();
                }

                books.Remove(book);
                return Ok();
            }
            catch { return BadRequest(); } 
        }
    }
}
