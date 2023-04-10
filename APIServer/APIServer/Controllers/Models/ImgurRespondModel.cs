namespace APIServer.Controllers.Models
{
    class ImgurRespondModel
    {
        public Data data { get; set; }
        public bool success { get; set; }
        public int status { get; set; }
    }

    class Data
    {
        public string id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public long datetime { get; set; }
        public string type { get; set; }
        public bool animated { get; set; }
        public double width { get; set; }
        public double height { get; set; }
        public double size { get; set; }
        public double view { get; set; }
        public double bandwidth { get; set; }
        public string vote { get; set; }
        public bool favorite { get; set; }
        public string nsfw { get; set; }
        public string section { get; set; }
        public string account_url { get; set; }
        public string account_id { get; set; }
        public bool is_ad { get; set; }
        public bool in_most_viral { get; set; }
        public string[] tags { get; set; }
        public int ad_type { get; set; }
        public string ad_url { get; set; }
        public bool in_gallery { get; set; }
        public string deletehash { get; set; }
        public string name { get; set; }
        public string link { get; set; }

    }
}
