using APIServer.Controllers.Data;
using APIServer.Controllers.Helper;
using APIServer.Controllers.Models;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net;

namespace APIServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly BookDBContext _context;
        private readonly IMapper _mapper;

        public OrderController(BookDBContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var items = _context.Orders.Include(e => e.OrderDetail)
                .ThenInclude(e=> e.Book)
                .ToList();
            return Ok(items);
        }

        [HttpGet("{id}")]
        public ActionResult Get(int id)
        {

            try
            {
                var item = _context.Orders.Include(e => e.OrderDetail)
                    .ThenInclude(e => e.Book).SingleOrDefault(e => e.Id == id);

                if (item == null)
                {
                    return NotFound();
                }
                return Ok(item);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public ActionResult Post(OrderModel order)
        {
            var validAmount = false;
            try
            {
                var newOrder = _mapper.Map<Order>(order);

                _context.Orders.Add(newOrder);

                newOrder.OrderDetail.ForEach(e =>
                {
                    var book = _context.Books.SingleOrDefault(book => book.Id == e.BookId);

                    book.Amount -= e.Amount;

                    if(book.Amount >= 0)
                    {
                        validAmount = true;
                    }
                });

                if (validAmount == true)
                {
                    _context.SaveChanges();
                    return Ok(newOrder);
                }
                else
                {
                    return BadRequest("There are books which out of stock. Please check again!");
                }
            }
            catch (Exception ex){ 
                return NotFound(ex.Message);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var orderItem = _context.Orders.Include(e => e.OrderDetail)
                    .ThenInclude(e => e.Book).SingleOrDefault(e => e.Id == id);

                if (orderItem == null)
                {
                    return NotFound();
                }

                orderItem.OrderDetail.ForEach(e =>
                {
                    var book = _context.Books.SingleOrDefault(book => book.Id == e.BookId);

                    book.Amount += e.Amount;
                });

                _context.Orders.Remove(orderItem);
                _context.SaveChanges();
                return NoContent();
            }

            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }
    }
}
