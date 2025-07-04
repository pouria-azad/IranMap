USE [master]
GO
/****** Object:  Database [IranMapDB]    Script Date: 08/04/1404 11:22:23 ******/
CREATE DATABASE [IranMapDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IranMapDB', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IranMapDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IranMapDB_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IranMapDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IranMapDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IranMapDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IranMapDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IranMapDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IranMapDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IranMapDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IranMapDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IranMapDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IranMapDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IranMapDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IranMapDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IranMapDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IranMapDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IranMapDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IranMapDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IranMapDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IranMapDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IranMapDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IranMapDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IranMapDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IranMapDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IranMapDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IranMapDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [IranMapDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IranMapDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IranMapDB] SET  MULTI_USER 
GO
ALTER DATABASE [IranMapDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IranMapDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IranMapDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IranMapDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IranMapDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IranMapDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IranMapDB', N'ON'
GO
ALTER DATABASE [IranMapDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [IranMapDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IranMapDB]
GO
/****** Object:  User [pouria]    Script Date: 08/04/1404 11:22:23 ******/
CREATE USER [pouria] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08/04/1404 11:22:23 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counties]    Script Date: 08/04/1404 11:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counties](
	[CountyId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceCode] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Population] [int] NOT NULL,
	[Area] [float] NOT NULL,
 CONSTRAINT [PK_Counties] PRIMARY KEY CLUSTERED 
(
	[CountyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 08/04/1404 11:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[ProvinceCode] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Capital] [nvarchar](max) NOT NULL,
	[Population] [int] NOT NULL,
	[Area] [float] NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[ProvinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvinceStats]    Script Date: 08/04/1404 11:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvinceStats](
	[ProvinceCode] [int] NOT NULL,
	[Population] [int] NULL,
	[UnemploymentRate] [float] NULL,
	[GDP] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250507131814_InitialCreate', N'9.0.4')
GO
SET IDENTITY_INSERT [dbo].[Counties] ON 

INSERT [dbo].[Counties] ([CountyId], [ProvinceCode], [Name], [Population], [Area]) VALUES (1, N'23', N'ری', 349700, 229.6)
INSERT [dbo].[Counties] ([CountyId], [ProvinceCode], [Name], [Population], [Area]) VALUES (2, N'09', N'نیشابور', 451780, 7499)
INSERT [dbo].[Counties] ([CountyId], [ProvinceCode], [Name], [Population], [Area]) VALUES (3, N'07', N'مرودشت', 323851, 4649)
SET IDENTITY_INSERT [dbo].[Counties] OFF
GO
INSERT [dbo].[Provinces] ([ProvinceCode], [Name], [Capital], [Population], [Area]) VALUES (N'07', N'فارس', N'شیراز', 4851274, 122608)
INSERT [dbo].[Provinces] ([ProvinceCode], [Name], [Capital], [Population], [Area]) VALUES (N'09', N'خراسان رضوی', N'مشهد', 6433501, 118851)
INSERT [dbo].[Provinces] ([ProvinceCode], [Name], [Capital], [Population], [Area]) VALUES (N'23', N'تهران', N'تهران', 8792800, 1360.7)
GO
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (1, 1000000, 12.5, CAST(12000.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (2, 800000, 10.2, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (3, 980000, 13.3, CAST(11750.10 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (4, 1000000, 12.5, CAST(12000.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (5, 1000000, 12.5, CAST(12000.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (6, 1000000, 12.5, CAST(12000.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (7, 1000000, 12.5, CAST(12000.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (8, 1000000, 12.5, CAST(12000.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (9, 800000, 10.2, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (10, 1050000, 14.1, CAST(13000.10 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (11, 990000, 11, CAST(11800.80 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (12, 850000, 9.8, CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (13, 1010000, 12.6, CAST(12200.55 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (14, 970000, 13.5, CAST(11750.45 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (15, 930000, 11.7, CAST(11200.00 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (16, 880000, 10.5, CAST(10500.70 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (17, 940000, 12.9, CAST(11300.20 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (18, 960000, 11.3, CAST(11450.80 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (19, 990000, 13.8, CAST(11950.90 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (20, 1020000, 14.4, CAST(12300.30 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (21, 1005000, 12.1, CAST(12000.75 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (22, 890000, 10.6, CAST(10450.40 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (23, 920000, 11.5, CAST(10800.60 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (24, 970000, 13, CAST(11650.80 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (25, 940000, 12.2, CAST(11100.90 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (26, 910000, 11.9, CAST(10900.20 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (27, 880000, 10.7, CAST(10550.30 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (28, 930000, 12.5, CAST(11200.50 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (29, 960000, 11.4, CAST(11400.75 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (30, 940000, 13.1, CAST(11350.60 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (31, 1000000, 12.8, CAST(12100.00 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (32, 990000, 11.7, CAST(11850.40 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (33, 970000, 12, CAST(11600.20 AS Decimal(18, 2)))
INSERT [dbo].[ProvinceStats] ([ProvinceCode], [Population], [UnemploymentRate], [GDP]) VALUES (34, 980000, 13.3, CAST(11750.10 AS Decimal(18, 2)))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Counties_ProvinceCode]    Script Date: 08/04/1404 11:22:23 ******/
CREATE NONCLUSTERED INDEX [IX_Counties_ProvinceCode] ON [dbo].[Counties]
(
	[ProvinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Counties]  WITH CHECK ADD  CONSTRAINT [FK_Counties_Provinces_ProvinceCode] FOREIGN KEY([ProvinceCode])
REFERENCES [dbo].[Provinces] ([ProvinceCode])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Counties] CHECK CONSTRAINT [FK_Counties_Provinces_ProvinceCode]
GO
USE [master]
GO
ALTER DATABASE [IranMapDB] SET  READ_WRITE 
GO
