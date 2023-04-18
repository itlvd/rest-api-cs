using APIServer.Controllers.Data;

namespace APIServer.Controllers.Models
{
    public class OrderModel
    {
        public string CustomerName { get; set; }
        public string dateCreated { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }

        public double Total { get; set; }

        public List<OrderDetailModel> OrderDetail { get; set; }
    }
}
