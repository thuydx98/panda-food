USE [master]
GO
/****** Object:  Database [CSMS.DB.System]    Script Date: 7/18/2020 10:34:30 PM ******/
ALTER DATABASE [CSMS.DB.System] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS.DB.System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS.DB.System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS.DB.System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS.DB.System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS.DB.System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS.DB.System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS.DB.System] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS.DB.System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS.DB.System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS.DB.System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS.DB.System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSMS.DB.System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSMS.DB.System] SET QUERY_STORE = OFF
GO
USE [CSMS.DB.System]
GO
/****** Object:  Table [dbo].[CSMS_Branch]    Script Date: 7/18/2020 10:34:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Branch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Location] [varchar](50) NULL,
	[OpenTime] [time](0) NULL,
	[CloseTime] [time](0) NULL,
	[Enabled] [bit] NULL,
	[Add_Country] [nvarchar](50) NULL,
	[Add_Province] [nvarchar](100) NULL,
	[Add_District] [nvarchar](100) NULL,
	[Add_Ward] [nvarchar](100) NULL,
	[Add_Detail] [nvarchar](200) NULL,
	[Tables] [nvarchar](1000) NULL,
	[SpaceFee] [decimal](10, 2) NOT NULL,
	[InternetFee] [decimal](10, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CSMS_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Branch_PhoneNumber]    Script Date: 7/18/2020 10:34:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Branch_PhoneNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CSMS_Branch_PhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CSMS_Branch] ON 

INSERT [dbo].[CSMS_Branch] ([Id], [ShortName], [Name], [Description], [Location], [OpenTime], [CloseTime], [Enabled], [Add_Country], [Add_Province], [Add_District], [Add_Ward], [Add_Detail], [Tables], [SpaceFee], [InternetFee], [Deleted]) VALUES (1, N'CN001', N'Panda Võ Văn Ngân', N'des.', N'10.85006269629342 | 106.77141829260303', CAST(N'08:02:00' AS Time), CAST(N'23:02:00' AS Time), 1, NULL, N'Hồ Chí Minh', N'Thủ Đức', N'Linh Chiểu', N'01 Võ Văn Ngân', N'A1, A2, A3, A4, A5, A6, B1, B2, B3, B4', CAST(15000000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[CSMS_Branch] ([Id], [ShortName], [Name], [Description], [Location], [OpenTime], [CloseTime], [Enabled], [Add_Country], [Add_Province], [Add_District], [Add_Ward], [Add_Detail], [Tables], [SpaceFee], [InternetFee], [Deleted]) VALUES (2, N'CN002', N'Panda Lê Khương', NULL, N'10.872899579767003 | 106.64834226983642', CAST(N'09:30:00' AS Time), CAST(N'23:00:00' AS Time), 1, NULL, N'Hồ Chí Minh', N'Quận 12', N'Hiệp Thành', N'167/4 Lê Văn Khương', N'L01, L02, L03, L04, X01, X02, X03, X04', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[CSMS_Branch] ([Id], [ShortName], [Name], [Description], [Location], [OpenTime], [CloseTime], [Enabled], [Add_Country], [Add_Province], [Add_District], [Add_Ward], [Add_Detail], [Tables], [SpaceFee], [InternetFee], [Deleted]) VALUES (3, N'CN003', N'Panda Trần Duy Hưng', NULL, N'10.772291137524276 | 106.69990150793458', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1, NULL, N'Hồ Chí Minh', N'Quận 1', N'Phạm Ngũ Lão', N'98 Trần Duy Hưng', N'F11, F12, F13, F14, F15, F16, F21, F22, F23, F24, F25, F26', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[CSMS_Branch] ([Id], [ShortName], [Name], [Description], [Location], [OpenTime], [CloseTime], [Enabled], [Add_Country], [Add_Province], [Add_District], [Add_Ward], [Add_Detail], [Tables], [SpaceFee], [InternetFee], [Deleted]) VALUES (4, N'CN004', N'Panda Trường Chinh', NULL, N'10.83516060050746 | 106.61948204040527', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1, NULL, N'Hồ Chí Minh', N'Tân Bình', N'Phường 8', N'165 Trường Chinh', N'01, 02, 03, 04, 05, 06, 07, 08, 09, 10', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[CSMS_Branch] ([Id], [ShortName], [Name], [Description], [Location], [OpenTime], [CloseTime], [Enabled], [Add_Country], [Add_Province], [Add_District], [Add_Ward], [Add_Detail], [Tables], [SpaceFee], [InternetFee], [Deleted]) VALUES (5, N'CN005', N'Panda Hàng Xanh', NULL, N'10.802112683619944 | 106.7136465979004', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1, NULL, N'Hồ Chí Minh', N'Bình Thạnh', N'Phường 21', N'02 Hàng Xanh', N'AB1, AB2, AB3, AB4, AB5, AB6, BB1, BB2, BB3, BB4', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[CSMS_Branch] ([Id], [ShortName], [Name], [Description], [Location], [OpenTime], [CloseTime], [Enabled], [Add_Country], [Add_Province], [Add_District], [Add_Ward], [Add_Detail], [Tables], [SpaceFee], [InternetFee], [Deleted]) VALUES (6, N'CN006', N'Panda Aeon Tân Phú', NULL, N'10.801396346040203 | 106.6171646118164', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), 1, NULL, N'Hồ Chí Minh', N'Tân Phú', N'Tân Quý', N'Floor 2 Aeon Mall Building', N'01, 02, 03, 04, 05, 06, 07, 08, 09, 10', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[CSMS_Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Branch_PhoneNumber] ON 

INSERT [dbo].[CSMS_Branch_PhoneNumber] ([Id], [BranchId], [PhoneNumber]) VALUES (3, 1, N'0897844576')
SET IDENTITY_INSERT [dbo].[CSMS_Branch_PhoneNumber] OFF
GO
ALTER TABLE [dbo].[CSMS_Branch] ADD  CONSTRAINT [DF_CSMS_Branch_SpaceFee]  DEFAULT ((0)) FOR [SpaceFee]
GO
ALTER TABLE [dbo].[CSMS_Branch] ADD  CONSTRAINT [DF_CSMS_Branch_InternetFee]  DEFAULT ((0)) FOR [InternetFee]
GO
ALTER TABLE [dbo].[CSMS_Branch] ADD  CONSTRAINT [DF_CSMS_Branch_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CSMS_Branch_PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Branch_PhoneNumber_CSMS_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CSMS_Branch] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Branch_PhoneNumber] CHECK CONSTRAINT [FK_CSMS_Branch_PhoneNumber_CSMS_Branch]
GO
USE [master]
GO
ALTER DATABASE [CSMS.DB.System] SET  READ_WRITE 
GO
