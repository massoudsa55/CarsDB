USE [master]
GO
/****** Object:  Database [CarsDB]    Script Date: 22-04-2022 2:26:12 ******/
CREATE DATABASE [CarsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MESSAOUD\MSSQL\DATA\CarsDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MESSAOUD\MSSQL\DATA\CarsDB_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarsDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarsDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CarsDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarsDB]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[ID_Car] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNumber] [nvarchar](max) NOT NULL,
	[ID_Mark] [int] NOT NULL,
	[Model_Name] [nvarchar](max) NOT NULL,
	[Date_Product] [date] NOT NULL,
	[Mileage] [nvarchar](max) NOT NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[ID_Car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID_Client] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[FName] [nvarchar](max) NOT NULL,
	[LName] [nvarchar](max) NOT NULL,
	[DOB] [date] NOT NULL,
	[Phone1] [nvarchar](max) NOT NULL,
	[Phone2] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[Image] [image] NULL,
	[Address] [nvarchar](max) NULL,
	[Profession] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID_Customer] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[FName] [nvarchar](max) NOT NULL,
	[LName] [nvarchar](max) NOT NULL,
	[DOB] [date] NOT NULL,
	[Phone1] [nvarchar](max) NOT NULL,
	[Phone2] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[Image] [image] NULL,
	[Address] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoicesBuy]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicesBuy](
	[ID_InvoiceBuy] [int] IDENTITY(1,1) NOT NULL,
	[ID_Car] [int] NOT NULL,
	[ID_Customer] [int] NOT NULL,
	[Buy_Date] [date] NOT NULL,
	[Buy_Time] [time](7) NOT NULL,
	[CostPrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ID_User] [int] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[ID_InvoiceBuy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoicesRent]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicesRent](
	[ID_InvoiceRent] [int] IDENTITY(1,1) NOT NULL,
	[Car_ID] [int] NOT NULL,
	[ID_Client] [int] NOT NULL,
	[Date_Rent_Start] [date] NOT NULL,
	[Date_Rent_End] [date] NOT NULL,
	[Time_Rent_Start] [time](7) NOT NULL,
	[Time_Rent_End] [time](7) NOT NULL,
	[CostPrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[RentPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ID_User] [int] NOT NULL,
 CONSTRAINT [PK_InvoicesRent] PRIMARY KEY CLUSTERED 
(
	[ID_InvoiceRent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoicesSale]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicesSale](
	[ID_InvoiceSale] [int] IDENTITY(1,1) NOT NULL,
	[ID_Car] [int] NOT NULL,
	[ID_Client] [int] NOT NULL,
	[Sale_Date] [date] NOT NULL,
	[Sale_Time] [time](7) NOT NULL,
	[CostPrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ID_User] [int] NOT NULL,
 CONSTRAINT [PK_InvoicesSale] PRIMARY KEY CLUSTERED 
(
	[ID_InvoiceSale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marks]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[ID_Mark] [int] IDENTITY(1,1) NOT NULL,
	[Mark_Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[ID_Mark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID_Permission] [int] IDENTITY(1,1) NOT NULL,
	[Type_Permission] [nvarchar](max) NOT NULL,
	[Activty] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID_Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeUser]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUser](
	[ID_TypeUser] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[ID_Permission] [int] NULL,
 CONSTRAINT [PK_TypeUser] PRIMARY KEY CLUSTERED 
(
	[ID_TypeUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 22-04-2022 2:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ID_TypeUser] [int] NULL,
	[Salary] [float] NULL,
	[DateCreation] [datetime] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Adresse] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Marks] FOREIGN KEY([ID_Mark])
REFERENCES [dbo].[Marks] ([ID_Mark])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Marks]
GO
ALTER TABLE [dbo].[InvoicesBuy]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesBuy_Cars] FOREIGN KEY([ID_Car])
REFERENCES [dbo].[Cars] ([ID_Car])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesBuy] CHECK CONSTRAINT [FK_InvoicesBuy_Cars]
GO
ALTER TABLE [dbo].[InvoicesBuy]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesBuy_Customers] FOREIGN KEY([ID_Customer])
REFERENCES [dbo].[Customers] ([ID_Customer])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesBuy] CHECK CONSTRAINT [FK_InvoicesBuy_Customers]
GO
ALTER TABLE [dbo].[InvoicesBuy]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesBuy_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID_User])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesBuy] CHECK CONSTRAINT [FK_InvoicesBuy_Users]
GO
ALTER TABLE [dbo].[InvoicesRent]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesRent_Cars] FOREIGN KEY([Car_ID])
REFERENCES [dbo].[Cars] ([ID_Car])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesRent] CHECK CONSTRAINT [FK_InvoicesRent_Cars]
GO
ALTER TABLE [dbo].[InvoicesRent]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesRent_Clients] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Clients] ([ID_Client])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesRent] CHECK CONSTRAINT [FK_InvoicesRent_Clients]
GO
ALTER TABLE [dbo].[InvoicesRent]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesRent_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID_User])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesRent] CHECK CONSTRAINT [FK_InvoicesRent_Users]
GO
ALTER TABLE [dbo].[InvoicesSale]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesSale_Cars] FOREIGN KEY([ID_Car])
REFERENCES [dbo].[Cars] ([ID_Car])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesSale] CHECK CONSTRAINT [FK_InvoicesSale_Cars]
GO
ALTER TABLE [dbo].[InvoicesSale]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesSale_Clients] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Clients] ([ID_Client])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesSale] CHECK CONSTRAINT [FK_InvoicesSale_Clients]
GO
ALTER TABLE [dbo].[InvoicesSale]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesSale_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID_User])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoicesSale] CHECK CONSTRAINT [FK_InvoicesSale_Users]
GO
ALTER TABLE [dbo].[TypeUser]  WITH CHECK ADD  CONSTRAINT [FK_TypeUser_Permissions] FOREIGN KEY([ID_Permission])
REFERENCES [dbo].[Permissions] ([ID_Permission])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TypeUser] CHECK CONSTRAINT [FK_TypeUser_Permissions]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypeUser] FOREIGN KEY([ID_TypeUser])
REFERENCES [dbo].[TypeUser] ([ID_TypeUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypeUser]
GO
USE [master]
GO
ALTER DATABASE [CarsDB] SET  READ_WRITE 
GO
