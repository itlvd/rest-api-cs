namespace APIServer.Controllers.Models
{

    public class BookTemplate
    {
        public string Title { get; set; }
        public string DatePublished { get; set; }
        public string Author { get; set; }
        public string Image { get; set; } // url

        public double Price { get; set; }
        public string[] Category { get; set; }
    }
    public class Book : BookTemplate
    {

        public int Id { get; set; }
        
    }
}
