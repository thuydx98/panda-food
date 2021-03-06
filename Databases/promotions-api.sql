USE [master]
GO
/****** Object:  Database [CSMS.DB.Promotions]    Script Date: 7/18/2020 10:33:32 PM ******/
ALTER DATABASE [CSMS.DB.Promotions] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS.DB.Promotions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS.DB.Promotions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS.DB.Promotions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSMS.DB.Promotions] SET QUERY_STORE = OFF
GO
USE [CSMS.DB.Promotions]
GO
/****** Object:  Table [dbo].[CSMS_Device]    Script Date: 7/18/2020 10:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Device](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CSMS_Device] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Event]    Script Date: 7/18/2020 10:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[StartTimeInDate] [time](0) NULL,
	[EndTimeInDate] [time](0) NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[DiscountPercent] [smallint] NULL,
	[MaxDiscount] [int] NULL,
	[MinTotalInvoice] [int] NULL,
	[AccountLimit] [int] NULL,
	[QuantityLimit] [int] NULL,
	[AppliedAllProducts] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Event_Category]    Script Date: 7/18/2020 10:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Event_Category](
	[EventId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_Event_Category] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Event_Device]    Script Date: 7/18/2020 10:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Event_Device](
	[EventId] [int] NOT NULL,
	[DeviceId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_Event_Device] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[DeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Event_Product]    Script Date: 7/18/2020 10:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Event_Product](
	[EventId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_Event_Product] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Event_Type]    Script Date: 7/18/2020 10:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Event_Type](
	[Id] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CSMS_Event_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CSMS_Device] ON 

INSERT [dbo].[CSMS_Device] ([Id], [Code], [Title]) VALUES (1, N'ANDROID', N'Android')
INSERT [dbo].[CSMS_Device] ([Id], [Code], [Title]) VALUES (2, N'IOS', N'IOS')
INSERT [dbo].[CSMS_Device] ([Id], [Code], [Title]) VALUES (3, N'WEB', N'Web')
SET IDENTITY_INSERT [dbo].[CSMS_Device] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Event] ON 

INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (1, NULL, CAST(N'2020-04-23T17:07:02.907' AS DateTime), NULL, NULL, NULL, N'FreeShip', N'sd', 1, 100, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (2, NULL, CAST(N'2020-04-23T17:07:02.907' AS DateTime), NULL, NULL, NULL, N'FreeShip', N'sd', 1, 100, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (3, NULL, CAST(N'2020-04-23T17:07:02.907' AS DateTime), NULL, NULL, NULL, N'FreeShip', N'sd', 1, 100, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (4, NULL, CAST(N'2020-04-23T17:44:58.290' AS DateTime), NULL, NULL, NULL, N'FreeShip', N'asd', 1, 100, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (5, NULL, CAST(N'2020-04-23T17:45:00.000' AS DateTime), NULL, NULL, NULL, N'Discount (10%)', N'a', 2, 10, NULL, NULL, 2, NULL, 1, 1)
INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (6, N'TEST', CAST(N'2020-04-29T17:45:43.513' AS DateTime), NULL, NULL, NULL, N'FreeShip', N'222', 1, 100, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[CSMS_Event] ([Id], [Code], [StartTime], [EndTime], [StartTimeInDate], [EndTimeInDate], [Title], [Description], [EventTypeId], [DiscountPercent], [MaxDiscount], [MinTotalInvoice], [AccountLimit], [QuantityLimit], [AppliedAllProducts], [Enabled]) VALUES (7, NULL, CAST(N'2020-04-23T17:52:00.000' AS DateTime), CAST(N'2020-04-27T22:17:37.000' AS DateTime), NULL, NULL, N'Discount (5%)', N'333', 2, 5, NULL, NULL, NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[CSMS_Event] OFF
GO
INSERT [dbo].[CSMS_Event_Category] ([EventId], [CategoryId]) VALUES (7, 1)
GO
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (1, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (1, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (1, 3)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (2, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (2, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (2, 3)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (3, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (3, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (3, 3)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (4, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (4, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (4, 3)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (5, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (5, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (5, 3)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (6, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (6, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (6, 3)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (7, 1)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (7, 2)
INSERT [dbo].[CSMS_Event_Device] ([EventId], [DeviceId]) VALUES (7, 3)
GO
INSERT [dbo].[CSMS_Event_Product] ([EventId], [ProductId]) VALUES (7, 1)
INSERT [dbo].[CSMS_Event_Product] ([EventId], [ProductId]) VALUES (7, 2)
GO
INSERT [dbo].[CSMS_Event_Type] ([Id], [Code], [Title]) VALUES (1, N'FREESHIP', N'Free ship')
INSERT [dbo].[CSMS_Event_Type] ([Id], [Code], [Title]) VALUES (2, N'DISCOUNT', N'Discount')
GO
ALTER TABLE [dbo].[CSMS_Event] ADD  CONSTRAINT [DF_CSMS_Event_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [dbo].[CSMS_Event] ADD  CONSTRAINT [DF_CSMS_Event_AppliedAllProduct]  DEFAULT ((0)) FOR [AppliedAllProducts]
GO
ALTER TABLE [dbo].[CSMS_Event] ADD  CONSTRAINT [DF_CSMS_Event_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[CSMS_Event]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Event_CSMS_Event_Type] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[CSMS_Event_Type] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Event] CHECK CONSTRAINT [FK_CSMS_Event_CSMS_Event_Type]
GO
ALTER TABLE [dbo].[CSMS_Event_Category]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Event_Category_CSMS_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[CSMS_Event] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Event_Category] CHECK CONSTRAINT [FK_CSMS_Event_Category_CSMS_Event]
GO
ALTER TABLE [dbo].[CSMS_Event_Device]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Event_Device_CSMS_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[CSMS_Device] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Event_Device] CHECK CONSTRAINT [FK_CSMS_Event_Device_CSMS_Device]
GO
ALTER TABLE [dbo].[CSMS_Event_Device]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Event_Device_CSMS_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[CSMS_Event] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Event_Device] CHECK CONSTRAINT [FK_CSMS_Event_Device_CSMS_Event]
GO
ALTER TABLE [dbo].[CSMS_Event_Product]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Event_Product_CSMS_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[CSMS_Event] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Event_Product] CHECK CONSTRAINT [FK_CSMS_Event_Product_CSMS_Event]
GO
USE [master]
GO
ALTER DATABASE [CSMS.DB.Promotions] SET  READ_WRITE 
GO
