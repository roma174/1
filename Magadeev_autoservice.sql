USE [master]
GO
/****** Object:  Database [Magadeev_autoservice]    Script Date: 04.10.2023 22:30:14 ******/
CREATE DATABASE [Magadeev_autoservice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Magadeev_autoservice', FILENAME = N'K:\mySQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Magadeev_autoservice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Magadeev_autoservice_log', FILENAME = N'K:\mySQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Magadeev_autoservice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Magadeev_autoservice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Magadeev_autoservice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Magadeev_autoservice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Magadeev_autoservice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Magadeev_autoservice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Magadeev_autoservice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Magadeev_autoservice] SET  MULTI_USER 
GO
ALTER DATABASE [Magadeev_autoservice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Magadeev_autoservice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Magadeev_autoservice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Magadeev_autoservice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Magadeev_autoservice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Magadeev_autoservice] SET QUERY_STORE = OFF
GO
USE [Magadeev_autoservice]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_client2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titel] [nvarchar](100) NOT NULL,
	[MainImagePath] [nvarchar](100) NULL,
	[Duration] [smallint] NOT NULL,
	[Cost] [float] NULL,
	[Discount] [float] NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_service2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 04.10.2023 22:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (1, N'Мишина', N'Иветта', N'Андреевна', N'ж', N'7(3926)244-81-96', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-01-24' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (2, N'Суворова', N'Божена', N'Анатольевна', N'ж', N'7(347)895-86-57', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (3, N'Белозёрова', N'Диана', N'Антоновна', N'ж', N'7(9900)174-59-87', CAST(N'1989-02-27' AS Date), N'dialworld@aol.com', CAST(N'2017-01-30' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (4, N'Дементьева', N'Эдита', N'Онисимовна', N'ж', N'7(198)922-28-76', CAST(N'1975-09-17' AS Date), N'frosal@hotmail.com', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (5, N'Блинов', N'Евгений', N'Мэлсович', N'м', N'7(0852)321-82-64', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (6, N'Морозов', N'Наум', N'Валерьянович', N'м', N'7(636)050-96-13', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (7, N'Попова', N'Харита', N'Якуновна', N'ж', N'7(335)386-81-06', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', N'м', N'7(81)657-88-92', CAST(N'1993-11-17' AS Date), N'floxy@hotmail.com', CAST(N'2017-02-01' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (9, N'Крюкова', N'Авигея', N'Святославовна', N'ж', N'7(499)318-88-53', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (10, N'Беляева', N'Сабрина', N'Федосеевна', N'ж', N'7(6580)534-32-58', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (11, N'Медведев', N'Святослав', N'Юлианович', N'м', N'7(3520)435-21-20', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (12, N'Блохин', N'Пантелеймон', N'Феликсович', N'м', N'7(9524)556-48-98', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (13, N'Горбачёва', N'Никки', N'Еремеевна', N'ж', N'7(94)789-69-20', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (14, N'Архипова', N'Прасковья', N'Валерьевна', N'ж', N'7(86)540-10-21', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (15, N'Андреева', N'Патрисия', N'Валерьевна', N'ж', N'7(9648)953-81-26', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (16, N'Горшкова', N'Марта', N'Иосифовна', N'ж', N'7(544)650-59-03', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-08-04' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (17, N'Орлова', N'Влада', N'Мартыновна', N'ж', N'7(2506)433-38-35', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (18, N'Ершов', N'Глеб', N'Федорович', N'м', N'7(2608)298-40-82', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (19, N'Быкова', N'Тала', N'Георгьевна', N'ж', N'7(13)915-53-53', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (20, N'Новиков', N'Адриан', N'Аркадьевич', N'м', N'7(70)572-33-62', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2018-11-23' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (21, N'Филатов', N'Аристарх', N'Дмитриевич', N'м', N'7(696)235-29-24', CAST(N'1989-05-29' AS Date), N'hampton@att.net', CAST(N'2017-01-11' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (22, N'Анисимова', N'Тамара', N'Витальевна', N'ж', N'7(66)128-04-10', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (23, N'Кудряшов', N'Аверкий', N'Константинович', N'м', N'7(88)732-96-30', CAST(N'1991-07-26' AS Date), N'nanop@msn.com', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (24, N'Колобов', N'Орест', N'Юлианович', N'м', N'7(1680)508-58-26', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (25, N'Кузьмина', N'Дэнна', N'Витальевна', N'ж', N'7(9940)977-45-73', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (26, N'Александров', N'Станислав', N'Эдуардович', N'м', N'7(18)164-05-12', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (27, N'Андреев', N'Станислав', N'Максович', N'м', N'7(02)993-91-28', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (28, N'Дроздов', N'Вольдемар', N'Артемович', N'м', N'7(307)456-99-05', CAST(N'1976-02-07' AS Date), N'smpeters@me.com', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (29, N'Абрамов', N'Станислав', N'Филатович', N'м', N'7(6545)478-87-79', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (30, N'Гусева', N'Роза', N'Дмитриевна', N'ж', N'7(23)064-51-84', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (31, N'Лазарев', N'Алексей', N'Богданович', N'м', N'7(0055)737-37-48', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (32, N'Большаков', N'Вадим', N'Данилович', N'м', N'7(386)641-13-37', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (33, N'Ефремов', N'Витольд', N'Авксентьевич', N'м', N'7(93)922-14-03', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (34, N'Игнатов', N'Захар', N'Павлович', N'м', N'7(578)574-73-36', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (35, N'Калашников', N'Артур', N'Юрьевич', N'м', N'7(147)947-47-21', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (36, N'Овчинникова', N'Лаура', N'Еремеевна', N'ж', N'7(85)829-33-79', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (37, N'Голубев', N'Иосиф', N'Тимофеевич', N'м', N'7(78)972-73-11', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (38, N'Галкин', N'Эрик', N'Онисимович', N'м', N'7(759)873-77-39', CAST(N'1975-01-18' AS Date), N'snunez@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (39, N'Некрасов', N'Варлам', N'Михайлович', N'м', N'7(019)258-06-35', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (40, N'Федотов', N'Осип', N'Анатольевич', N'м', N'7(590)702-33-06', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (41, N'Смирнов', N'Мартын', N'Арсеньевич', N'м', N'7(6251)589-02-43', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2017-02-07' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (42, N'Копылов', N'Касьян', N'Робертович', N'м', N'7(5774)679-82-06', CAST(N'1983-08-04' AS Date), N'crobles@sbcglobal.net', CAST(N'2018-03-18' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (43, N'Дмитриева', N'Элина', N'Даниловна', N'ж', N'7(787)140-48-84', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (44, N'Бирюкова', N'Инара', N'Улебовна', N'ж', N'7(098)346-50-58', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (45, N'Васильев', N'Оскар', N'Богданович', N'м', N'7(585)801-94-29', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (46, N'Киселёв', N'Устин', N'Яковлевич', N'м', N'7(83)334-52-76', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (47, N'Кузьмин', N'Леонтий', N'Валерьянович', N'м', N'7(1340)148-90-68', CAST(N'2000-05-05' AS Date), N'msloan@hotmail.com', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (48, N'Ефимова', N'Магда', N'Платоновна', N'ж', N'7(9261)386-15-92', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (49, N'Воронова', N'Изабелла', N'Вячеславовна', N'ж', N'7(17)433-44-98', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate]) VALUES (50, N'Волков', N'Людвиг', N'Витальевич', N'м', N'7(8459)592-05-58', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (1, N'Замена жидкости в кондиционере', N'Услуги автосервиса\Кондиционер.jpg', 8, 3040, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (2, N'Ремонт и замена коллектора', N'Услуги автосервиса\Выхлопная система.jpg', 150, 2770, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (3, N'Замена актуатора сцепления', N'Услуги автосервиса\Сцепление.jpg', 330, 4100, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (4, N'Замена жидкости ГУР', N'Услуги автосервиса\ГУР.png', 9, 2380, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (5, N'Заправка кондиционеров', N'Услуги автосервиса\Кондиционер.jpg', 2, 4860, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (6, N'Замена масла в вариаторе', N'Услуги автосервиса\Вариатор.jpg', 2, 4720, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (7, N'Ремонт двигателя', N'Услуги автосервиса\Двигатель.png', 4, 2470, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (8, N'Замена заднего сальника АКПП', N'Услуги автосервиса\АКПП.jpg', 390, 1510, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (9, N'Покраска', N'Услуги автосервиса\Дополнительные услуги.png', 2, 2370, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (10, N'Мойка колес', N'Услуги автосервиса\Шиномонтаж.jpg', 570, 3490, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', N'Услуги автосервиса\Выхлопная система.jpg', 3, 2980, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (12, N'Диагностика работы двигателя', N'Услуги автосервиса\Двигатель.png', 150, 2760, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (13, N'Установка сигнализации', N'Услуги автосервиса\Электрика.png', 4, 1760, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (14, N'Замена компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 270, 2720, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (15, N'Замена ремня привода ГУР', N'Услуги автосервиса\ГУР.png', 10, 3350, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (16, N'Замена тормозных колодок', N'Услуги автосервиса\Техническое обслуживание.png', 8, 4260, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (17, N'Замена масла', N'Услуги автосервиса\Техническое обслуживание.png', 510, 1430, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (18, N'Замена цепи ГРМ', N'Услуги автосервиса\Двигатель.png', 6, 4570, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (19, N'Замена бензонасоса', N'Услуги автосервиса\Топливная система.png', 4, 1780, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (20, N'Ремонт приводного вала', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', 210, 4520, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (21, N'Замена подшипника компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 330, 1110, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (22, N'Снятие и установка колес', N'Услуги автосервиса\Шиномонтаж.jpg', 390, 3130, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (23, N'Замена лямбда зонда', N'Услуги автосервиса\Выхлопная система.jpg', 270, 770, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (24, N'Замена привода в сборе', N'Услуги автосервиса\transmission.jpg', 8, 3890, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (25, N'Замена тки кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 3, 2810, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (26, N'Замена ремня кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 8, 4650, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (27, N'Замена охлаждающей жидкости', N'Услуги автосервиса\Техническое обслуживание.png', 210, 1590, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (28, N'Замена троса сцепления', N'Услуги автосервиса\Сцепление.jpg', 8, 4460, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (29, N'Замена масла в МКПП', N'Услуги автосервиса\КПП.png', 9, 4490, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (30, N'Замена рулевой рейки', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', 570, 4840, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (31, N'Ремонт дисков', N'Услуги автосервиса\Шиномонтаж.jpg', 270, 3860, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (32, N'Замена масла заднего редуктора (моста)', N'Услуги автосервиса\transmission.jpg', 7, 840, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (33, N'Замена подшипника задней ступицы', N'Услуги автосервиса\transmission.jpg', 270, 1860, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (34, N'Восстановление рулевых реек', N'Услуги автосервиса\Подвеска.png', 2, 1020, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (35, N'Замена рулевой тяги', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', 3, 570, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (36, N'Ремонт и замена гидроблока АКПП', N'Услуги автосервиса\АКПП.jpg', 270, 2040, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (37, N'Замена масла раздаточной коробки', N'Услуги автосервиса\transmission.jpg', 510, 2070, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (38, N'Диагностика кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 10, 2590, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (39, N'Ремонт и замена катализатора', N'Услуги автосервиса\Выхлопная система.jpg', 270, 500, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (40, N'Замена гофры глушителя', N'Услуги автосервиса\Выхлопная система.jpg', 270, 760, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (41, N'Замена ремня ГРМ', N'Услуги автосервиса\Двигатель.png', 150, 4630, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (42, N'Ремонт редуктора', N'Услуги автосервиса\КПП.png', 8, 870, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', N'Услуги автосервиса\diz.jpg', 450, 4610, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (44, N'Вулканизация шин', N'Услуги автосервиса\Шиномонтаж.jpg', 330, 540, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (45, N'Ремонт стартера', N'Услуги автосервиса\Электрика.png', 8, 2680, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (46, N'Ремонт коробки передач', N'Услуги автосервиса\КПП.png', 450, 1850, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (47, N'Жидкостная промывка топливной системы', N'Услуги автосервиса\Топливная система.png', 6, 3620, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (48, N'Ремонт генератора', N'Услуги автосервиса\Электрика.png', 210, 1700, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (49, N'Замена масла АКПП', N'Услуги автосервиса\АКПП.jpg', 450, 2430, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (50, N'Диагностика трансмиссии', N'Услуги автосервиса\transmission.jpg', 2, 2790, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (51, N'Монтаж и снятие шин с диска', N'Услуги автосервиса\Шиномонтаж.jpg', 10, 3990, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (52, N'Замена подшипника передней ступицы', N'Услуги автосервиса\transmission.jpg', 330, 4020, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (53, N'Замена главного цилиндра сцепления', N'Услуги автосервиса\Сцепление.jpg', 150, 4910, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (54, N'Установка автомагнитолы', N'Услуги автосервиса\Электрика.png', 270, 3210, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (55, N'Диагностика рулевых тяг', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', 3, 1680, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (56, N'Замена радиатора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 9, 1770, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (57, N'Замена тормозной жидкости', N'Услуги автосервиса\Техническое обслуживание.png', 6, 2200, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (58, N'Ремонт рулевого управления', N'Услуги автосервиса\Подвеска.png', 2, 3440, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (59, N'Замена заднего редуктора', N'Услуги автосервиса\transmission.jpg', 330, 2240, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (60, N'Дефектация CVT', N'Услуги автосервиса\Вариатор.jpg', 3, 1830, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (61, N'Замена карданного вала', N'Услуги автосервиса\transmission.jpg', 2, 4450, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (62, N'Замена сцепления', N'Услуги автосервиса\КПП.png', 330, 4320, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (63, N'Установка системы автозапуска', N'Услуги автосервиса\Электрика.png', 9, 3620, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (64, N'Замена опоры АКПП', N'Услуги автосервиса\АКПП.jpg', 5, 2540, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (65, N'Ремонт бензонасоса', N'Услуги автосервиса\Топливная система.png', 210, 500, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (66, N'Замена масла переднего редуктора (моста)', N'Услуги автосервиса\transmission.jpg', 9, 3950, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (67, N'Ремонт подвесного подшипника', N'Услуги автосервиса\transmission.jpg', 7, 4440, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (68, N'Тестирование форсунок (стенд)', N'Услуги автосервиса\Топливная система.png', 6, 1600, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (69, N'Диагностика сцепления', N'Услуги автосервиса\Сцепление.jpg', 6, 4210, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (70, N'Замена ступицы в сборе', N'Услуги автосервиса\transmission.jpg', 150, 4250, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (71, N'Антибактериальная обработка кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 450, 4580, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (72, N'Ремонт глушителя', N'Услуги автосервиса\Выхлопная система.jpg', 150, 2100, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (73, N'Диагностика рулевого редуктора', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', 3, 2930, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (74, N'Диагностика подвески', N'Услуги автосервиса\Подвеска.png', 330, 1460, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (75, N'Замена свечей', N'Услуги автосервиса\Техническое обслуживание.png', 2, 2240, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (76, N'Диагностика инжектора', N'Услуги автосервиса\Топливная система.png', 330, 3390, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (77, N'Комплексная диагностика автомобиля', N'Услуги автосервиса\Техническое обслуживание.png', 10, 1120, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (78, N'Ремонт раздаточной коробки', N'Услуги автосервиса\КПП.png', 10, 3610, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (79, N'Удаление катализатора', N'Услуги автосервиса\Дополнительные услуги.png', 510, 1930, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (80, N'Снятие/установка форсунок', N'Услуги автосервиса\diz.jpg', 5, 1470, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (81, N'Развал-схождение', N'Услуги автосервиса\Подвеска.png', 3, 3890, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (82, N'Замена выжимного подшипника', N'Услуги автосервиса\Сцепление.jpg', 10, 2250, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (83, N'Чистка форсунок ультразвуком', N'Услуги автосервиса\Топливная система.png', 4, 3920, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (84, N'Ремонт компрессора кондиционера', N'Услуги автосервиса\Кондиционер.jpg', 150, 4760, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (85, N'Замена цилиндра сцепления', N'Услуги автосервиса\Сцепление.jpg', 8, 810, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (86, N'Ремонт подвески (ходовой)', N'Услуги автосервиса\Подвеска.png', 3, 680, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (87, N'Замена фильтров', N'Услуги автосервиса\Техническое обслуживание.png', 210, 530, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (88, N'Кузовной ремонт', N'Услуги автосервиса\Дополнительные услуги.png', 150, 2750, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (89, N'Замена прокладки приемной тки', N'Услуги автосервиса\Выхлопная система.jpg', 570, 4680, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (90, N'Диагностика выхлопной системы автомобиля', N'Услуги автосервиса\Выхлопная система.jpg', 3, 2550, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (91, N'Балансировка колес', N'Услуги автосервиса\Шиномонтаж.jpg', 390, 4690, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (92, N'Ремонт автоэлектрики', N'Услуги автосервиса\Электрика.png', 450, 4230, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (93, N'ТО с сохранением гарантии', N'Услуги автосервиса\Техническое обслуживание.png', 270, 4300, 20, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (94, N'Ремонт карданного вала', N'Услуги автосервиса\transmission.jpg', 210, 780, 5, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (95, N'Ремонт сцепления', N'Услуги автосервиса\КПП.png', 10, 3290, 25, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (96, N'Замена кулисы АКПП', N'Услуги автосервиса\АКПП.jpg', 6, 3250, 10, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (97, N'Ремонт кронштейна глушителя', N'Услуги автосервиса\Выхлопная система.jpg', 570, 1410, 0, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (98, N'Замена сальника привода', N'Услуги автосервиса\transmission.jpg', 570, 3820, 15, NULL)
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (99, N'Замена пыльника шруса', N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', 5, 4730, 0, NULL)
GO
INSERT [dbo].[Service] ([Id], [Titel], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (100, N'Замена маховика', N'Услуги автосервиса\Сцепление.jpg', 10, 2400, 25, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_client2_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_client2_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_client2] FOREIGN KEY([ID])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_client2]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_service2] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_service2]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_service2] FOREIGN KEY([ID])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_service2]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_client2] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_client2]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Magadeev_autoservice] SET  READ_WRITE 
GO
