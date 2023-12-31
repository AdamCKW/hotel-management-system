USE [master]
GO
/****** Object:  Database [HotelManagementDB]    Script Date: 1/8/2021 11:13:51 AM ******/
CREATE DATABASE [HotelManagementDB] ON  PRIMARY 
( NAME = N'HotelManagementDB', FILENAME = N'D:\YourFolderName\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelManagementDB_log', FILENAME = N'D:\YourFolderName\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [HotelManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelManagementDB] SET DB_CHAINING OFF 
GO
USE [HotelManagementDB]
GO
/****** Object:  Schema [Hotel]    Script Date: 1/8/2021 11:13:51 AM ******/
CREATE SCHEMA [Hotel]
GO
/****** Object:  Schema [Master]    Script Date: 1/8/2021 11:13:51 AM ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Table [dbo].[admin_tbl]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_tbl](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_username] [varchar](50) NOT NULL,
	[admin_password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_admin_tbl] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking_tbl]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_tbl](
	[BookingID] [int] NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[BookingStatusID] [int] NOT NULL,
	[RoomNumber] [int] NULL,
	[CustomerID] [int] NOT NULL,
	[BookingDate] [varchar](50) NOT NULL,
	[Night] [int] NOT NULL,
	[Check_InDate] [varchar](50) NOT NULL,
	[Check_OutDate] [varchar](50) NOT NULL,
	[NumberOfAdult] [int] NOT NULL,
	[NumberOfChildren] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_booking_tbl] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingStatus]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingStatus](
	[BookingStatusID] [int] IDENTITY(1,1) NOT NULL,
	[BookingStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BookingStatus] PRIMARY KEY CLUSTERED 
(
	[BookingStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[CustomerID] [int] NOT NULL,
	[Prefix] [varchar](10) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CustomerNo] [varchar](50) NOT NULL,
	[Zipcode] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[CCHolderName] [varchar](50) NULL,
	[CCNumber] [varchar](50) NULL,
	[CCExpDate] [varchar](50) NULL,
	[CVC] [int] NULL,
 CONSTRAINT [PK_CustomerDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Housekeeping]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Housekeeping](
	[HousekeepingID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[KeepingStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Housekeeping] PRIMARY KEY CLUSTERED 
(
	[HousekeepingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[keepingstatus_tbl]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[keepingstatus_tbl](
	[KeepingStatusID] [int] IDENTITY(1,1) NOT NULL,
	[KeepingStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_keepingstatus_tbl] PRIMARY KEY CLUSTERED 
(
	[KeepingStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_tbl]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_tbl](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[RoomNumber] [varchar](5) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[OrderDate] [varchar](50) NULL,
 CONSTRAINT [PK_order_tbl] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_tbl]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_tbl](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[ItemImage] [nvarchar](550) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ItemDetail] [text] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_product_tbl] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productType]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productType](
	[ItemTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_productType] PRIMARY KEY CLUSTERED 
(
	[ItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[RoomType] [varchar](50) NULL,
	[RoomNumber] [varchar](5) NOT NULL,
	[RoomImage] [nvarchar](550) NOT NULL,
	[RoomPrice] [decimal](18, 2) NOT NULL,
	[RoomDescription] [nvarchar](550) NOT NULL,
	[AdultCapacity] [int] NOT NULL,
	[ChildrenCapacity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [varchar](50) NOT NULL,
	[RoomDescription] [text] NOT NULL,
	[RoomRates] [decimal](18, 2) NOT NULL,
	[Deposit] [decimal](18, 2) NOT NULL,
	[AdultCapacity] [int] NOT NULL,
	[ChildrenCapacity] [int] NOT NULL,
	[RoomImage] [nvarchar](100) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_tbl]    Script Date: 1/8/2021 11:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_tbl](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DoB] [nvarchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[FullAddress] [varchar](500) NOT NULL,
 CONSTRAINT [PK_staff_tbl] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_tbl] ON 

INSERT [dbo].[admin_tbl] ([admin_id], [admin_username], [admin_password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin_tbl] OFF
GO
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (1, 5, 2, 105, 1, N'2021-07-07', 7, N'2021-08-01', N'2021-08-07', 2, 2, CAST(2212.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (2, 1, 3, 101, 2, N'2021-07-08', 17, N'2021-07-08', N'2021-07-24', 1, 0, CAST(2006.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (3, 3, 3, 103, 3, N'2021-07-12', 13, N'2021-07-12', N'2021-07-24', 1, 0, CAST(1794.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (4, 1, 1, 108, 4, N'2021-07-14', 1, N'2021-07-14', N'2021-07-15', 1, 0, CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (5, 2, 1, 102, 5, N'2021-07-15', 2, N'2021-07-15', N'2021-07-17', 1, 0, CAST(236.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (6, 1, 1, 108, 7, N'2021-07-15', 1, N'2021-07-15', N'2021-07-16', 1, 0, CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (7, 1, 3, 108, 8, N'2021-07-16', 5, N'2021-07-20', N'2021-07-25', 1, 0, CAST(590.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (8, 1, 1, 108, 9, N'2021-07-17', 1, N'2021-07-17', N'2021-07-18', 1, 0, CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (10, 7, 2, 107, 10, N'2021-07-20', 5, N'2021-07-20', N'2021-07-25', 1, 0, CAST(395.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (11, 2, 3, 102, 11, N'2021-07-20', 5, N'2021-07-20', N'2021-07-25', 1, 0, CAST(590.00 AS Decimal(18, 2)))
INSERT [dbo].[booking_tbl] ([BookingID], [RoomTypeID], [BookingStatusID], [RoomNumber], [CustomerID], [BookingDate], [Night], [Check_InDate], [Check_OutDate], [NumberOfAdult], [NumberOfChildren], [TotalAmount]) VALUES (12, 1, 2, 115, 12, N'2021-07-22', 2, N'2021-07-22', N'2021-07-24', 1, 0, CAST(236.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[BookingStatus] ON 

INSERT [dbo].[BookingStatus] ([BookingStatusID], [BookingStatus]) VALUES (1, N'Free')
INSERT [dbo].[BookingStatus] ([BookingStatusID], [BookingStatus]) VALUES (2, N'Reserved')
INSERT [dbo].[BookingStatus] ([BookingStatusID], [BookingStatus]) VALUES (3, N'Occupied')
SET IDENTITY_INSERT [dbo].[BookingStatus] OFF
GO
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (1, N'NA', N'Jane', N'Doe', N'example@company.com', N'0181112222', N'101010', N'Klang', N'Selangor', N'Malaysia', N'John Doe', N'5555555555555555', N'12/23', 555)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (2, N'NA', N'Adam', N'Rando', N'example@company.com', N'0183334444', N'41111', N'Klang', N'Selangor', N'Malaysia', N'Adam Rando', N'1111111111111111', N'12/23', 111)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (3, N'NA', N'Adam', N'Sanders', N'sanders@movie.com', N'111222333', N'11000', N'Klang', N'Selangor', N'Malaysia', N'Adam Sanders', N'5555555555555555', N'06/23', 555)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (4, N'NA', N'Aric', N'Enders', N'aric@enders.com', N'0181112222', N'11000', N'Klang', N'Selangor', N'Malaysia', N'0', N'0', N'0/0', 0)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (5, N'NA', N'Jonny', N'Doe', N'example@company.com', N'0183334444', N'11000', N'Klang', N'Selangor', N'Malaysia', N'John Doe', N'5555555555555555', N'12/23', 555)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (6, N'Mr.', N'Adam', N'Enders', N'adam@enders.com', N'0183334444', N'41000', N'Klang', N'Selangor', N'Malaysia', N'Adam Enders', N'5555555555555555', N'12/23', 555)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (7, N'Mr.', N'Adam', N'Enders', N'adam@enders.com', N'0183334444', N'41000', N'Klang', N'Selangor', N'Malaysia', N'John Doe', N'5555555555555555', N'12/23', 555)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (8, N'NA', N'Mumbo', N'Jumbo', N'abc@email.com', N'123456789', N'110000', N'Klang', N'Selangor', N'Malaysia', N'Mumbo Jumbo', N'5555555555555555', N'12/22', 555)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (9, N'Dr.', N'John', N'Doe', N'example@company.com', N'0183334444', N'11111', N'Klang', N'Selangor', N'Malaysia', N'0', N'0', N'0/0', 0)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (10, N'NA', N'Aric', N'Ong', N'aric@gmail.com', N'0167772222', N'10100', N'Klang', N'Selangor', N'Malaysia', N'0', N'0', N'0/0', 0)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (11, N'Miss.', N'Jane', N'Lim', N'jane@example.com', N'03962894894', N'41200', N'Petaling Jaya', N'Selangor', N'Malaysia', N'0', N'0', N'0/0', 0)
INSERT [dbo].[CustomerDetails] ([CustomerID], [Prefix], [FirstName], [LastName], [Email], [CustomerNo], [Zipcode], [City], [State], [Country], [CCHolderName], [CCNumber], [CCExpDate], [CVC]) VALUES (12, N'NA', N'Emma', N'Chen', N'emma@gmail.com', N'0123334444', N'41200', N'Petaling Jaya', N'Selangor', N'United Kingdom', N'John Doe', N'5555555555555555', N'12/55', 123)
GO
SET IDENTITY_INSERT [dbo].[Housekeeping] ON 

INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (1, 101, 2)
INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (2, 101, 2)
INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (3, 103, 2)
INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (4, 101, 2)
INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (5, 102, 1)
INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (6, 108, 1)
INSERT [dbo].[Housekeeping] ([HousekeepingID], [RoomNumber], [KeepingStatusID]) VALUES (7, 108, 1)
SET IDENTITY_INSERT [dbo].[Housekeeping] OFF
GO
SET IDENTITY_INSERT [dbo].[keepingstatus_tbl] ON 

INSERT [dbo].[keepingstatus_tbl] ([KeepingStatusID], [KeepingStatus]) VALUES (1, N'Pending')
INSERT [dbo].[keepingstatus_tbl] ([KeepingStatusID], [KeepingStatus]) VALUES (2, N'Completed')
SET IDENTITY_INSERT [dbo].[keepingstatus_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[order_tbl] ON 

INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (1, 1, N'101', N'Basil Leaves and Avocado Bread on Sliced Bread', 1, CAST(5.00 AS Decimal(18, 2)), 2, N'2021-07-14')
INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (2, 1, N'101', N'Basil Leaves and Avocado Bread on Sliced Bread', 1, CAST(5.00 AS Decimal(18, 2)), 2, N'2021-07-20')
INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (4, 1, N'101', N'Basil Leaves and Avocado Bread on Sliced Bread', 1, CAST(5.00 AS Decimal(18, 2)), 2, N'2021-07-20')
INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (5, 10, N'101', N'7ups', 1, CAST(2.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (6, 11, N'101', N'Coke Cola', 1, CAST(2.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (7, 11, N'101', N'Coke Cola', 1, CAST(2.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[order_tbl] ([OrderID], [ItemID], [RoomNumber], [ItemName], [Quantity], [Cost], [OrderStatusID], [OrderDate]) VALUES (8, 2, N'103', N'Beef Steak', 1, CAST(20.00 AS Decimal(18, 2)), 1, NULL)
SET IDENTITY_INSERT [dbo].[order_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderStatus]) VALUES (1, N'Pending')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderStatus]) VALUES (2, N'Completed')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[product_tbl] ON 

INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (1, N'Basil Leaves and Avocado on Sliced Bread', 1, N'~/product_img/Basil Leaves and Avocado on Sliced Bread.jpg', CAST(5.00 AS Decimal(18, 2)), N'2 slices of bread served with basil leaves and avocado. 2 slices per serving.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (2, N'Beef Steak', 1, N'~/product_img/Beef Steak With Sause.jpg', CAST(20.00 AS Decimal(18, 2)), N'Grilled beef steak marinated in special sauce and served with vegetables. A good steak that is juicy, tender, loaded with flavour and has a minimum amount of fat.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (3, N'Beef Burger with Fries', 1, N'~/product_img/BeefBurger&Fries.jpg', CAST(20.00 AS Decimal(18, 2)), N'A two-layered beef with cheese and served with fries.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (4, N'Fish & Chips', 1, N'~/product_img/Fish Chips with mashed potatoes.jpg', CAST(10.00 AS Decimal(18, 2)), N'Fried fish & chips served with mashed potatoes.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (5, N'French Fries', 1, N'~/product_img/French Fries With Ketchup.jpg', CAST(5.00 AS Decimal(18, 2)), N'French fries served with ketchup.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (6, N'Grilled Barbecue Fried Rice', 1, N'~/product_img/Grilled Barbecue With Fried Rice.jpg', CAST(20.00 AS Decimal(18, 2)), N'Fried rice served with grilled barbecue and vegetables.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (7, N'Vegetarian Pasta', 1, N'~/product_img/PastaWithTomato&Basil.jpg', CAST(15.00 AS Decimal(18, 2)), N'A vegetarian pasta served with Tomato And Basil', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (8, N'Pepperoni Pizza', 1, N'~/product_img/Pepperoni Pizza.jpg', CAST(20.00 AS Decimal(18, 2)), N'A large size pepperoni pizza.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (9, N'Vegetable Salad', 1, N'~/product_img/Vegetable Salad on Plate.jpg', CAST(10.00 AS Decimal(18, 2)), N'A vegetable salad on a plate.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (10, N'7ups', 2, N'~/product_img/7ups (can).jpg', CAST(2.00 AS Decimal(18, 2)), N'A can of 7ups.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (11, N'Coca-Cola', 2, N'~/product_img/Coke Cola (Can).jpg', CAST(2.00 AS Decimal(18, 2)), N'A can of coke cola.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (12, N'Pepsi', 2, N'~/product_img/Pepsi (Can).jpg', CAST(2.00 AS Decimal(18, 2)), N'A can of pepsi.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (13, N'Iced Lemon Tea', 2, N'~/product_img/Iced Lemon Tea.jpg', CAST(7.00 AS Decimal(18, 2)), N'A cup of iced lemon tea.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (14, N'Iced Lemonade', 2, N'~/product_img/Iced Lemonade.jpg', CAST(7.00 AS Decimal(18, 2)), N'A cup of iced lemonade.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (15, N'Watermelon Smoothie', 2, N'~/product_img/Watermellon Smoothy.jpg', CAST(7.00 AS Decimal(18, 2)), N'A cup of watermelon smoothie.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (16, N'Iced Coffee', 2, N'~/product_img/Iced Coffee.jpg', CAST(7.00 AS Decimal(18, 2)), N'A cup of iced coffee.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (17, N'Espresso', 2, N'~/product_img/Espresso.jpg', CAST(5.00 AS Decimal(18, 2)), N'A cup of espresso.', 1)
INSERT [dbo].[product_tbl] ([ItemID], [ItemName], [ItemTypeID], [ItemImage], [Price], [ItemDetail], [IsActive]) VALUES (18, N'Latte.', 2, N'~/product_img/Latte.jpg', CAST(5.00 AS Decimal(18, 2)), N'A cup of latte.', 1)
SET IDENTITY_INSERT [dbo].[product_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[productType] ON 

INSERT [dbo].[productType] ([ItemTypeID], [ItemType]) VALUES (1, N'Food')
INSERT [dbo].[productType] ([ItemTypeID], [ItemType]) VALUES (2, N'Drinks')
SET IDENTITY_INSERT [dbo].[productType] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (1, 1, N'Standard Queen Room', N'101', N'~/room_img/Standard_Queen_Room.jpg', CAST(118.00 AS Decimal(18, 2)), N'A 17.93 square meter room with a city view room. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Interconnecting Rooms as well as Non-smoking rooms available for the Standard Queen Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (2, 2, N'Standard Twin Room', N'102', N'~/room_img/Standard_Twin_Room.jpg', CAST(118.00 AS Decimal(18, 2)), N'A 17.93 square meter room with a city view. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Standard Twin Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (3, 3, N'Deluxe Queen Room', N'103', N'~/room_img/Deluxe_Queen_Room.jpg', CAST(138.00 AS Decimal(18, 2)), N'A 26.22 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Standard Twin Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (4, 4, N'Deluxe Twin Room', N'104', N'~/room_img/Deluxe_Twin_Room.jpg', CAST(138.00 AS Decimal(18, 2)), N'A 26.22 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Deluxe Twin Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (5, 5, N'Suite Room', N'105', N'~/room_img/Suite_Room.jpg', CAST(158.00 AS Decimal(18, 2)), N'A 35.52 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa and 2 Single Seated Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker, Dressing Table, Working Desk and Fitting Room With Curtains. 
There are also Non-smoking rooms available for the Suite Room.', 4, 0, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (6, 6, N'Family Room', N'106', N'~/room_img/Family_Room.jpg', CAST(208.00 AS Decimal(18, 2)), N'A 35.52 square meter room with city view fitted with 2 Queen Sized Beds or 1 Queen Sized Bed With 2 Twin Beds.  
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, and Coffee Maker.
There are also Non-smoking rooms available for the Family Room.', 4, 0, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (7, 7, N'Budget Room', N'107', N'~/room_img/Budget_Room.jpg', CAST(79.00 AS Decimal(18, 2)), N'A 17.93 square meter room with city view fitted with Queen Sized Beds or Twin Beds.  
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, and Dressing Table.
There are only 2 units with Interconnecting Rooms.', 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (8, 1, N'Standard Queen Room', N'108', N'~/room_img/Standard_Queen_Room.jpg', CAST(118.00 AS Decimal(18, 2)), N'A 17.93 square meter room with a city view room. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Interconnecting Rooms as well as Non-smoking rooms available for the Standard Queen Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (9, 2, N'Standard Twin Room', N'109', N'~/room_img/Standard_Twin_Room.jpg', CAST(118.00 AS Decimal(18, 2)), N'A 17.93 square meter room with a city view. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Standard Twin Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (10, 3, N'Deluxe Queen Room', N'110', N'~/room_img/Deluxe_Queen_Room.jpg', CAST(138.00 AS Decimal(18, 2)), N'A 26.22 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Standard Twin Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (11, 4, N'Deluxe Twin Room', N'111', N'~/room_img/Deluxe_Twin_Room.jpg', CAST(138.00 AS Decimal(18, 2)), N'A 26.22 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Deluxe Twin Room.', 2, 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (12, 5, N'Suite Room', N'112', N'~/room_img/Suite_Room.jpg', CAST(158.00 AS Decimal(18, 2)), N'A 35.52 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa and 2 Single Seated Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker, Dressing Table, Working Desk and Fitting Room With Curtains. 
There are also Non-smoking rooms available for the Suite Room.', 4, 0, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (13, 6, N'Family Room', N'113', N'~/room_img/Family_Room.jpg', CAST(208.00 AS Decimal(18, 2)), N'A 35.52 square meter room with city view fitted with 2 Queen Sized Beds or 1 Queen Sized Bed With 2 Twin Beds.  
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, and Coffee Maker.
There are also Non-smoking rooms available for the Family Room.', 4, 0, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (14, 7, N'Budget Room', N'114', N'~/room_img/Budget_Room.jpg', CAST(79.00 AS Decimal(18, 2)), N'A 17.93 square meter room with city view fitted with Queen Sized Beds or Twin Beds.  
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, and Dressing Table.
There are only 2 units with Interconnecting Rooms.', 1, 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomTypeID], [RoomType], [RoomNumber], [RoomImage], [RoomPrice], [RoomDescription], [AdultCapacity], [ChildrenCapacity], [IsActive]) VALUES (15, 1, N'Standard Queen Room', N'115', N'~/room_img/Standard_Queen_Room.jpg', CAST(118.00 AS Decimal(18, 2)), N'A 17.93 square meter room with a city view room. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Interconnecting Rooms as well as Non-smoking rooms available for the Standard Queen Room.', 2, 2, 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (1, N'Standard Queen Room', N'A 17.93 square meter room with a city view room. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Interconnecting Rooms as well as Non-smoking rooms available for the Standard Queen Room.', CAST(118.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), 2, 2, N'~/room_img/Standard_Queen_Room.jpg')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (2, N'Standard Twin Room', N'A 17.93 square meter room with a city view. 
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Standard Twin Room.', CAST(118.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), 2, 2, N'~/room_img/Standard_Twin_Room.jpg')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (3, N'Deluxe Queen Room', N'A 26.22 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Standard Twin Room.', CAST(138.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 2, 2, N'~/room_img/Deluxe_Queen_Room.jpg')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (4, N'Deluxe Twin Room', N'A 26.22 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker and Dressing Table. 
There are also Non-smoking rooms available for the Deluxe Twin Room.', CAST(138.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 2, 2, N'~/room_img/Deluxe_Twin_Room.jpg')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (5, N'Suite Room (Twin Bed)', N'A 35.52 square meter room with a city view. 
The room amenities consist of a Double Seats Sofa and 2 Single Seated Sofa with coffee table, Internet Access, Mini Bar, Coffee Maker, Dressing Table, Working Desk and Fitting Room With Curtains. 
There are also Non-smoking rooms available for the Suite Room.', CAST(158.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 4, 0, N'~/room_img/Suite_Room.jpg')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (6, N'Family Room', N'A 35.52 square meter room with city view fitted with 2 Queen Sized Beds or 1 Queen Sized Bed With 2 Twin Beds.  
The room amenities consist of a Double Seats Sofa with coffee table, Internet Access, Mini Bar, and Coffee Maker.
There are also Non-smoking rooms available for the Family Room.', CAST(208.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 4, 0, N'~/room_img/Family_Room.jpg')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomDescription], [RoomRates], [Deposit], [AdultCapacity], [ChildrenCapacity], [RoomImage]) VALUES (7, N'Budget Room', N'A 17.93 square meter room with city view fitted with Queen Sized Beds or Twin Beds.  
The room amenities consist of a Single Seat Sofa, Internet Access, Mini Bar, and Dressing Table.
There are only 2 units with Interconnecting Rooms.', CAST(79.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), 1, 1, N'~/room_img/Budget_Room.jpg')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[staff_tbl] ON 

INSERT [dbo].[staff_tbl] ([StaffID], [LoginID], [Password], [FirstName], [LastName], [DoB], [ContactNo], [Email], [State], [City], [ZipCode], [FullAddress]) VALUES (2, N'JohnDoe123', N'12345678', N'John', N'Doe', N'2001-06-01', N'+10109999999', N'example@company.com', N'Selangor', N'Klang', N'101010', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec blandit libero fringilla lorem molestie consectetur.')
INSERT [dbo].[staff_tbl] ([StaffID], [LoginID], [Password], [FirstName], [LastName], [DoB], [ContactNo], [Email], [State], [City], [ZipCode], [FullAddress]) VALUES (3, N'JaneDoe123', N'123456789', N'Jane', N'Doe', N'2001-01-01', N'018-1232429', N'example@company.com', N'Selangor', N'Klang', N'41000', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec blandit libero fringilla lorem molestie consectetur.')
INSERT [dbo].[staff_tbl] ([StaffID], [LoginID], [Password], [FirstName], [LastName], [DoB], [ContactNo], [Email], [State], [City], [ZipCode], [FullAddress]) VALUES (4, N'JonnyDoe123', N'123456789', N'Jonny', N'Doe', N'2001-02-02', N'0183334444', N'example@company.com', N'Selangor', N'Klang', N'41000', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec blandit libero fringilla lorem molestie consectetur.')
INSERT [dbo].[staff_tbl] ([StaffID], [LoginID], [Password], [FirstName], [LastName], [DoB], [ContactNo], [Email], [State], [City], [ZipCode], [FullAddress]) VALUES (5, N'Johnny123', N'john123', N'Johnny', N'Depp', N'1963-06-09', N'010222333', N'johnny@actor.com', N'Selangor', N'Klang', N'41000', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu')
INSERT [dbo].[staff_tbl] ([StaffID], [LoginID], [Password], [FirstName], [LastName], [DoB], [ContactNo], [Email], [State], [City], [ZipCode], [FullAddress]) VALUES (6, N'EmmaChen123', N'emmachen123', N'Emma', N'Chen', N'2001-01-01', N'0123334444', N'emma@gmail.com', N'Selangor', N'Petaling Jaya', N'41200', N'test')
SET IDENTITY_INSERT [dbo].[staff_tbl] OFF
GO
ALTER TABLE [dbo].[order_tbl] ADD  CONSTRAINT [DF_order_tbl_OrderStatusID]  DEFAULT ((1)) FOR [OrderStatusID]
GO
ALTER TABLE [dbo].[product_tbl] ADD  CONSTRAINT [DF_product_tbl_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Housekeeping]  WITH CHECK ADD  CONSTRAINT [FK_Housekeeping_Housekeeping] FOREIGN KEY([KeepingStatusID])
REFERENCES [dbo].[keepingstatus_tbl] ([KeepingStatusID])
GO
ALTER TABLE [dbo].[Housekeeping] CHECK CONSTRAINT [FK_Housekeeping_Housekeeping]
GO
ALTER TABLE [dbo].[order_tbl]  WITH CHECK ADD  CONSTRAINT [FK_order_tbl_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[order_tbl] CHECK CONSTRAINT [FK_order_tbl_OrderStatus]
GO
ALTER TABLE [dbo].[product_tbl]  WITH CHECK ADD  CONSTRAINT [FK_product_tbl_productType] FOREIGN KEY([ItemTypeID])
REFERENCES [dbo].[productType] ([ItemTypeID])
GO
ALTER TABLE [dbo].[product_tbl] CHECK CONSTRAINT [FK_product_tbl_productType]
GO
USE [master]
GO
ALTER DATABASE [HotelManagementDB] SET  READ_WRITE 
GO
