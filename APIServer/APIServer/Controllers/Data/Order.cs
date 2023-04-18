using System.Text.Json.Serialization;

namespace APIServer.Controllers.Data
{
    public class Order
    {


        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string dateCreated { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        
        public double Total { get; set; }

        public List<OrderDetail> OrderDetail { get; set; }


    }
}
