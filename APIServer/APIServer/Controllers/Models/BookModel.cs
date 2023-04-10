namespace APIServer.Controllers.Models
{

    public class BookModel
    {
        public string Title { get; set; }
        public string DatePublished { get; set; }
        public string Author { get; set; }
        public string Image { get; set; } // base64

        public double Price { get; set; }
        //public int[] Category { get; set; }
    }

    public class BookReturnModel : BookModel
    {
        public int Id { get; set; }
        //public new string[] Category { get; set; }
    }
  
}
