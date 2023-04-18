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
            try
            {
                var newOrder = _mapper.Map<Order>(order);

                _context.Orders.Add(newOrder);
                _context.SaveChanges();
                return Ok(newOrder);
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
                var orderItem = _context.Orders.SingleOrDefault(e => e.Id == id);

                if (orderItem == null)
                {
                    return NotFound();
                }
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
