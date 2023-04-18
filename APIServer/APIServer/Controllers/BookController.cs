using APIServer.Controllers.Data;
using APIServer.Controllers.Models;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace APIServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly BookDBContext _context;
        private readonly IMapper _mapper;

        public BookController(BookDBContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        [HttpGet] public IActionResult GetBook()
        {

            try
            {
                var books = _context.Books.ToList();
                //var bookReturn = _mapper.Map<List<BookReturnModel>>(books);

                return Ok(books);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        [HttpGet("{id}")] public IActionResult GetBook(int id)
        {
            try
            {
                var book = _context.Books.SingleOrDefault(x => x.Id == id);
                if(book == null)
                {
                    return NotFound();
                }
                // var bookReturn = _mapper.Map<BookReturnModel>(book);
                // var categoryOfBook = _context.CategoriesOfBooks.ToList();
                // var listCategoryOfBook =    from c in categoryOfBook
                //                             where c.BookId == id
                //                             select c.Category.CategoryName;
                // bookReturn.Category = listCategoryOfBook.ToArray();
                return Ok(book);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost] public IActionResult Create(BookModel newbook)
        {
            
            //Create a new book
            var book = new Book()
            {
                Title = newbook.Title,
                Author = newbook.Author,
                DatePublished = newbook.DatePublished,
                Price = newbook.Price,
                Image = base64ToImgurURL(newbook.Image).Result,
                Amount = newbook.Amount

            };
            _context.Books.Add(book);
            _context.SaveChanges();

            //Add Categories to database
            /*if (newbook.Category[0].GetType() != typeof(int))
            {
                return ValidationProblem("Categories must be an ID.");
            }

            foreach (var categoryId in newbook.Category)
            {
                var lastShowPieceId = _context.Books.Max(x => x.Id);
                var bookId = _context.Books.FirstOrDefault(x => x.Id == lastShowPieceId)!.Id;
                var categoryNew = new CategoriesOfBook()
                {
                    BookId = bookId,
                    CategoryId = categoryId,
                    
                };

                _context.CategoriesOfBooks.Add(categoryNew);
                _context.SaveChanges();

            }*/
            


            return Ok(new {
                Success = true, Data = book
            });
        }


        [HttpPut] public IActionResult UpdateBook(int id, BookModel bookEdit)
        {
            try
            {
                var book = _context.Books.SingleOrDefault(book => book.Id == id);
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
                book.Image = bookEdit.Image.Contains("http") ? bookEdit.Image : base64ToImgurURL(bookEdit.Image).Result;
                _context.SaveChanges();
            return Ok(book);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            

        }


        [HttpDelete("{id}")] public IActionResult DeleteBook(int id)
        {
            try
            {
                var book = _context.Books.SingleOrDefault(x => x.Id == id);

                if (book == null)
                {
                    return NotFound();
                }

                if (book.Id != id)
                {
                    return NotFound();
                }

                _context.Books.Remove(book);
                _context.SaveChanges();
                return Ok();
            }
            catch { return BadRequest(); } 
        }

        public static async Task<String> base64ToImgurURL(string base64)
        {
            var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Client-ID", "3dc706475ba11db");
            httpClient.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "text/plain");
            var response = await httpClient.PostAsync("https://api.imgur.com/3/image", new StringContent(base64));
            var stringcontent = await response.Content.ReadAsStringAsync();
            var ImgurResponseModel = JsonConvert.DeserializeObject<ImgurRespondModel>(stringcontent);
            return ImgurResponseModel.data.link;
        }
    }
}
