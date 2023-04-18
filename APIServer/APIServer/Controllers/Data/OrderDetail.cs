using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace APIServer.Controllers.Data
{
    [Table("OrderDetail")]
    public class OrderDetail
    {

        public int BookId { get; set; }
        public int OrderId { get; set; }
        public int Amount { get; set; }

        public Book Book { get; set; }
        [JsonIgnore]
        public Order Order { get; set; }
    }
}
