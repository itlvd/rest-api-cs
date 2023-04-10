using APIServer.Controllers.Data;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;
using System.Text.Json;

namespace APIServer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            builder.Services.AddDbContext<BookDBContext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("BookDB"));
            });
            builder.Services.AddAutoMapper(typeof(Program));

            

            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI(
                    option =>
                    {
                        option.SwaggerEndpoint("/swagger/v1/swagger.json", "Book Shop V1");
                        option.RoutePrefix = string.Empty;
                    });
            }
            else
            {
                app.UseSwagger();
                app.UseSwaggerUI(
                    option =>
                    {
                        option.SwaggerEndpoint("/swagger/v1/swagger.json", "Book Shop V1");
                        option.RoutePrefix = string.Empty;
                    });
            }
            

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}