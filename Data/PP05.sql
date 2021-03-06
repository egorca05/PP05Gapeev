USE [master]
GO
/****** Object:  Database [PP05Gapeev]    Script Date: 26.06.2022 17:05:05 ******/
CREATE DATABASE [PP05Gapeev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PP05Gapeev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PP05Gapeev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PP05Gapeev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PP05Gapeev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PP05Gapeev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PP05Gapeev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PP05Gapeev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PP05Gapeev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PP05Gapeev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PP05Gapeev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PP05Gapeev] SET ARITHABORT OFF 
GO
ALTER DATABASE [PP05Gapeev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PP05Gapeev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PP05Gapeev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PP05Gapeev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PP05Gapeev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PP05Gapeev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PP05Gapeev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PP05Gapeev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PP05Gapeev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PP05Gapeev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PP05Gapeev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PP05Gapeev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PP05Gapeev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PP05Gapeev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PP05Gapeev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PP05Gapeev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PP05Gapeev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PP05Gapeev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PP05Gapeev] SET  MULTI_USER 
GO
ALTER DATABASE [PP05Gapeev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PP05Gapeev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PP05Gapeev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PP05Gapeev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PP05Gapeev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PP05Gapeev] SET QUERY_STORE = OFF
GO
USE [PP05Gapeev]
GO
/****** Object:  Table [dbo].[Firm]    Script Date: 26.06.2022 17:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firm](
	[IdFirm] [int] IDENTITY(1,1) NOT NULL,
	[NameFirm] [nvarchar](100) NOT NULL,
	[DirectorFirm] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Firm] PRIMARY KEY CLUSTERED 
(
	[IdFirm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Month]    Script Date: 26.06.2022 17:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[IdMonth] [int] IDENTITY(1,1) NOT NULL,
	[NameMonth] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[IdMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 26.06.2022 17:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[IdOperations] [int] IDENTITY(1,1) NOT NULL,
	[IdFirmOperations] [int] NOT NULL,
	[IdMonthOperations] [int] NOT NULL,
	[BuyOperations] [decimal](7, 2) NOT NULL,
	[SaleOperations] [decimal](7, 2) NOT NULL,
	[PurchasedOperations] [int] NOT NULL,
	[SalesOperations] [int] NOT NULL,
	[IncomeOperations]  AS ([SalesOperations]*[SaleOperations]-[PurchasedOperations]*[BuyOperations]),
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[IdOperations] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Firm] ON 

INSERT [dbo].[Firm] ([IdFirm], [NameFirm], [DirectorFirm]) VALUES (1, N'Tinkoff', N'Гапеев Егор')
INSERT [dbo].[Firm] ([IdFirm], [NameFirm], [DirectorFirm]) VALUES (2, N'BetBoom', N'Грибков Кузьма')
SET IDENTITY_INSERT [dbo].[Firm] OFF
GO
SET IDENTITY_INSERT [dbo].[Month] ON 

INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (8, N'Август')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (4, N'Апрель')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (12, N'Декабрь')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (7, N'Июль')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (6, N'Июнь')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (5, N'Май')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (3, N'Март')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (11, N'Ноябрь')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (10, N'Октябрь')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (9, N'Сентябрь')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (2, N'Февраль')
INSERT [dbo].[Month] ([IdMonth], [NameMonth]) VALUES (1, N'Январь')
SET IDENTITY_INSERT [dbo].[Month] OFF
GO
SET IDENTITY_INSERT [dbo].[Operations] ON 

INSERT [dbo].[Operations] ([IdOperations], [IdFirmOperations], [IdMonthOperations], [BuyOperations], [SaleOperations], [PurchasedOperations], [SalesOperations]) VALUES (1, 1, 5, CAST(10.00 AS Decimal(7, 2)), CAST(12.00 AS Decimal(7, 2)), 9, 6)
INSERT [dbo].[Operations] ([IdOperations], [IdFirmOperations], [IdMonthOperations], [BuyOperations], [SaleOperations], [PurchasedOperations], [SalesOperations]) VALUES (3, 2, 6, CAST(5.00 AS Decimal(7, 2)), CAST(4.00 AS Decimal(7, 2)), 50, 45)
INSERT [dbo].[Operations] ([IdOperations], [IdFirmOperations], [IdMonthOperations], [BuyOperations], [SaleOperations], [PurchasedOperations], [SalesOperations]) VALUES (6, 1, 4, CAST(3.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(7, 2)), 10, 20)
SET IDENTITY_INSERT [dbo].[Operations] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Month_NameMonth]    Script Date: 26.06.2022 17:05:05 ******/
ALTER TABLE [dbo].[Month] ADD  CONSTRAINT [UQ_Month_NameMonth] UNIQUE NONCLUSTERED 
(
	[NameMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Operations]  WITH CHECK ADD  CONSTRAINT [FK_Operations_Firm] FOREIGN KEY([IdFirmOperations])
REFERENCES [dbo].[Firm] ([IdFirm])
GO
ALTER TABLE [dbo].[Operations] CHECK CONSTRAINT [FK_Operations_Firm]
GO
ALTER TABLE [dbo].[Operations]  WITH CHECK ADD  CONSTRAINT [FK_Operations_Month] FOREIGN KEY([IdMonthOperations])
REFERENCES [dbo].[Month] ([IdMonth])
GO
ALTER TABLE [dbo].[Operations] CHECK CONSTRAINT [FK_Operations_Month]
GO
USE [master]
GO
ALTER DATABASE [PP05Gapeev] SET  READ_WRITE 
GO
