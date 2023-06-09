/****** Object:  Database [ShopBook_db]    Script Date: 4/28/2023 3:02:22 PM ******/
CREATE DATABASE [ShopBook_db]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [ShopBook_db] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [ShopBook_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBook_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBook_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBook_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBook_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBook_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBook_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBook_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBook_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBook_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBook_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBook_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBook_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBook_db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [ShopBook_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBook_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ShopBook_db] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBook_db] SET ENCRYPTION ON
GO
ALTER DATABASE [ShopBook_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopBook_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/28/2023 3:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 4/28/2023 3:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DatePublished] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/28/2023 3:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryOfBook]    Script Date: 4/28/2023 3:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryOfBook](
	[CategoryId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryOfBook] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[CategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/28/2023 3:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[BookId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[BookId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/28/2023 3:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[dateCreated] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230408023848_DbInit', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230408025448_addTableCategory', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230409152028_AddCategoriesOfBooks', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230410034549_AddRequirement', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230413151629_AddAmountOfBooks', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230418031449_updateDatabase', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230418040040_addOrder', N'7.0.4')
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (67, N'Bệnh dạ dày và các cách điều trị', N'2002', N'Hoàng Thúy', N'https://i.imgur.com/SMn4p9d.png', 72000, 7)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (68, N'Trước vòng bán kết', N'2022', N'Nguyễn Nhật Ánh', N'https://i.imgur.com/0Un2iAP.png', 90000, 6)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (70, N'Sổ tay đảng viên', N'1999', N'NXB Chính trị quốc gia Sự thật', N'https://i.imgur.com/VfRkYOZ.png', 85000, 2)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (71, N'Đi chơi bờ hồ', N'2000', N'Đỗ Phấn', N'https://i.imgur.com/58NZGZG.png', 64000, 6)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (72, N'Dốc hết trái tim', N'2005', N'Howard Schultz', N'https://i.imgur.com/5hezvKn.png', 50000, 5)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (73, N'Song mỹ lương duyên', N'2007', N'Nguyễn Xuân (dịch)', N'https://i.imgur.com/xbEltGe.png', 55000, 7)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (74, N'Gió lạnh đầu mùa', N'2010', N'Thạch Lam', N'https://i.imgur.com/eB4UN4C.jpg', 45000, 14)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (75, N'Hoàng tử bé', N'2001', N'Saint Exupery', N'https://i.imgur.com/f3RoN29.jpg', 30000, 1)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (76, N'Hành tình đến vô cực', N'2019', N'Stephen Hawkings', N'https://i.imgur.com/dgpHQ5Y.png', 156000, 40)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (77, N'Kính vạn hoa 6', N'2002', N'Nguyễn Nhật Ánh', N'https://i.imgur.com/RYMPBK0.png', 129000, 10)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (78, N'Những lá thư nhờ gió gửi cho ai đó', N'2012', N'Toon Tellegen', N'https://i.imgur.com/6vEvFCb.png', 43000, 2)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (79, N'Hỏi đáp về logistics', N'2003', N'Trần Thanh Hải', N'https://i.imgur.com/p0KXuFr.png', 100000, 7)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (80, N'Đào thoát khỏi mê cung', N'2004', N'Spencer Johnson', N'https://i.imgur.com/OgyK9rB.png', 41000, 6)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (81, N'Thơ Nguyễn Bính', N'1999', N'Nguyễn Bính', N'https://i.imgur.com/1a5nIgu.png', 40000, 1)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (83, N'Phận liễu', N'2000', N'Chu Thanh Hương', N'https://i.imgur.com/1Rbx0I9.png', 38000, 16)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (84, N'Răng sư tử', N'2019', N'Yên Ba', N'https://i.imgur.com/C1UKcnF.png', 200000, 1)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (85, N'Con tròn giấc đêm mẹ thêm hạnh phúc', N'2001', N'Estuko Shimizu', N'https://i.imgur.com/4VnI0x2.png', 69000, 9)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (86, N'Nhân duyên mèo định', N'2018', N'Melinda Metz', N'https://i.imgur.com/xdUFvpY.png', 52000, 14)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (87, N'Tấn Trò Đời', N'2006', N'Balzac', N'https://i.imgur.com/F2KFS1S.png', 70000, 9)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (89, N'Vợ ơi', N'2001', N'Nguyễn Duy', N'https://i.imgur.com/V2Rfh3q.png', 65000, 6)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (90, N'Hành trình vô cực 2', N'2016', N'Lâm Vĩ Dạ, Đoàn Thư', N'https://i.imgur.com/HxVJumK.png', 200000, 0)
INSERT [dbo].[Book] ([Id], [Title], [DatePublished], [Author], [Image], [Price], [Amount]) VALUES (91, N'Đế chế Atlantis và những vương quốc biến mất', N'2001', N'Frank Joseph', N'https://i.imgur.com/qYZuJq2.png', 131000, 10)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Bìa Cứng')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Bìa Mềm')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Văn Học Nc Ngoai')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Lịch Sử')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Địa Lý')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Khoa học')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Vật lý')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (8, N'Truyện cổ tích')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (9, N'Viễn tưởng')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (10, N'Tình cảm')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (11, N'Đời thường')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (12, N'Triết lý nhân sinh')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (13, N'Kinh dị')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (14, N'Hài kịch')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (16, N'Chính kịch')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (1, 73)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (1, 76)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (1, 80)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (1, 81)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (1, 90)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 67)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 68)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 70)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 71)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 72)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 74)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 75)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 77)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 78)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 79)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 83)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 84)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 85)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 86)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 87)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (2, 89)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (3, 73)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (3, 74)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (3, 81)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (3, 83)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (3, 86)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (3, 87)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (4, 71)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (5, 84)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (6, 70)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (6, 76)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (6, 79)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (7, 75)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (7, 79)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (9, 75)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (9, 76)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (9, 80)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 68)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 71)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 72)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 73)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 77)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 78)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 86)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 89)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (10, 90)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (11, 67)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (11, 78)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (11, 85)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (13, 89)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (14, 71)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (14, 77)
INSERT [dbo].[CategoryOfBook] ([CategoryId], [BookId]) VALUES (14, 80)
GO
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (75, 11, 3)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (81, 11, 4)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (87, 11, 2)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (90, 11, 1)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (72, 12, 2)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (73, 12, 3)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (77, 12, 2)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (80, 12, 2)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (67, 13, 3)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (73, 13, 1)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (70, 14, 1)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (70, 15, 1)
INSERT [dbo].[OrderDetail] ([BookId], [OrderId], [Amount]) VALUES (73, 16, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerName], [dateCreated], [PhoneNumber], [Address], [Total]) VALUES (11, N'Lưu Tuấn Quân', N'25/04/2023', N'077637526', N'227 Nguyễn Văn Cừ', 590000)
INSERT [dbo].[Orders] ([Id], [CustomerName], [dateCreated], [PhoneNumber], [Address], [Total]) VALUES (12, N'Minh Bảo', N'25/04/2023', N'099999999', N'227 Nguyễn Văn Cừ', 605000)
INSERT [dbo].[Orders] ([Id], [CustomerName], [dateCreated], [PhoneNumber], [Address], [Total]) VALUES (13, N'Lê Văn Đông', N'26/04/2023', N'0289877763', N'365 Đoàn Như Hài Q4', 271000)
INSERT [dbo].[Orders] ([Id], [CustomerName], [dateCreated], [PhoneNumber], [Address], [Total]) VALUES (14, N'Huỳnh Minh Bảo', N'15/04/2023', N'0985859876', N'999, Duong Hoàng Văn Thụ, Phuong Binh Tan, Quan Binh Tan, Thanh pho Ho Chi Minh, Viet Nam', 85000)
INSERT [dbo].[Orders] ([Id], [CustomerName], [dateCreated], [PhoneNumber], [Address], [Total]) VALUES (15, N'Huỳnh Minh Bảo', N'13/04/2023', N'0985859876', N'222, Duong Hoàng Văn Thụ, Phuong Binh Tan, Quan Binh Tan, Thanh pho Ho Chi Minh, Viet Nam', 85000)
INSERT [dbo].[Orders] ([Id], [CustomerName], [dateCreated], [PhoneNumber], [Address], [Total]) VALUES (16, N'Huỳnh Minh Bảo', N'24/04/2023', N'0985859876', N'73, Duong Hoàng Văn Thụ, Phuong Binh Tan, Quan Binh Tan, Thanh pho Ho Chi Minh, Viet Nam', 85000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
/****** Object:  Index [IX_CategoryOfBook_CategoryId]    Script Date: 4/28/2023 3:02:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryOfBook_CategoryId] ON [dbo].[CategoryOfBook]
(
	[CategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_BookId]    Script Date: 4/28/2023 3:02:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_BookId] ON [dbo].[OrderDetail]
(
	[BookId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[CategoryOfBook]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesOfBooks_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryOfBook] CHECK CONSTRAINT [FK_CategoriesOfBooks_Book]
GO
ALTER TABLE [dbo].[CategoryOfBook]  WITH CHECK ADD  CONSTRAINT [FK_CategoriesOfBooks_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryOfBook] CHECK CONSTRAINT [FK_CategoriesOfBooks_Category]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Book_BookId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders_OrderId]
GO
ALTER DATABASE [ShopBook_db] SET  READ_WRITE 
GO
