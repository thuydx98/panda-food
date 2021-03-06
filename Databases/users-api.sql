USE [master]
GO
/****** Object:  Database [CSMS.DB.Users]    Script Date: 7/18/2020 10:35:29 PM ******/
ALTER DATABASE [CSMS.DB.Users] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS.DB.Users].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS.DB.Users] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS.DB.Users] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS.DB.Users] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS.DB.Users] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS.DB.Users] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS.DB.Users] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS.DB.Users] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSMS.DB.Users] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSMS.DB.Users] SET QUERY_STORE = OFF
GO
USE [CSMS.DB.Users]
GO
/****** Object:  Table [dbo].[CSMS_Log_User_Status]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Log_User_Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CSMS_User_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Permission]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Permission] [varchar](50) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CSMS_Permisison] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Role]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](200) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CSMS_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Status]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[IsBlockAccess] [bit] NULL,
 CONSTRAINT [PK_CSMS_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_User]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [nvarchar](50) NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[CitizenID] [varchar](20) NULL,
	[Gender] [varchar](20) NULL,
	[Birthday] [datetime] NULL,
	[Email] [varchar](200) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](200) NULL,
	[Salary] [decimal](10, 2) NOT NULL,
	[BranchId] [int] NULL,
	[RoleId] [int] NULL,
	[StatusId] [int] NULL,
	[Deleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CSMS_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_User_Address]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_User_Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Receiver] [nvarchar](200) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](100) NOT NULL,
	[District] [nvarchar](100) NOT NULL,
	[Ward] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](200) NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_CSMS_User_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_User_Other_Permission]    Script Date: 7/18/2020 10:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_User_Other_Permission](
	[UserId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_User_Other_Permission_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CSMS_Log_User_Status] ON 

INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (10, 1, 1, CAST(N'2020-02-05T00:16:25.010' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (11, 2, 1, CAST(N'2020-02-05T00:16:25.607' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (12, 5, 1, CAST(N'2020-02-05T00:16:26.083' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (13, 6, 1, CAST(N'2020-02-05T00:16:26.580' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (14, 7, 1, CAST(N'2020-02-05T00:16:27.107' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (15, 8, 1, CAST(N'2020-02-05T00:16:27.627' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (16, 9, 1, CAST(N'2020-02-05T00:16:28.113' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (17, 10, 1, CAST(N'2020-02-05T00:16:28.620' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (18, 11, 1, CAST(N'2020-02-05T00:16:29.147' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (19, 12, 1, CAST(N'2020-02-05T00:16:29.670' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (20, 13, 1, CAST(N'2020-02-05T00:16:30.170' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (21, 14, 1, CAST(N'2020-02-05T00:16:30.690' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (22, 15, 1, CAST(N'2020-02-05T00:16:31.193' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (23, 16, 1, CAST(N'2020-02-05T00:16:31.703' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (24, 17, 1, CAST(N'2020-02-05T00:16:32.220' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (25, 18, 1, CAST(N'2020-02-05T00:16:32.793' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (26, 19, 1, CAST(N'2020-02-05T00:16:33.303' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (27, 20, 1, CAST(N'2020-02-05T00:16:33.790' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (28, 21, 1, CAST(N'2020-02-05T00:16:34.290' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (29, 22, 1, CAST(N'2020-02-05T00:16:34.787' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (30, 23, 1, CAST(N'2020-02-05T00:16:35.280' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (31, 24, 1, CAST(N'2020-02-05T00:16:35.777' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (32, 25, 1, CAST(N'2020-02-05T00:16:36.317' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (33, 26, 1, CAST(N'2020-02-05T00:16:36.800' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (34, 27, 1, CAST(N'2020-02-05T00:16:37.297' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (35, 28, 1, CAST(N'2020-02-05T00:16:37.813' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (36, 29, 1, CAST(N'2020-02-05T00:16:38.343' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (37, 30, 1, CAST(N'2020-02-05T00:16:38.870' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (38, 31, 1, CAST(N'2020-02-05T00:16:39.380' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (39, 32, 1, CAST(N'2020-02-05T00:16:39.907' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (40, 1, 3, CAST(N'2020-02-05T16:03:31.950' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (41, 1, 1, CAST(N'2020-02-05T16:24:49.900' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (42, 2, 3, CAST(N'2020-02-05T23:31:13.510' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (43, 5, 2, CAST(N'2020-02-05T23:31:15.553' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (44, 2, 1, CAST(N'2020-02-05T23:31:28.160' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (45, 5, 1, CAST(N'2020-02-05T23:31:32.363' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (46, 33, 1, CAST(N'2020-02-07T22:34:48.567' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (47, 34, 1, CAST(N'2020-02-07T22:34:50.090' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (48, 35, 1, CAST(N'2020-02-07T22:34:51.147' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (49, 36, 1, CAST(N'2020-02-07T22:34:52.143' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (50, 37, 1, CAST(N'2020-02-07T22:34:53.220' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (51, 38, 1, CAST(N'2020-02-07T22:34:54.163' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (52, 39, 1, CAST(N'2020-02-07T22:34:55.083' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (53, 40, 1, CAST(N'2020-02-07T22:34:56.423' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (54, 41, 1, CAST(N'2020-02-07T22:34:57.187' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (55, 42, 1, CAST(N'2020-02-07T22:34:57.953' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (56, 43, 1, CAST(N'2020-02-07T22:34:58.640' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (57, 44, 1, CAST(N'2020-02-07T22:34:59.373' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (58, 45, 1, CAST(N'2020-02-07T22:35:00.190' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (59, 46, 1, CAST(N'2020-02-07T22:35:01.483' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (60, 47, 1, CAST(N'2020-02-07T22:35:01.590' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (61, 48, 1, CAST(N'2020-02-07T22:35:02.250' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (62, 49, 1, CAST(N'2020-02-07T22:35:02.913' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (63, 50, 1, CAST(N'2020-02-07T22:35:03.553' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (64, 51, 1, CAST(N'2020-02-07T22:35:04.260' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (65, 52, 1, CAST(N'2020-02-07T22:35:04.947' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (66, 53, 1, CAST(N'2020-02-07T22:35:05.610' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (67, 54, 1, CAST(N'2020-02-07T22:35:06.327' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (68, 55, 1, CAST(N'2020-02-07T22:35:07.033' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (69, 56, 1, CAST(N'2020-02-07T22:35:07.777' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (70, 57, 1, CAST(N'2020-02-07T22:35:08.480' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (71, 58, 1, CAST(N'2020-02-07T22:35:09.243' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (72, 59, 1, CAST(N'2020-02-07T22:35:09.950' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (73, 60, 1, CAST(N'2020-02-07T22:35:10.843' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (74, 61, 1, CAST(N'2020-02-07T22:35:11.610' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (75, 62, 1, CAST(N'2020-02-07T22:35:12.420' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (76, 63, 1, CAST(N'2020-02-07T22:35:13.520' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (77, 64, 1, CAST(N'2020-02-07T22:35:14.360' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (78, 65, 1, CAST(N'2020-02-07T22:35:15.137' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (79, 66, 1, CAST(N'2020-02-07T22:35:15.990' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (80, 67, 1, CAST(N'2020-02-07T22:35:16.733' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (81, 68, 1, CAST(N'2020-02-07T22:35:17.540' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (82, 69, 1, CAST(N'2020-02-07T22:35:18.400' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (83, 70, 1, CAST(N'2020-02-07T22:35:19.177' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (84, 71, 1, CAST(N'2020-02-07T22:35:19.917' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (85, 72, 1, CAST(N'2020-02-07T22:35:20.720' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (86, 73, 1, CAST(N'2020-02-07T22:35:21.537' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (87, 74, 1, CAST(N'2020-02-07T22:35:22.260' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (88, 75, 1, CAST(N'2020-02-07T22:35:22.933' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (89, 76, 1, CAST(N'2020-02-07T22:35:23.740' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (90, 77, 1, CAST(N'2020-02-07T22:35:24.727' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (91, 78, 1, CAST(N'2020-02-07T22:35:26.020' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (92, 79, 1, CAST(N'2020-02-07T22:35:27.323' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (93, 80, 1, CAST(N'2020-02-07T22:35:28.080' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (94, 81, 1, CAST(N'2020-02-07T22:35:28.817' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (95, 82, 1, CAST(N'2020-02-07T22:35:29.597' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (96, 83, 1, CAST(N'2020-02-07T22:35:30.443' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (97, 84, 1, CAST(N'2020-02-07T22:35:30.847' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (98, 85, 1, CAST(N'2020-02-07T22:35:30.990' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (99, 86, 1, CAST(N'2020-02-07T22:35:31.143' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (100, 87, 1, CAST(N'2020-02-07T22:35:32.007' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (101, 88, 1, CAST(N'2020-02-07T22:35:32.160' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (102, 89, 1, CAST(N'2020-02-07T22:35:32.947' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (103, 90, 1, CAST(N'2020-02-07T22:35:46.070' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (104, 91, 1, CAST(N'2020-02-07T22:35:47.653' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (105, 92, 1, CAST(N'2020-02-07T22:35:48.700' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (106, 93, 1, CAST(N'2020-02-07T22:35:49.610' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (107, 94, 1, CAST(N'2020-02-07T22:35:50.407' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (108, 95, 1, CAST(N'2020-02-07T22:35:51.233' AS DateTime))
GO
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (109, 96, 1, CAST(N'2020-02-07T22:35:52.097' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (110, 97, 1, CAST(N'2020-02-07T22:35:53.070' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (111, 98, 1, CAST(N'2020-02-07T22:35:53.940' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (112, 99, 1, CAST(N'2020-02-07T22:35:55.963' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (113, 100, 1, CAST(N'2020-02-07T22:35:57.083' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (114, 101, 1, CAST(N'2020-02-07T22:35:58.097' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (115, 102, 1, CAST(N'2020-02-07T22:35:59.180' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (131, 103, 1, CAST(N'2020-02-07T22:35:59.180' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (132, 104, 1, CAST(N'2020-02-07T22:35:59.180' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (135, 113, 1, CAST(N'2020-02-19T17:56:27.920' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (136, 2, 2, CAST(N'2020-02-20T15:52:34.163' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (137, 2, 3, CAST(N'2020-02-20T15:52:46.870' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (138, 2, 1, CAST(N'2020-02-20T15:52:57.057' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (139, 32, 3, CAST(N'2020-02-20T22:30:18.640' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (140, 114, 1, CAST(N'2020-02-20T22:57:07.980' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (141, 115, 1, CAST(N'2020-02-20T23:00:17.730' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (142, 116, 1, CAST(N'2020-03-20T23:34:13.300' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (150, 124, 1, CAST(N'2020-04-05T20:39:15.860' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (151, 125, 1, CAST(N'2020-04-05T20:46:09.377' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (152, 126, 1, CAST(N'2020-04-05T21:06:44.113' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (153, 127, 1, CAST(N'2020-04-05T21:45:19.967' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (154, 128, 1, CAST(N'2020-04-23T14:32:56.690' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (155, 129, 1, CAST(N'2020-04-29T09:29:22.077' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (156, 130, 1, CAST(N'2020-06-05T21:43:18.303' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (157, 131, 1, CAST(N'2020-06-05T21:44:31.717' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (158, 132, 1, CAST(N'2020-06-20T10:23:15.320' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (159, 133, 1, CAST(N'2020-06-26T00:53:13.090' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (160, 99, 3, CAST(N'2020-07-02T01:12:10.157' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (161, 134, 1, CAST(N'2020-07-02T01:16:26.520' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (162, 135, 1, CAST(N'2020-07-08T11:28:28.907' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (163, 136, 1, CAST(N'2020-07-08T13:33:55.503' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (164, 141, 1, CAST(N'2020-07-08T21:33:48.357' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (165, 142, 1, CAST(N'2020-07-08T21:34:58.060' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (166, 143, 1, CAST(N'2020-07-08T21:35:40.167' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (167, 144, 1, CAST(N'2020-07-08T21:36:43.047' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (168, 145, 1, CAST(N'2020-07-08T21:37:00.313' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (169, 146, 1, CAST(N'2020-07-08T21:48:54.223' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (170, 147, 1, CAST(N'2020-07-08T22:04:06.897' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (171, 148, 1, CAST(N'2020-07-13T20:37:13.640' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (172, 149, 1, CAST(N'2020-07-15T21:07:24.143' AS DateTime))
SET IDENTITY_INSERT [dbo].[CSMS_Log_User_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Role] ON 

INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (1, N'CUSTOMER', N'Customer')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (2, N'ADMIN', N'Admin')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (3, N'SALE', N'Sale')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (4, N'WAITER', N'Waiter')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (5, N'SHIPPER', N'Shipper')
SET IDENTITY_INSERT [dbo].[CSMS_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_Status] ON 

INSERT [dbo].[CSMS_Status] ([Id], [Status], [IsBlockAccess]) VALUES (1, N'Working', 0)
INSERT [dbo].[CSMS_Status] ([Id], [Status], [IsBlockAccess]) VALUES (2, N'Terminated', 1)
INSERT [dbo].[CSMS_Status] ([Id], [Status], [IsBlockAccess]) VALUES (3, N'Blocked', 1)
SET IDENTITY_INSERT [dbo].[CSMS_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_User] ON 

INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (1, N'0001', N'Thủy', N'Đào', N'Xuân', N'251125147', N'Male', CAST(N'1998-05-09T00:00:00.000' AS DateTime), N'thuydx.9598@gmail.com', N'0979319598', N'admin', N'$2a$10$wEfXCchqpbML1zysqGAyI./bbzN8lgxTriJFlVgJBNnIFWoPW3QKy', CAST(10.00 AS Decimal(10, 2)), NULL, 2, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-03T00:39:57.430' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (2, N'0002', N'Minh', N'Tran', N'Van', N'222322323', N'Male', CAST(N'2004-04-01T00:00:00.000' AS DateTime), N'minhtran@gmail.com', N'9785464', N'minhtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T00:01:44.747' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (5, N'0003', N'David', N'Mike', N'', N'222322323', N'Male', CAST(N'2010-12-08T00:00:00.000' AS DateTime), N'david@gmail.com', N'9785467', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(3000000.00 AS Decimal(10, 2)), 1, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T00:04:52.907' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (6, N'0004', N'Hoàng', N'Đào', N'Xuân', N'222322323', N'Male', CAST(N'1999-09-19T00:00:00.000' AS DateTime), N'hoangdao@gmail.com', N'0928373811', N'hoangdao', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (7, N'0005', N'I am', N'Sale', N'', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran7@gmail.com', N'9785469', N'sale', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T00:12:16.450' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (8, NULL, N'Thanh', N'Lê', N'Thị Kim', NULL, N'Female', CAST(N'1999-04-07T00:00:00.000' AS DateTime), N'lekiimthanh@gmail.com', N'0352456377', NULL, N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-03-22T01:24:07.620' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (9, N'0007', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran9@gmail.com', N'9785471', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (10, N'0008', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran10@gmail.com', N'9785472', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(4500000.00 AS Decimal(10, 2)), 1, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T00:13:26.640' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (11, N'0009', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran11@gmail.com', N'9785473', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (12, N'0010', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran12@gmail.com', N'9785474', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (13, N'0011', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'2011-12-12T00:00:00.000' AS DateTime), N'luongtran13@gmail.com', N'9785475', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (14, N'0012', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran14@gmail.com', N'9785476', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (15, N'0013', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran15@gmail.com', N'9785477', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (16, N'0014', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran16@gmail.com', N'9785478', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 3, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (17, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran17@gmail.com', N'9785479', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 4, 2, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (18, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi18@gmail.com', N'9562343', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T00:12:41.567' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (19, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi19@gmail.com', N'9562344', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (20, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi20@gmail.com', N'9562345', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (21, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi21@gmail.com', N'9562346', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (22, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi22@gmail.com', N'9562347', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (23, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi23@gmail.com', N'9562348', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (24, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi24@gmail.com', N'9562349', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (25, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi25@gmail.com', N'9562350', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (26, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi26@gmail.com', N'9562351', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (27, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi27@gmail.com', N'9562352', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (28, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi28@gmail.com', N'9562353', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (29, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi29@gmail.com', N'9562354', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (30, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi30@gmail.com', N'9562355', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (31, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi31@gmail.com', N'9562356', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (32, N'', N'Hòa', N'Nguyễn', N'', N'242387487', N'Male', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'hoanguyen@gmail.com', N'0123823482', N'hoanguyen', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 3, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (33, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran33@gmail.com', N'9785495', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (34, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran34@gmail.com', N'9785496', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (35, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran35@gmail.com', N'9785497', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (36, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran36@gmail.com', N'9785498', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (37, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran37@gmail.com', N'9785499', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (38, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran38@gmail.com', N'9785500', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (39, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran39@gmail.com', N'9785501', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (40, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran40@gmail.com', N'9785502', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (41, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran41@gmail.com', N'9785503', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (42, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran42@gmail.com', N'9785504', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (43, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran43@gmail.com', N'9785505', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (44, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran44@gmail.com', N'9785506', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (45, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran45@gmail.com', N'9785507', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (46, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran46@gmail.com', N'9785508', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (47, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran47@gmail.com', N'9785509', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (48, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran48@gmail.com', N'9785510', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (49, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran49@gmail.com', N'9785511', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (50, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran50@gmail.com', N'9785512', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (51, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran51@gmail.com', N'9785513', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (52, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran52@gmail.com', N'9785514', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (53, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran53@gmail.com', N'9785515', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (54, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran54@gmail.com', N'9785516', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (55, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran55@gmail.com', N'9785517', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (56, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran56@gmail.com', N'9785518', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (57, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran57@gmail.com', N'9785519', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (58, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran58@gmail.com', N'9785520', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (59, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran59@gmail.com', N'9785521', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (60, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran60@gmail.com', N'9785522', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (61, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran61@gmail.com', N'9785523', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (62, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran62@gmail.com', N'9785524', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (63, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran63@gmail.com', N'9785525', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (64, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran64@gmail.com', N'9785526', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (65, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran65@gmail.com', N'9785527', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (66, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran66@gmail.com', N'9785528', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (67, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran67@gmail.com', N'9785529', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (68, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran68@gmail.com', N'9785530', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (69, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran69@gmail.com', N'9785531', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (70, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran70@gmail.com', N'9785532', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (71, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran71@gmail.com', N'9785533', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (72, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran72@gmail.com', N'9785534', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (73, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran73@gmail.com', N'9785535', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (74, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran74@gmail.com', N'9785536', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (75, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran75@gmail.com', N'9785537', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (76, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran76@gmail.com', N'9785538', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (77, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran77@gmail.com', N'9785539', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (78, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran78@gmail.com', N'9785540', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (79, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran79@gmail.com', N'9785541', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (80, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran80@gmail.com', N'9785542', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (81, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran81@gmail.com', N'9785543', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (82, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran82@gmail.com', N'9785544', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (83, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran83@gmail.com', N'9785545', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (84, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran84@gmail.com', N'9785546', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (85, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran85@gmail.com', N'9785547', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (86, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran86@gmail.com', N'9785548', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (87, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran87@gmail.com', N'9785549', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (88, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran88@gmail.com', N'9785550', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (89, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran89@gmail.com', N'9785551', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (90, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran90@gmail.com', N'9785552', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (91, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran91@gmail.com', N'9785553', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (92, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran92@gmail.com', N'9785554', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (93, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran93@gmail.com', N'9785555', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (94, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran94@gmail.com', N'9785556', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 1, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (95, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran95@gmail.com', N'9785557', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (96, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran96@gmail.com', N'9785558', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (97, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran97@gmail.com', N'9785559', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (98, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran98@gmail.com', N'9785560', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (99, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran99@gmail.com', N'9785561', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(3000000.00 AS Decimal(10, 2)), 1, 3, 3, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T01:12:10.153' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (100, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran100@gmail.com', N'9785562', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (101, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran101@gmail.com', N'9785563', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 3, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (102, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran102@gmail.com', N'9785564', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 4, 3, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (103, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran103@gmail.com', N'9785565', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 5, 4, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (104, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran104@gmail.com', N'9785566', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(1000000.00 AS Decimal(10, 2)), 1, 5, 1, 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-07-02T00:59:31.740' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (113, N'0092', N'test', N'test', NULL, NULL, N'Male', CAST(N'2020-02-18T00:00:00.000' AS DateTime), NULL, NULL, N'test', N'$2a$10$NFMI6v5LCuq2jcJn/mhwoO9u3ZTJpqabr1nBP0fSDmnRIUA3hQCnS', CAST(0.00 AS Decimal(10, 2)), 2, 5, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-03-24T00:00:14.813' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (114, NULL, N'Nam', N'Phan', N'Thanh', N'282348', N'Male', CAST(N'2016-03-10T00:00:00.000' AS DateTime), N'phannamyoyo@gmail.com', N'012392348234', N'namphan', N'$2a$10$k.5ym/OFuFMVkwHTLdRVi.nCrakix4qoPD2ohPHDyConUes5RbMUC', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2020-03-24T00:00:20.217' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (115, NULL, N'Thiện', N'Nguyễn', N'Út', N'2932949', N'Male', CAST(N'2020-02-05T00:00:00.000' AS DateTime), N'nguyenthien113@gmail.com', N'02923892838', N'thiennguyen', N'$2a$10$60jcKvL978kEB/RzXdQLueHH5/vCBCb340KXsbwIoW.EZ8P1aFJRG', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2019-12-11T00:00:00.000' AS DateTime), CAST(N'2020-03-24T00:00:23.793' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (116, NULL, N'Ngô', N'An', N'Công', NULL, N'Male', CAST(N'1997-11-02T00:00:00.000' AS DateTime), N'annc0211@gmail.com', N'0987654321', N'test', N'$2a$10$Ey38Nno2d1JqFUhNxdxtWeGN5lgC837TmzEyWZ5CjnXCMLY1XoOxe', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-03-20T23:34:13.300' AS DateTime), CAST(N'2020-07-15T21:53:08.557' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (124, NULL, N'Ngô', N'An', N'Công', NULL, N'1', CAST(N'1998-11-03T00:00:00.000' AS DateTime), N'annc21198@gmail.com', N'01282408251', NULL, N'$2a$10$5NRTezh2IFdfc9a3F.Qy2O/vD1IPoXIm8GoZAlSlIG7bU.W/qbICq', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-04-05T20:39:15.857' AS DateTime), CAST(N'2020-07-08T11:08:05.413' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (125, NULL, N'a', N'c', N'b', NULL, N'1', CAST(N'2020-04-05T17:00:00.000' AS DateTime), N'annc121198@gmail.com', N'078240825112', NULL, N'$2a$10$jDB6cy5NDSqi5Phx0eiqJOnFVfU0ZLsy1YZv5/Fc2CP6G7mPRUhPe', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-04-05T20:46:09.377' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (126, NULL, N'a', N'c', N'b', NULL, N'1', CAST(N'2020-04-05T17:00:00.000' AS DateTime), N'annc1121198@gmail.com', N'0782408251121', NULL, N'$2a$10$u5H7A01CBbnUY5JXLx14g.sxB1OcQaICI5pTnFMLPMFHiQjjefwGy', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-04-05T21:06:44.113' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (127, NULL, N'a', N'c', N'b', NULL, N'1', CAST(N'2020-04-21T17:00:00.000' AS DateTime), N'annc2121198@gmail.com', N'123123123', NULL, N'$2a$10$dBHHAII0sY8EN2Clag4xUezNGcAAvRBdusDS1W7TVLPo5.GeDQAAW', CAST(0.00 AS Decimal(10, 2)), NULL, 2, 1, 0, CAST(N'2020-04-05T21:45:19.967' AS DateTime), CAST(N'2020-04-29T09:38:56.413' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (128, NULL, N'Ngo', N'An', N'Cong', N'123412123', N'Male', CAST(N'1998-11-02T00:00:00.000' AS DateTime), N'annc021198@gmail.com', N'07824082511', N'anngo', N'123456', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-04-23T14:32:56.690' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (129, NULL, N'An', N'Ngo', N'Cong', N'123123123', N'Male', CAST(N'1998-11-02T00:00:00.000' AS DateTime), N'annc@gmail.com', N'0782408251', N'anngo0211', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', CAST(0.00 AS Decimal(10, 2)), 2, 2, 1, 0, CAST(N'2020-04-29T09:29:22.077' AS DateTime), CAST(N'2020-04-29T09:35:47.487' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (130, NULL, N'a', N'c', N'b', NULL, N'Male', CAST(N'1998-06-05T00:00:00.000' AS DateTime), N'aibiet@gmail.com', N'123123123123', N'aibietgidau', N'$2a$10$LotXbsZVwZbSRguXuzhWOe3joAeJeDlNLC39h5RAEglRGhI.yBTau', CAST(0.00 AS Decimal(10, 2)), 2, 3, 1, 0, CAST(N'2020-06-05T21:43:18.300' AS DateTime), CAST(N'2020-06-26T08:45:31.020' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (131, NULL, N'Ngô', N'An', N'Công', NULL, N'Male', CAST(N'2020-05-27T00:00:00.000' AS DateTime), N'aibietgidau1@gmail.com', N'12312312312', N'aibietgidau1', N'$2a$10$OFOmISm6jCJuxML/7fLKseY3fyzTx0m/jMfx9v5NQ/PhFYB9fZJNq', CAST(0.00 AS Decimal(10, 2)), 3, 3, 1, 0, CAST(N'2020-06-05T21:44:31.537' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (132, NULL, N'An', N'Ngo', N'Cong', NULL, N'Male', CAST(N'2019-11-02T00:00:00.000' AS DateTime), N'annc0211567@gmail.com', N'0987654320', NULL, N'$2a$10$2QYEqm4jhoFzPZR54zwNmONU4bRyhN82uCO6DAd2oTvTXvAxYUp6i', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-06-20T10:23:15.300' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (133, NULL, N'An', N'Ngo', N'Cong', NULL, N'Male', CAST(N'2019-11-02T00:00:00.000' AS DateTime), N'annc021111@gmail.com', N'09876543211', NULL, N'$2a$10$bfwceSnft2miuSs4QGTbSOdMk5WNA2TnsgHIw3HA9YjrhFVW/tUai', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-06-26T00:53:13.077' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (134, N'U221', N'I''m', N'Sale 1', N'', N'12321312312', N'Male', CAST(N'2020-07-08T00:00:00.000' AS DateTime), N'sale1@gmail.com', N'012939123213', N'sale1', N'$2a$10$jbfMlEvnRcpHoG5jbBDehuNAhVamCjiXRVqCYrqJxGEqKEnp3V.om', CAST(4000000.00 AS Decimal(10, 2)), 1, 3, 1, 0, CAST(N'2020-07-02T01:16:26.520' AS DateTime), CAST(N'2020-07-02T01:16:44.713' AS DateTime))
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (135, NULL, N'a', N'', N'', NULL, N'', NULL, N'testSocial@gmail.com', N'', NULL, N'$2a$10$lCfQcMCK49tL1RxRIjPPtuOpBkkZsUk99px1VsioHjdR0VZQif5F6', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T11:28:28.893' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (136, NULL, N'testSocial', N'testSocial', N'testSocial', NULL, N'1', CAST(N'2020-07-26T17:00:00.000' AS DateTime), N'testSocial1@gmail.com', N'0231234512', NULL, N'$2a$10$3aM0AEkIlLHKspWJQXFb2uNNKrLLu4dJd040cSKeGzBFPcj6fx/OO', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T13:33:55.490' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (141, NULL, N'Công An', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T21:33:48.327' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (142, NULL, N'Công An', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T21:34:58.060' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (143, NULL, N'Công An', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T21:35:40.167' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (144, NULL, N'An Ngô Công', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T21:36:42.237' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (145, NULL, N'An Ngô Công', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T21:37:00.297' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (146, NULL, N'Công An', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T21:48:54.210' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (147, NULL, N'Công An', N'', N'', NULL, NULL, NULL, N'annc.21198@gmail.com', NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-08T22:04:06.887' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (148, NULL, N'An', N'Ngo', N'Cong', NULL, N'Male', CAST(N'2019-11-02T00:00:00.000' AS DateTime), N'annc0211112@gmail.con', N'0987647372', NULL, N'$2a$10$LbS7IUSEFmERPVXRxyiTKe/ucFj1jB6jYk6H3nZZy615RQ3iCA772', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-13T20:37:13.627' AS DateTime), NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [Salary], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (149, NULL, N'Cong An', N'Ngố', N'Siêu', NULL, N'1', CAST(N'2020-07-19T17:00:00.000' AS DateTime), N'test@gmail.com', N'09812321123', NULL, N'$2a$10$EpwNgLSOsIr5wDw0nQpb7e418Ynxc0E1WIxR5cJyeREpo6mhWrvQu', CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(N'2020-07-15T21:07:24.143' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CSMS_User] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMS_User_Address] ON 

INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (17, 32, N'K’Phon', N'0938 838 282', N'Việt Nam', N'Đắk Lắk', N'Buôn Đôn', N'Krông Na', NULL, 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (24, 1, N'Lê Thanh', N'0366456377', N'Việt Nam', N'Hồ Chí Minh', N'Phú Nhuận', N'Phường 3', N'Gihi', 0)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (27, 1, N'Thủy', N'0979319598', N'Việt Nam', N'Hồ Chí Minh', N'Quận 12', N'Hiệp Thành', N'167/4 Lê Văn Khương', 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (28, 124, N'Ngô Công An', N'0782408251', N'Việt Nam', N'Hồ Chí Minh', N'Bình Thạnh', N'Phường 6', N'Bình Lợi', 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (37, 136, N'an', N'123123123123', N'Việt Nam', N'Đắk Nông', N'Tuy Đức', N'Đắk Ngo', N'asdasd', 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (38, 1, N'Thủy', N'0979319598', N'Việt Nam', N'Hồ Chí Minh', N'Thủ Đức', N'Linh Chiểu', N'10 Võ Văn Ngân', 0)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (40, 148, N'an', N'0782408251', N'Việt Nam', N'Hồ Chí Minh', N'Tân Bình', N'Phường 3', N'165 Trường Chinh', 0)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (41, 130, N'an', N'123123123', N'Việt Nam', N'Hồ Chí Minh', N'Tân Bình', N'Phường 1', N'Trường Chinh', 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (42, 148, N'An', N'0782408251', N'Việt Nam', N'Hồ Chí Minh', N'Quận 12', N'Hiệp Thành', N'Đường 30', 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (43, 116, N'An', N'0782408251', N'Việt Nam', N'Hồ Chí Minh', N'Thủ Đức', N'Linh Chiểu', N'Số 1', 1)
SET IDENTITY_INSERT [dbo].[CSMS_User_Address] OFF
GO
ALTER TABLE [dbo].[CSMS_User] ADD  CONSTRAINT [DF_CSMS_User_Salary]  DEFAULT ((0)) FOR [Salary]
GO
ALTER TABLE [dbo].[CSMS_User] ADD  CONSTRAINT [DF_CSMS_User_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CSMS_User] ADD  CONSTRAINT [DF_CSMS_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[CSMS_Status] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status] CHECK CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_Status]
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CSMS_User] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status] CHECK CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_User]
GO
ALTER TABLE [dbo].[CSMS_Permission]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Permisison_CSMS_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[CSMS_Role] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Permission] CHECK CONSTRAINT [FK_CSMS_Permisison_CSMS_Role]
GO
ALTER TABLE [dbo].[CSMS_User]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_CSMS_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[CSMS_Role] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User] CHECK CONSTRAINT [FK_CSMS_User_CSMS_Role]
GO
ALTER TABLE [dbo].[CSMS_User]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_CSMS_Status_Custom] FOREIGN KEY([StatusId])
REFERENCES [dbo].[CSMS_Status] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User] CHECK CONSTRAINT [FK_CSMS_User_CSMS_Status_Custom]
GO
ALTER TABLE [dbo].[CSMS_User_Address]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_Address_CSMS_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CSMS_User] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User_Address] CHECK CONSTRAINT [FK_CSMS_User_Address_CSMS_User]
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_Permisison] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[CSMS_Permission] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission] CHECK CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_Permisison]
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CSMS_User] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission] CHECK CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_User]
GO
/****** Object:  Trigger [dbo].[Csms_User.AfterInsertUpdateTrigger]    Script Date: 7/18/2020 10:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Csms_User.AfterInsertUpdateTrigger] ON [dbo].[CSMS_User]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @user_id int;
	DECLARE @old_status int;
	DECLARE @new_status int;

	SELECT @user_id = i.Id, @new_status = i.StatusId FROM inserted i;

	IF NOT EXISTS(SELECT * FROM DELETED)
    BEGIN  -- Insert
		UPDATE CSMS_User
		SET StatusId = 1, CreateDate = GETDATE()
		WHERE Id = @user_id

		INSERT INTO CSMS_Log_User_Status (UserId, StatusId, ModifiedDate)
		VALUES (@user_id, 1, GETDATE())
    END
	ELSE  -- Update
	BEGIN
		UPDATE CSMS_User
		SET UpdateDate = GETDATE()
		WHERE Id = @user_id

		SELECT @old_status = i.StatusId FROM deleted i;
		IF @old_status != @new_status
		BEGIN
			INSERT INTO CSMS_Log_User_Status (UserId, StatusId, ModifiedDate)
			VALUES (@user_id, @new_status, GETDATE())
		END
	END
END
GO
ALTER TABLE [dbo].[CSMS_User] ENABLE TRIGGER [Csms_User.AfterInsertUpdateTrigger]
GO
/****** Object:  Trigger [dbo].[Csms_User_Address.AfterInsertTrigger]    Script Date: 7/18/2020 10:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Csms_User_Address.AfterInsertTrigger] ON [dbo].[CSMS_User_Address]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @address_id int;
	DECLARE @user_id int;
	DECLARE @count int;
	DECLARE @new_is_default_value bit;

	SELECT @address_id = i.Id, @user_id = i.UserId, @new_is_default_value = i.IsDefault FROM inserted i;
	SELECT @count = COUNT(*) FROM CSMS_User_Address i WHERE i.UserId = @user_id;

	IF @count = 1
    BEGIN
		UPDATE CSMS_User_Address
		SET IsDefault = 1
		WHERE Id = @address_id
    END

	IF @count != 1 AND @new_is_default_value = 1
	BEGIN
		UPDATE CSMS_User_Address
		SET IsDefault = 0
		WHERE Id != @address_id AND UserId = @user_id
	END
END
GO
ALTER TABLE [dbo].[CSMS_User_Address] ENABLE TRIGGER [Csms_User_Address.AfterInsertTrigger]
GO
USE [master]
GO
ALTER DATABASE [CSMS.DB.Users] SET  READ_WRITE 
GO
