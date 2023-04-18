﻿// <auto-generated />
using APIServer.Controllers.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace APIServer.Migrations
{
    [DbContext(typeof(BookDBContext))]
    [Migration("20230418031449_updateDatabase")]
    partial class updateDatabase
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("APIServer.Controllers.Data.Book", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("Amount")
                        .HasColumnType("int");

                    b.Property<string>("Author")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("DatePublished")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Image")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<double>("Price")
                        .HasColumnType("float");

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.HasKey("Id");

                    b.ToTable("Book");
                });

            modelBuilder.Entity("APIServer.Controllers.Data.CategoriesOfBook", b =>
                {
                    b.Property<int>("BookId")
                        .HasColumnType("int");

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.HasKey("BookId", "CategoryId");

                    b.HasIndex("CategoryId");

                    b.ToTable("CategoryOfBook", (string)null);
                });

            modelBuilder.Entity("APIServer.Controllers.Data.Category", b =>
                {
                    b.Property<int>("CategoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CategoryId"));

                    b.Property<string>("CategoryName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CategoryId");

                    b.ToTable("Category");
                });

            modelBuilder.Entity("APIServer.Controllers.Data.CategoriesOfBook", b =>
                {
                    b.HasOne("APIServer.Controllers.Data.Book", "Book")
                        .WithMany("CategoriesOfBooks")
                        .HasForeignKey("BookId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK_CategoriesOfBooks_Book");

                    b.HasOne("APIServer.Controllers.Data.Category", "Category")
                        .WithMany("CategoriesOfBooks")
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK_CategoriesOfBooks_Category");

                    b.Navigation("Book");

                    b.Navigation("Category");
                });

            modelBuilder.Entity("APIServer.Controllers.Data.Book", b =>
                {
                    b.Navigation("CategoriesOfBooks");
                });

            modelBuilder.Entity("APIServer.Controllers.Data.Category", b =>
                {
                    b.Navigation("CategoriesOfBooks");
                });
#pragma warning restore 612, 618
        }
    }
}
