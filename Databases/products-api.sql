USE [master]
GO
/****** Object:  Database [CSMS.DB.Products]    Script Date: 7/18/2020 10:32:14 PM ******/
ALTER DATABASE [CSMS.DB.Products] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS.DB.Products].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS.DB.Products] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS.DB.Products] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS.DB.Products] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS.DB.Products] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS.DB.Products] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS.DB.Products] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS.DB.Products] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS.DB.Products] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS.DB.Products] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS.DB.Products] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSMS.DB.Products] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSMS.DB.Products] SET QUERY_STORE = OFF
GO
USE [CSMS.DB.Products]
GO
/****** Object:  Table [dbo].[CSMS_Branch_Product]    Script Date: 7/18/2020 10:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Branch_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_Branch_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Category]    Script Date: 7/18/2020 10:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Product]    Script Date: 7/18/2020 10:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Code] [varchar](100) NULL,
	[Name] [nvarchar](200) NOT NULL,
	[AvatarId] [int] NULL,
	[Price] [varchar](20) NULL,
	[ShortDescription] [nvarchar](300) NULL,
	[Description] [nvarchar](max) NULL,
	[Rate] [decimal](2, 1) NULL,
	[SearchString] [nvarchar](1000) NULL,
	[Enabled] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Product_Photo]    Script Date: 7/18/2020 10:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Product_Photo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PhotoId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_Product_Photo_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Vote]    Script Date: 7/18/2020 10:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Vote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Fullname] [nvarchar](200) NOT NULL,
	[Score] [decimal](2, 1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[VotedDate] [datetime] NOT NULL,
	[InvoiceId] [nvarchar](50) NULL,
 CONSTRAINT [PK_CSMS_Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Vote_Photo]    Script Date: 7/18/2020 10:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Vote_Photo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VoteId] [int] NOT NULL,
	[PhotoId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_Vote_Photo_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CSMS_Branch_Product] ON 

INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (18, 1, 1)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (23, 2, 5)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (24, 2, 4)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (25, 2, 3)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (26, 2, 10)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (27, 3, 4)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (28, 3, 5)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (29, 3, 6)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (30, 4, 3)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (31, 4, 5)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (32, 5, 3)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (33, 5, 5)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (34, 5, 6)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (35, 5, 10)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (36, 4, 4)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (37, 1, 4)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (38, 1, 5)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (39, 1, 6)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (40, 1, 10)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (41, 3, 10)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (42, 3, 3)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (43, 6, 4)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (44, 6, 5)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (45, 6, 6)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (46, 6, 10)
INSERT [dbo].[CSMS_Branch_Product] ([Id], [BranchId], [ProductId]) VALUES (47, 6, 3)
SET IDENTITY_INSERT [dbo].[CSMS_Branch_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Category] ON 

INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (1, N'Appetizers', 1, 0)
INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (2, N'Main dishes', 1, 0)
INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (22, N'Desserts', 0, 0)
INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (23, N'Drinks', 1, 0)
INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (24, N'Sea foods', 0, 0)
INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (25, N'Fruits', 0, 0)
INSERT [dbo].[CSMS_Category] ([Id], [Name], [Enabled], [Deleted]) VALUES (26, N'Fast foods', 1, 0)
SET IDENTITY_INSERT [dbo].[CSMS_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Product] ON 

INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (1, 26, N'PD00001', N'Pizza', 1, N'120000', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(4.0 AS Decimal(2, 1)), N'pi da | banh trang nuong | bánh tráng nướng | do an | đồ ăn | nhanh | bi za | pi za', 1, 0)
INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (2, 2, N'PD00002', N'Sizzling Pancake', 2, N'25000', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(4.8 AS Decimal(2, 1)), N'banh xeo | bánh xèo | trang nuong | tráng nướng | viet nam | vietnam | việt nam | trung', 1, 0)
INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (3, 23, N'PD00003', N'Coca', 3, N'10000', N'Some quick example text to build on the card time and make up the bulk of the card''s content.', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(4.3 AS Decimal(2, 1)), N'coco | giai khat | giải khát | nước | cocacola | coca cola | big cola | thức uống | thuc uong | nuoc', 1, 0)
INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (4, 26, N'PD00004', N'Hamburger', 4, N'45000', N'Some quick ', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(5.0 AS Decimal(2, 1)), N'bánh mì | banh mi | hăm bơ gơ | đồ ăn | nhanh | ý | Italia', 1, 0)
INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (5, 26, N'PD00005', N'Fried Chicken', 5, N'25000', N'Some quick example text to build on th', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(4.5 AS Decimal(2, 1)), N'gà | chicken | chiên | rán | ga chien | ga | do an | đồ ăn', 1, 0)
INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (6, 1, N'PD00006', N'Sandwich', 6, N'39000', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(5.0 AS Decimal(2, 1)), N'do an | banh kep | bánh kẹp | trộn | tron | salat | sa lát | nhanh', 1, 0)
INSERT [dbo].[CSMS_Product] ([Id], [CategoryId], [Code], [Name], [AvatarId], [Price], [ShortDescription], [Description], [Rate], [SearchString], [Enabled], [Deleted]) VALUES (10, 23, NULL, N'Pepsi', 7, N'10000', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', N'Some quick example text to build on the card title and make up the bulk of the card''s content.', CAST(4.0 AS Decimal(2, 1)), N'pépi | giải khát | giai khat | nước | nuoc | ưater | water | nuoc ngot', 1, 0)
SET IDENTITY_INSERT [dbo].[CSMS_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Vote] ON 

INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (3, 2, 1, N'Thuy Xuan Dao', CAST(5.0 AS Decimal(2, 1)), N'title', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-02-21T22:08:17.590' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (4, 5, 1, N'Micha Jach', CAST(4.0 AS Decimal(2, 1)), N'title', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-02-28T22:05:09.997' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (5, 5, 2, N'John Newmann', CAST(5.0 AS Decimal(2, 1)), N'title', N'Oh ok, music check Khan ngot going nguoi morning that lan, guy nhien going cay cho Co gain nguoi minh', CAST(N'2020-02-28T22:05:20.407' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (6, 5, 3, N'Alester', CAST(4.0 AS Decimal(2, 1)), N'title', N'Good for us. We will reorder as soon as posible', CAST(N'2020-02-28T22:09:04.477' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (7, 5, 4, N'Malock', CAST(5.0 AS Decimal(2, 1)), N'title', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-02-28T22:10:25.633' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (8, 2, 116, N'An Công Ngô', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Bánh CEO rat noon, see good thieu cho ban be back nguoi that trong lan k IEP. Ming lion duo ung go shop.', CAST(N'2020-04-11T17:20:17.877' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (9, 2, 116, N'An Công Ngô', CAST(4.0 AS Decimal(2, 1)), N'OK', N'Oh ok, music check Khan ngot going nguoi morning that lan, guy nhien going cay cho Co gain nguoi minh', CAST(N'2020-04-11T17:21:37.890' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (10, 4, 1, N'Thủy Xuân Đào', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Good for us. We will reorder as soon as posible', CAST(N'2020-04-11T17:58:01.607' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (11, 10, 1, N'Thủy Xuân Đào', CAST(4.0 AS Decimal(2, 1)), N'OK', N'Khá ok so với giá cả, sẽ ủng hộ thường xuyên.
', CAST(N'2020-04-11T18:28:42.920' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (12, 1, 1, N'Thủy Xuân Đào', CAST(4.0 AS Decimal(2, 1)), N'OK', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-04-12T20:59:12.993' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (23, 4, 116, N'An Công Ngô', CAST(5.0 AS Decimal(2, 1)), N'Good', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-05-08T01:14:00.960' AS DateTime), N'200504163941U116')
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (24, 4, 116, N'An Công Ngô', CAST(5.0 AS Decimal(2, 1)), N'Good', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-05-08T01:15:27.857' AS DateTime), N'200504165113U116')
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (25, 1, 1, N'Thủy Xuân Đào', CAST(5.0 AS Decimal(2, 1)), N'Good', N'
Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-05-08T01:38:23.493' AS DateTime), N'200502182018U1')
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (28, 1, 124, N'Ngô Công An', CAST(3.0 AS Decimal(2, 1)), N'Normal', N'Xam hihi ababbababababababbababababababababaaaban', CAST(N'2020-05-27T10:47:22.703' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (29, 5, 124, N'Ngô Công An', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-05-27T20:20:30.260' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (30, 5, 124, N'Ngô Công An', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-05-27T20:23:03.590' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (31, 3, 124, N'Ngô Công An', CAST(4.0 AS Decimal(2, 1)), N'Good', N'Sản phẩm tốt, nhân viên nhiệt tình chu đáo, chỗ ngồi sạch sẽ, nhanh tiện lợi, giá phù hợp với người ăn, sẽ ủng hộ nhiều', CAST(N'2020-05-28T14:05:31.890' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (32, 5, 124, N'Ngô Công An', CAST(4.0 AS Decimal(2, 1)), N'Good', N'Quite ok compared to the price, good food, very good service staff, enthusiastic I will support often.', CAST(N'2020-05-28T14:09:15.390' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (33, 3, 124, N'Ngô Công An', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Sản phẩm tốt, nhân viên nhiệt tình chu đáo, chỗ ngồi sạch sẽ, nhanh tiện lợi, giá phù hợp với người ăn, sẽ ủng hộ nhiều', CAST(N'2020-06-01T17:24:00.747' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (34, 3, 124, N'Ngô Công An', CAST(4.0 AS Decimal(2, 1)), N'Good', N'Sản phẩm tốt, nhân viên nhiệt tình chu đáo, chỗ ngồi sạch sẽ, nhanh tiện lợi, giá phù hợp với người ăn, sẽ ủng hộ nhiều', CAST(N'2020-06-06T10:40:14.103' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (35, 2, 1, N'Thủy Xuân Đào', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Good so good 5555555555555555', CAST(N'2020-07-08T00:26:29.743' AS DateTime), N'200708002509U1')
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (36, 5, 116, N'An Công Ngô', CAST(4.0 AS Decimal(2, 1)), N'OK', N'Món ăn này sexy quá. Chịch nó đực ko', CAST(N'2020-07-15T20:02:56.473' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (37, 6, 116, N'Ngô Công An', CAST(5.0 AS Decimal(2, 1)), N'Good', N'Test ki

Ffg
Kbbfyu
Hjjkhhjh
Hhhh
Ghhh
Hhhh
Hjjkk
Hjj
Hjjkk
Hjjkkhjjk
Hjk', CAST(N'2020-07-16T08:59:37.983' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (38, 6, 116, N'Ngô Công An', CAST(5.0 AS Decimal(2, 1)), N'Good', N'hdhein
hdkk
fff
dff
fghtrg', CAST(N'2020-07-16T09:05:46.203' AS DateTime), NULL)
INSERT [dbo].[CSMS_Vote] ([Id], [ProductId], [UserId], [Fullname], [Score], [Title], [Comment], [VotedDate], [InvoiceId]) VALUES (39, 4, 116, N'Ngô Công An', CAST(5.0 AS Decimal(2, 1)), N'Good', N'ẹhgggf
vvhhjj
vhhhj
ghhj



















', CAST(N'2020-07-16T10:31:35.117' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CSMS_Vote] OFF
GO
ALTER TABLE [dbo].[CSMS_Category] ADD  CONSTRAINT [DF_CSMS_Category_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[CSMS_Category] ADD  CONSTRAINT [DF_CSMS_Category_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CSMS_Product] ADD  CONSTRAINT [DF_CSMS_Product_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[CSMS_Product] ADD  CONSTRAINT [DF_CSMS_Product_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[CSMS_Product] ADD  CONSTRAINT [DF_CSMS_Product_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CSMS_Vote] ADD  CONSTRAINT [DF_CSMS_Vote_VotedDate]  DEFAULT (getdate()) FOR [VotedDate]
GO
ALTER TABLE [dbo].[CSMS_Branch_Product]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Branch_Product_CSMS_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[CSMS_Product] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Branch_Product] CHECK CONSTRAINT [FK_CSMS_Branch_Product_CSMS_Product]
GO
ALTER TABLE [dbo].[CSMS_Product]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Product_CSMS_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CSMS_Category] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Product] CHECK CONSTRAINT [FK_CSMS_Product_CSMS_Category]
GO
ALTER TABLE [dbo].[CSMS_Product_Photo]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Product_Photo_CSMS_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[CSMS_Product] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Product_Photo] CHECK CONSTRAINT [FK_CSMS_Product_Photo_CSMS_Product]
GO
ALTER TABLE [dbo].[CSMS_Vote]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Vote_CSMS_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[CSMS_Product] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Vote] CHECK CONSTRAINT [FK_CSMS_Vote_CSMS_Product]
GO
ALTER TABLE [dbo].[CSMS_Vote_Photo]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Vote_Photo_CSMS_Vote] FOREIGN KEY([VoteId])
REFERENCES [dbo].[CSMS_Vote] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Vote_Photo] CHECK CONSTRAINT [FK_CSMS_Vote_Photo_CSMS_Vote]
GO
/****** Object:  Trigger [dbo].[Csms_Vote.AfterInsertUpdateTrigger]    Script Date: 7/18/2020 10:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Csms_Vote.AfterInsertUpdateTrigger] ON [dbo].[CSMS_Vote]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @product_id int;
	DECLARE @old_rate int;
	DECLARE @new_rate int;

	SELECT @product_id = i.ProductId FROM inserted i;

		UPDATE CSMS_Product
		SET Rate = (
			SELECT AVG(Score)
			FROM CSMS_Vote
			WHERE ProductId = @product_id
		)
		WHERE Id = @product_id
    
END
GO
ALTER TABLE [dbo].[CSMS_Vote] ENABLE TRIGGER [Csms_Vote.AfterInsertUpdateTrigger]
GO
USE [master]
GO
ALTER DATABASE [CSMS.DB.Products] SET  READ_WRITE 
GO
