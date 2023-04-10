﻿using APIServer.Controllers.Data;
using APIServer.Controllers.Models;
using AutoMapper;

namespace APIServer.Controllers.Helper
{
    public class AutoMapperBook :Profile
    {
        public AutoMapperBook()
        {
            CreateMap<Book, BookReturnModel>().ReverseMap();
            CreateMap<Book, BookModel>().ReverseMap();
            CreateMap<BookModel, BookReturnModel>().ReverseMap();
        }
    }
}
