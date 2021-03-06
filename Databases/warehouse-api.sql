USE [master]
GO
/****** Object:  Database [CSMS.DB.Warehouse]    Script Date: 7/18/2020 10:38:32 PM ******/
ALTER DATABASE [CSMS.DB.Warehouse] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS.DB.Warehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET QUERY_STORE = OFF
GO
USE [CSMS.DB.Warehouse]
GO
/****** Object:  Table [dbo].[CSMS_ExportHistory]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_ExportHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExportDate] [datetime] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[QuantityUnit] [decimal](8, 2) NOT NULL,
	[BranchId] [int] NOT NULL,
	[BranchName] [nvarchar](200) NULL,
 CONSTRAINT [PK_CSMS_ExportHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_ImportHistory]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_ImportHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImportDate] [datetime] NOT NULL,
	[PartnerId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[QuantityUnit] [decimal](8, 2) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[TotalPrice] [decimal](14, 2) NOT NULL,
	[HavePaid] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_ImportHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Material]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Amount] [decimal](8, 2) NULL,
	[DefaultPartnerId] [int] NULL,
	[DefaultQuantity] [decimal](10, 2) NULL,
 CONSTRAINT [PK_CSMS_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Partner]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Partner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PhoneNumber] [varchar](100) NULL,
	[Address] [nvarchar](200) NULL,
 CONSTRAINT [PK_CSMS_Partner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Partner_Material]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Partner_Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[MaxUnit] [int] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_Partner_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_SpendingHistory]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_SpendingHistory](
	[BillCode] [varchar](20) NOT NULL,
	[BranchId] [int] NULL,
	[BranchName] [nvarchar](200) NULL,
	[SpendTypeId] [varchar](50) NOT NULL,
	[PartnerId] [int] NULL,
	[Total] [decimal](10, 2) NOT NULL,
	[SpentTime] [datetime] NOT NULL,
	[Remark] [nvarchar](1000) NULL,
	[HavePaid] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_SpendingHistory] PRIMARY KEY CLUSTERED 
(
	[BillCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_SpendType]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_SpendType](
	[Id] [varchar](50) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CSMS_SpendType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Store_Export_Default]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Store_Export_Default](
	[BranchId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[QuantityUnit] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_CSMS_Store_Export_Default] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC,
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_UsedMaterialLog]    Script Date: 7/18/2020 10:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_UsedMaterialLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[BranchName] [nvarchar](200) NOT NULL,
	[Amount] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_CSMS_UsedMaterialLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CSMS_ExportHistory] ON 

INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (1, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 1, CAST(4.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (2, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 2, CAST(2.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (3, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 4, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (4, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (5, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (6, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (7, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (8, CAST(N'2020-06-27T19:23:01.123' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (9, CAST(N'2020-06-27T19:24:10.273' AS DateTime), 1, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (10, CAST(N'2020-06-27T19:24:35.160' AS DateTime), 1, CAST(1.00 AS Decimal(8, 2)), 3, N'Panda Trần Duy Hưng')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (11, CAST(N'2020-06-27T22:44:01.613' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 4, N'Panda Trường Chinh')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (12, CAST(N'2020-06-27T22:44:13.547' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 5, N'Panda Hàng Xanh')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (13, CAST(N'2020-06-28T00:20:24.470' AS DateTime), 1, CAST(1.00 AS Decimal(8, 2)), 3, N'Panda Trần Duy Hưng')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (14, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 1, CAST(4.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (15, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 2, CAST(2.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (16, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 4, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (17, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (18, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (19, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (20, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (21, CAST(N'2020-06-29T01:17:54.863' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (22, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 1, CAST(4.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (23, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 2, CAST(2.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (24, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 4, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (25, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (26, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (27, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (28, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (29, CAST(N'2020-07-03T01:17:21.753' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (30, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 1, CAST(4.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (31, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 2, CAST(2.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (32, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 4, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (33, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (34, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (35, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (36, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (37, CAST(N'2020-07-10T11:08:06.910' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (38, CAST(N'2020-07-14T10:40:03.837' AS DateTime), 1, CAST(4.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (39, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 2, CAST(2.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (40, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 3, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (41, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 4, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (42, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (43, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 6, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (44, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (45, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (46, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (47, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 10, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (48, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (49, CAST(N'2020-07-14T10:40:03.840' AS DateTime), 12, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (50, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 1, CAST(9.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (51, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 2, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (52, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (53, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (54, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (55, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (56, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 10, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (57, CAST(N'2020-07-15T13:33:48.853' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 2, N'Panda Lê Khương')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (58, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 1, CAST(4.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (59, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 2, CAST(2.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (60, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 4, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (61, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 5, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (62, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 7, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (63, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 8, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (64, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 9, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
INSERT [dbo].[CSMS_ExportHistory] ([Id], [ExportDate], [MaterialId], [QuantityUnit], [BranchId], [BranchName]) VALUES (65, CAST(N'2020-07-16T02:09:40.590' AS DateTime), 11, CAST(1.00 AS Decimal(8, 2)), 1, N'Panda Võ Văn Ngân')
SET IDENTITY_INSERT [dbo].[CSMS_ExportHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_ImportHistory] ON 

INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (1, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (2, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (3, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (4, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 4, 9, CAST(25.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(600000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (5, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (6, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (7, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 3, 11, CAST(7.00 AS Decimal(8, 2)), CAST(500000.00 AS Decimal(8, 2)), CAST(3500000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (8, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 1, 3, CAST(13.00 AS Decimal(8, 2)), CAST(130000.00 AS Decimal(8, 2)), CAST(1690000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (9, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 1, 4, CAST(13.00 AS Decimal(8, 2)), CAST(135000.00 AS Decimal(8, 2)), CAST(1755000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (10, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 1, 6, CAST(13.00 AS Decimal(8, 2)), CAST(7800.00 AS Decimal(8, 2)), CAST(101400.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (11, CAST(N'2020-06-26T23:51:57.030' AS DateTime), 4, 10, CAST(11.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(352000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (12, CAST(N'2020-06-27T00:28:09.613' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (13, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (14, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (15, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (16, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (17, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 4, 9, CAST(8.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(192000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (18, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 4, 10, CAST(4.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(128000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (19, CAST(N'2020-06-27T00:28:09.617' AS DateTime), 3, 11, CAST(9.00 AS Decimal(8, 2)), CAST(500000.00 AS Decimal(8, 2)), CAST(4500000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (20, CAST(N'2020-06-27T18:54:51.367' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (21, CAST(N'2020-06-27T18:54:51.373' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (22, CAST(N'2020-06-27T18:54:51.373' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (23, CAST(N'2020-06-27T18:54:51.373' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (24, CAST(N'2020-06-27T18:54:51.373' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (25, CAST(N'2020-06-27T18:54:51.373' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (26, CAST(N'2020-06-27T18:54:51.373' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (27, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (28, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (29, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (30, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (31, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (32, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (33, CAST(N'2020-06-27T19:02:21.023' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (34, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (35, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (36, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (37, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (38, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (39, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (40, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (41, CAST(N'2020-06-27T19:02:39.917' AS DateTime), 3, 11, CAST(1.00 AS Decimal(8, 2)), CAST(500000.00 AS Decimal(8, 2)), CAST(500000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (42, CAST(N'2020-06-27T22:34:19.253' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (43, CAST(N'2020-06-27T22:34:19.257' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (44, CAST(N'2020-06-27T22:34:19.257' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (45, CAST(N'2020-06-27T22:34:19.257' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (46, CAST(N'2020-06-27T22:34:19.257' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (47, CAST(N'2020-06-27T22:34:19.257' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (48, CAST(N'2020-06-27T22:34:19.257' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (49, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (50, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (51, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (52, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (53, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (54, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (55, CAST(N'2020-06-27T22:36:10.330' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (56, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (57, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (58, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (59, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (60, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (61, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (62, CAST(N'2020-06-27T22:37:53.040' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (63, CAST(N'2020-06-27T22:44:38.047' AS DateTime), 1, 6, CAST(1.00 AS Decimal(8, 2)), CAST(7800.00 AS Decimal(8, 2)), CAST(7800.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (64, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (65, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (66, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (67, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (68, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (69, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (70, CAST(N'2020-06-28T13:54:24.363' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (71, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (72, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (73, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (74, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (75, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (76, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (77, CAST(N'2020-06-29T01:17:12.197' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (78, CAST(N'2020-07-01T22:16:23.123' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (79, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (80, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 1, 3, CAST(5.00 AS Decimal(8, 2)), CAST(130000.00 AS Decimal(8, 2)), CAST(650000.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (81, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 1, 4, CAST(7.00 AS Decimal(8, 2)), CAST(135000.00 AS Decimal(8, 2)), CAST(945000.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (82, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (83, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 1, 6, CAST(6.00 AS Decimal(8, 2)), CAST(7800.00 AS Decimal(8, 2)), CAST(46800.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (84, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (85, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (86, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (87, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (88, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 3, 11, CAST(6.00 AS Decimal(8, 2)), CAST(500000.00 AS Decimal(8, 2)), CAST(3000000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (89, CAST(N'2020-07-01T22:16:23.127' AS DateTime), 4, 12, CAST(7.00 AS Decimal(8, 2)), CAST(30000.00 AS Decimal(8, 2)), CAST(210000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (90, CAST(N'2020-07-01T23:45:11.123' AS DateTime), 2, 1, CAST(1.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (91, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (92, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (93, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (94, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (95, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (96, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (97, CAST(N'2020-07-03T01:15:47.310' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (98, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (99, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
GO
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (100, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (101, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (102, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (103, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (104, CAST(N'2020-07-10T11:07:49.520' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (105, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 2, 1, CAST(11.00 AS Decimal(8, 2)), CAST(180000.00 AS Decimal(8, 2)), CAST(1980000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (106, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 2, 2, CAST(9.00 AS Decimal(8, 2)), CAST(150000.00 AS Decimal(8, 2)), CAST(1350000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (107, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 3, 5, CAST(15.00 AS Decimal(8, 2)), CAST(250000.00 AS Decimal(8, 2)), CAST(3750000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (108, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 2, 7, CAST(15.00 AS Decimal(8, 2)), CAST(45000.00 AS Decimal(8, 2)), CAST(675000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (109, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 3, 8, CAST(45.00 AS Decimal(8, 2)), CAST(1300.00 AS Decimal(8, 2)), CAST(58500.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (110, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 4, 9, CAST(9.00 AS Decimal(8, 2)), CAST(24000.00 AS Decimal(8, 2)), CAST(216000.00 AS Decimal(14, 2)), 0)
INSERT [dbo].[CSMS_ImportHistory] ([Id], [ImportDate], [PartnerId], [MaterialId], [QuantityUnit], [Price], [TotalPrice], [HavePaid]) VALUES (111, CAST(N'2020-07-16T02:08:59.190' AS DateTime), 4, 10, CAST(15.00 AS Decimal(8, 2)), CAST(32000.00 AS Decimal(8, 2)), CAST(480000.00 AS Decimal(14, 2)), 0)
SET IDENTITY_INSERT [dbo].[CSMS_ImportHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Material] ON 

INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (1, N'Beef', N'kg', NULL, 2, CAST(11.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (2, N'Pork', N'kg', NULL, 2, CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (3, N'Coca', N'cartons', CAST(24.00 AS Decimal(8, 2)), 1, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (4, N'Pepsi', N'cartons', CAST(24.00 AS Decimal(8, 2)), 1, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (5, N'Rice flour', N'kg', NULL, 3, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (6, N'Sting', N'boxes', CAST(24.00 AS Decimal(8, 2)), 1, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (7, N'Chicken', N'items', NULL, 2, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (8, N'Bread', N'items', NULL, 3, CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (9, N'Salat', N'kg', NULL, 4, CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (10, N'Nuoc mam', N'bottles', NULL, 4, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (11, N'Vegetables', N'items', NULL, NULL, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[CSMS_Material] ([Id], [Name], [Unit], [Amount], [DefaultPartnerId], [DefaultQuantity]) VALUES (12, N'Cooking oil', N'bottle', CAST(1.00 AS Decimal(8, 2)), NULL, CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[CSMS_Material] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Partner] ON 

INSERT [dbo].[CSMS_Partner] ([Id], [Name], [PhoneNumber], [Address]) VALUES (1, N'CTy Vinamilk', N'0987654321', N'101, Hamlet 6, Dong Hoa, Di An, Binh Duong')
INSERT [dbo].[CSMS_Partner] ([Id], [Name], [PhoneNumber], [Address]) VALUES (2, N'CTy China Food', N'0293239239', N'1293, Le Loi, Dong Hoa, Quan 3, Tp. Ho Chi Minh')
INSERT [dbo].[CSMS_Partner] ([Id], [Name], [PhoneNumber], [Address]) VALUES (3, N'Cty Dalat Veges', N'0988777676', N'02, Lac Duong, Phuong 2, Da Lat, Lam Dong')
INSERT [dbo].[CSMS_Partner] ([Id], [Name], [PhoneNumber], [Address]) VALUES (4, N'Bach Hoa Xanh', N'18001810', N'242 Dinh Tien Hoang, Quan 1, HCM')
INSERT [dbo].[CSMS_Partner] ([Id], [Name], [PhoneNumber], [Address]) VALUES (5, N'testPartner', N'0782408251', N'Cẩm Đường, Long Thành')
SET IDENTITY_INSERT [dbo].[CSMS_Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Partner_Material] ON 

INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (2, 1, 4, CAST(135000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (3, 1, 3, CAST(130000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (4, 2, 1, CAST(180000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (5, 2, 2, CAST(150000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (6, 3, 5, CAST(250000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (7, 3, 8, CAST(1300.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (8, 3, 11, CAST(500000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (9, 4, 9, CAST(24000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (10, 4, 10, CAST(32000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (11, 1, 6, CAST(7800.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (12, 2, 7, CAST(45000.00 AS Decimal(10, 2)), NULL, 0)
INSERT [dbo].[CSMS_Partner_Material] ([Id], [PartnerId], [MaterialId], [Price], [MaxUnit], [Deleted]) VALUES (13, 4, 12, CAST(30000.00 AS Decimal(10, 2)), NULL, 0)
SET IDENTITY_INSERT [dbo].[CSMS_Partner_Material] OFF
GO
INSERT [dbo].[CSMS_SpendingHistory] ([BillCode], [BranchId], [BranchName], [SpendTypeId], [PartnerId], [Total], [SpentTime], [Remark], [HavePaid]) VALUES (N'IM-2020.07-1.1', NULL, NULL, N'IM', 1, CAST(1641800.00 AS Decimal(10, 2)), CAST(N'2020-07-01T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[CSMS_SpendingHistory] ([BillCode], [BranchId], [BranchName], [SpendTypeId], [PartnerId], [Total], [SpentTime], [Remark], [HavePaid]) VALUES (N'IM-2020.07-2.1', NULL, NULL, N'IM', 2, CAST(4005000.00 AS Decimal(10, 2)), CAST(N'2020-07-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'EF', N'Electricity Fee')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'EM', N'New Equipment & Maintenance')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'IF', N'Internet Fee')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'IM', N'Import Materials')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'OT', N'Others')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'SE', N'Staffing Expenses')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'SSF', N'Shop Space Fee')
INSERT [dbo].[CSMS_SpendType] ([Id], [TypeName]) VALUES (N'WF', N'Water Fee')
GO
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 1, CAST(4.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 2, CAST(2.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 3, CAST(0.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 4, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 5, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 6, CAST(0.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 7, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 8, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 9, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 10, CAST(0.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (1, 11, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 1, CAST(9.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 2, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 3, CAST(2.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 4, CAST(2.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 5, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 6, CAST(2.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 7, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 8, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 9, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 10, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 11, CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_Store_Export_Default] ([BranchId], [MaterialId], [QuantityUnit]) VALUES (2, 12, CAST(2.00 AS Decimal(8, 2)))
GO
SET IDENTITY_INSERT [dbo].[CSMS_UsedMaterialLog] ON 

INSERT [dbo].[CSMS_UsedMaterialLog] ([Id], [MaterialId], [BranchId], [BranchName], [Amount]) VALUES (1, 1, 1, N'Panda Võ Văn Ngân', CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_UsedMaterialLog] ([Id], [MaterialId], [BranchId], [BranchName], [Amount]) VALUES (2, 1, 1, N'Panda Võ Văn Ngân', CAST(1.00 AS Decimal(8, 2)))
INSERT [dbo].[CSMS_UsedMaterialLog] ([Id], [MaterialId], [BranchId], [BranchName], [Amount]) VALUES (3, 1, 1, N'Panda Võ Văn Ngân', CAST(1.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[CSMS_UsedMaterialLog] OFF
GO
ALTER TABLE [dbo].[CSMS_ImportHistory] ADD  CONSTRAINT [DF_CSMS_ImportHistory_HavePaid]  DEFAULT ((0)) FOR [HavePaid]
GO
ALTER TABLE [dbo].[CSMS_Partner_Material] ADD  CONSTRAINT [DF_CSMS_Partner_Material_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CSMS_SpendingHistory] ADD  CONSTRAINT [DF_CSMS_SpendingHistory_HavePaid]  DEFAULT ((0)) FOR [HavePaid]
GO
ALTER TABLE [dbo].[CSMS_ExportHistory]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_ExportHistory_CSMS_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[CSMS_Material] ([Id])
GO
ALTER TABLE [dbo].[CSMS_ExportHistory] CHECK CONSTRAINT [FK_CSMS_ExportHistory_CSMS_Material]
GO
ALTER TABLE [dbo].[CSMS_ImportHistory]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_ImportHistory_CSMS_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[CSMS_Material] ([Id])
GO
ALTER TABLE [dbo].[CSMS_ImportHistory] CHECK CONSTRAINT [FK_CSMS_ImportHistory_CSMS_Material]
GO
ALTER TABLE [dbo].[CSMS_ImportHistory]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_ImportHistory_CSMS_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[CSMS_Partner] ([Id])
GO
ALTER TABLE [dbo].[CSMS_ImportHistory] CHECK CONSTRAINT [FK_CSMS_ImportHistory_CSMS_Partner]
GO
ALTER TABLE [dbo].[CSMS_Material]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Material_CSMS_Partner] FOREIGN KEY([DefaultPartnerId])
REFERENCES [dbo].[CSMS_Partner] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Material] CHECK CONSTRAINT [FK_CSMS_Material_CSMS_Partner]
GO
ALTER TABLE [dbo].[CSMS_Partner_Material]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Partner_Material_CSMS_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[CSMS_Material] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Partner_Material] CHECK CONSTRAINT [FK_CSMS_Partner_Material_CSMS_Material]
GO
ALTER TABLE [dbo].[CSMS_Partner_Material]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Partner_Material_CSMS_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[CSMS_Partner] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Partner_Material] CHECK CONSTRAINT [FK_CSMS_Partner_Material_CSMS_Partner]
GO
ALTER TABLE [dbo].[CSMS_SpendingHistory]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_SpendingHistory_CSMS_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[CSMS_Partner] ([Id])
GO
ALTER TABLE [dbo].[CSMS_SpendingHistory] CHECK CONSTRAINT [FK_CSMS_SpendingHistory_CSMS_Partner]
GO
ALTER TABLE [dbo].[CSMS_SpendingHistory]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_SpendingHistory_CSMS_SpendType] FOREIGN KEY([SpendTypeId])
REFERENCES [dbo].[CSMS_SpendType] ([Id])
GO
ALTER TABLE [dbo].[CSMS_SpendingHistory] CHECK CONSTRAINT [FK_CSMS_SpendingHistory_CSMS_SpendType]
GO
ALTER TABLE [dbo].[CSMS_Store_Export_Default]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Store_Export_Default_CSMS_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[CSMS_Material] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Store_Export_Default] CHECK CONSTRAINT [FK_CSMS_Store_Export_Default_CSMS_Material]
GO
ALTER TABLE [dbo].[CSMS_UsedMaterialLog]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_UsedMaterialLog_CSMS_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[CSMS_Material] ([Id])
GO
ALTER TABLE [dbo].[CSMS_UsedMaterialLog] CHECK CONSTRAINT [FK_CSMS_UsedMaterialLog_CSMS_Material]
GO
USE [master]
GO
ALTER DATABASE [CSMS.DB.Warehouse] SET  READ_WRITE 
GO
