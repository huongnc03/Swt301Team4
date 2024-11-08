USE [master]
GO
ALTER DATABASE [FASHION_LANE] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE IF EXISTS [FASHION_LANE]
GO
CREATE DATABASE [FASHION_LANE]
GO
USE [FASHION_LANE]
GO
/****** Object:  Table [dbo].[address]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[AddressID] [int] IDENTITY(11,1) NOT NULL,
	[addressline] [nvarchar](500) NULL,
	[city] [nvarchar](500) NULL,
	[postalcode] [nvarchar](100) NULL,
	[CountryID] [int] NULL,
	[phone] [nvarchar](50) NULL,
	[fullname] [nvarchar](200) NULL,
 CONSTRAINT [PK_address_AddressID] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[CartID] [int] IDENTITY(8,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_cart_CartID] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[cart_itemID] [int] IDENTITY(15,1) NOT NULL,
	[CartID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[VariationID] [int] NULL,
 CONSTRAINT [PK_cart_item_cart_itemID] PRIMARY KEY CLUSTERED 
(
	[cart_itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[CategoryID] [int] IDENTITY(12,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[Category_img] [nvarchar](200) NULL,
 CONSTRAINT [PK_category_CategoryID] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collection]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collection](
	[CollectionID] [int] IDENTITY(6,1) NOT NULL,
	[CollectionName] [nvarchar](200) NULL,
	[collectionImg] [nvarchar](200) NULL,
	[collection_description] [nvarchar](max) NULL,
	[create_date] [datetime2](0) NULL,
	[PromotionID] [int] NULL,
 CONSTRAINT [PK_collection_CollectionID] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[color_ID] [int] IDENTITY(11,1) NOT NULL,
	[color_Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_color_color_ID] PRIMARY KEY CLUSTERED 
(
	[color_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[CountryID] [int] IDENTITY(5,1) NOT NULL,
	[CountryName] [nvarchar](200) NULL,
 CONSTRAINT [PK_country_CountryID] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[OrderDetailID] [int] IDENTITY(15,1) NOT NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[order_date] [date] NULL,
	[VariationID] [int] NULL,
 CONSTRAINT [PK_orderdetails_OrderDetailID] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDetailID] [int] NULL,
	[type] [smallint] NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_payment_payment_id] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[ProductID] [int] IDENTITY(72,1) NOT NULL,
	[CategoryID] [int] NULL,
	[ProductName] [nvarchar](200) NULL,
	[Price] [float] NULL,
	[CollectionID] [int] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_product_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_img]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_img](
	[product_img_ID] [int] IDENTITY(170,1) NOT NULL,
	[thumbnail] [nvarchar](200) NULL,
	[product_img_1] [nvarchar](200) NULL,
	[product_img_2] [nvarchar](200) NULL,
	[product_img_3] [nvarchar](200) NULL,
	[product_img_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_product_img_product_img_ID] PRIMARY KEY CLUSTERED 
(
	[product_img_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[PromotionID] [int] IDENTITY(3,1) NOT NULL,
	[PromotionName] [nvarchar](200) NULL,
	[PromotionDescription] [nvarchar](max) NULL,
	[DiscountRate] [float] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[background_color] [nvarchar](50) NULL,
 CONSTRAINT [PK_promotion_PromotionID] PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleAssignment]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleAssignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_SaleAssignment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop_order]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_order](
	[shop_orderID] [int] IDENTITY(11,1) NOT NULL,
	[UserID] [int] NULL,
	[AddressID] [int] NULL,
	[Order_total] [int] NULL,
	[Order_status] [int] NOT NULL,
	[recipient] [nvarchar](200) NULL,
	[recipent_phone] [nvarchar](100) NULL,
 CONSTRAINT [PK_shop_order_shop_orderID] PRIMARY KEY CLUSTERED 
(
	[shop_orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[size_ID] [int] IDENTITY(12,1) NOT NULL,
	[size_Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_size_size_ID] PRIMARY KEY CLUSTERED 
(
	[size_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[story]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[story](
	[story_id] [int] IDENTITY(5,1) NOT NULL,
	[thumbnail] [nvarchar](200) NULL,
	[title] [nvarchar](200) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_story_story_id] PRIMARY KEY CLUSTERED 
(
	[story_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserID] [int] IDENTITY(13,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Dob] [date] NULL,
	[Sex] [smallint] NULL,
	[Role] [int] NULL,
	[Phone] [nvarchar](100) NULL,
 CONSTRAINT [PK_user_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[useraddress]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[useraddress](
	[AddressID] [int] NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userreview]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userreview](
	[UserReviewID] [int] NULL,
	[UserID] [int] NULL,
	[rating_value] [int] NULL,
	[OrderDetailID] [int] NULL,
	[comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[variation]    Script Date: 7/12/2024 1:52:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variation](
	[VariationID] [int] IDENTITY(1128,1) NOT NULL,
	[ProductID] [int] NULL,
	[color_ID] [int] NULL,
	[size_ID] [int] NULL,
	[qty_in_stock] [int] NULL,
	[product_img_ID] [int] NULL,
 CONSTRAINT [PK_variation_VariationID] PRIMARY KEY CLUSTERED 
(
	[VariationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (1, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (2, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (3, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (4, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (5, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (6, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (7, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (8, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (9, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (10, N'Thanh Cong', N'Ha Noi', N'100000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (11, N'UIH ADI', N'Hanoi', N'2333', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (12, N'anao', N'asdaf', N'12312', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (13, N'afsgasg', N'afasda', N'132123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (14, N'wewdasd', N'sdasdasd', N'13213123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (15, N'asdasdad', N'adsadas', N'123123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (16, N'4444', N'Hanoi', N'23123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (17, N'S48', N'Tokyo', N'12314', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (18, N'S48', N'Tokyo', N'13412', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (19, N'S554', N'Tokyo', N'1234', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (20, N'S34', N'Tokyo', N'3213', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (21, N'S48', N'Tokyo', N'1234', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (22, N'Hai Ba Trung', N'Ha Noi', N'3416', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (23, N'Hai Ba Trung', N'Ha Noi', N'3241', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (24, N'S54', N'Tokyo', N'3210', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (25, N'S45', N'Tokyo', N'314', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (26, N'S52', N'TOkyo', N'2131', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (27, N'DIa chi Da Nang', N'Thanh Pho Da Nang', N'9999', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (28, N'S47', N'Tokyo', N'4488', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (29, N'S34', N'Tokyo', N'655', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (30, N'asda', N'123', N'123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (31, N'bcvbcv', N'123', N'123', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (32, N'123', N'123', N'123', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (33, N'Hai Ba Trung', N'Ha Noi', N'616', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (34, N'Hai Ba Trung', N'Ha Noi', N'645', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (35, N'Giai Phong', N'Ha Noi', N'654', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (36, N'Hai Ba Trung', N'Ha Noi', N'375', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (37, N'Hai Ba Trung', N'Ha Noi', N'541', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (38, N'Hai Ba Trung', N'Ha Noi', N'341', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (39, N'Hai Ba Trung', N'Ha Noi', N'343', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (40, N'12', N'Kiên Giang', N'123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (41, N'12', N'Kiên Giang', N'123', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (42, N'12', N'Kiên Giang', N'123456', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (43, N'12', N'Kiên Giang', N'12345', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (44, N'12', N'Kiên Giang', N'123456', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (45, N'12', N'Kiên Giang', N'123456', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (46, N'Xin chào ban', N'Kiên Giang', N'12345', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (47, N'Xin chào ban', N'HA!!!!', N'123456', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (48, N'Xin chào ban', N'Kiên Giang', N'1234', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (49, N'Xin chào ban', N'Kiên Giang', N'123456', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (50, N'ádfsdgtrghtyhj', N'Kiên Giang', N'33333', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (51, N'WWWWWW', N'Kiên Giang', N'1111', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (52, N'Xin chào ban22222', N'Kiên Giang', N'1234', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (53, N'Xin chào ban', N'1111', N'111', 4, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (54, N'Xin chào ban11', N'1111', N'111', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (55, N'33333', N'333333', N'1234554654', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (56, N'5646456', N'56767867', N'9789890', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (57, N'33333', N'3333', N'333', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (58, N'1111', N'1111', N'11', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (59, N'111', N'111', N'11', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (60, N'4545644565', N'45545454', N'54354545', 4, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (61, N'111', N'111', N'111', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (62, N'1111', N'111', N'111', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (63, N'Xin chào ban', N'Kiên Giang', N'123', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (64, N'33333', N'Kiên Giang', N'3333', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (65, N'Xin chào ban', N'1111', N'1111', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (66, N'Xin chào ban', N'Kiên Giang', N'333', 2, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (67, N'33333', N'1111', N'44', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (68, N'Giồng riềng', N'Kiên Giang', N'92000', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (69, N'Ninh kiều', N'Cần thờ', N'930000', 3, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (70, N'Ninh kiều', N'112', N'22222', 1, NULL, NULL)
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (71, N'thạnh lợi, thạnh lộc, giồng riềng, kiên giang', N'Kiên Giang', N'920000', 1, N'012345671', N'Morgan Peer')
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (72, N'330 hoàng quốc việt', N'Cần thơ', N'930000', 2, N'0818649492', N'Tấn Kim')
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (73, N'Abc', N'AAA', N'92000', 2, N'0987654321', N'TEst')
INSERT [dbo].[address] ([AddressID], [addressline], [city], [postalcode], [CountryID], [phone], [fullname]) VALUES (74, N'Abc', N'AAA44444', N'850000', 4, N'0987654321', N'N/A')
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (1, 4)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (2, 5)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (4, 7)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (5, 9)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (6, 9)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (7, 9)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (8, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (9, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (10, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (11, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (12, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (14, 14)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (15, 14)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (16, 14)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (17, 14)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (18, 4)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (19, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (20, 14)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (21, 14)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (22, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (23, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (24, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (25, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (26, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (27, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (28, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (29, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (30, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (31, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (32, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (33, 8)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (34, 13)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (37, 6)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (39, 11)
INSERT [dbo].[cart] ([CartID], [UserID]) VALUES (40, 11)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 

INSERT [dbo].[cart_item] ([cart_itemID], [CartID], [ProductID], [Quantity], [VariationID]) VALUES (29, 21, 44, 1, 791)
INSERT [dbo].[cart_item] ([cart_itemID], [CartID], [ProductID], [Quantity], [VariationID]) VALUES (60, 33, 39, 1, 726)
INSERT [dbo].[cart_item] ([cart_itemID], [CartID], [ProductID], [Quantity], [VariationID]) VALUES (61, 33, 39, 1, 727)
INSERT [dbo].[cart_item] ([cart_itemID], [CartID], [ProductID], [Quantity], [VariationID]) VALUES (62, 34, 40, 2, 740)
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (1, N'DRESSES ', N'dresses.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (2, N'DENIM', N'denim.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (3, N'TEES & TANKS', N'tees.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (4, N'BOTTOMS', N'bottoms.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (5, N'TOPS', N'tops.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (6, N'SHOES & ACCESSORIES ', N'shoes.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (7, N'SWIM', N'swim.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (8, N'SHORTS & SKIRTS', N'shortandskirt.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (9, N'Result', NULL)
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (10, N'NEW ARRIVALS', N'newarrival.jpg')
INSERT [dbo].[category] ([CategoryID], [CategoryName], [Category_img]) VALUES (11, N'BEST SELLER', N'bestseller.jpg')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[collection] ON 

INSERT [dbo].[collection] ([CollectionID], [CollectionName], [collectionImg], [collection_description], [create_date], [PromotionID]) VALUES (1, N'Summer Collection', N'1.jpg', N'New Summer Collection', CAST(N'2023-07-23T17:18:04.0000000' AS DateTime2), 2)
INSERT [dbo].[collection] ([CollectionID], [CollectionName], [collectionImg], [collection_description], [create_date], [PromotionID]) VALUES (2, N'Winter Collection', N'winter.jpg', N'New Winterr Collection', NULL, 2)
INSERT [dbo].[collection] ([CollectionID], [CollectionName], [collectionImg], [collection_description], [create_date], [PromotionID]) VALUES (3, N'Spring Collection', N'spring.jpg', N'New Spring Collection', NULL, 2)
INSERT [dbo].[collection] ([CollectionID], [CollectionName], [collectionImg], [collection_description], [create_date], [PromotionID]) VALUES (4, N'Autumn Collection', N'Autumn.jpg', N'New Autumn Collection', NULL, 2)
SET IDENTITY_INSERT [dbo].[collection] OFF
GO
SET IDENTITY_INSERT [dbo].[color] ON 

INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (1, N'White')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (2, N'Blue')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (3, N'Black')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (4, N'Grey')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (5, N'Green')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (6, N'Brown')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (7, N'Orange')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (8, N'Pink')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (9, N'Tan')
INSERT [dbo].[color] ([color_ID], [color_Name]) VALUES (10, N'Red')
SET IDENTITY_INSERT [dbo].[color] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([CountryID], [CountryName]) VALUES (1, N'Vietnam')
INSERT [dbo].[country] ([CountryID], [CountryName]) VALUES (2, N'Japan')
INSERT [dbo].[country] ([CountryID], [CountryName]) VALUES (3, N'Lao')
INSERT [dbo].[country] ([CountryID], [CountryName]) VALUES (4, N'Thailand')
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([id], [name]) VALUES (1, N'Pending')
INSERT [dbo].[Order_Status] ([id], [name]) VALUES (2, N'Prepared Order')
INSERT [dbo].[Order_Status] ([id], [name]) VALUES (3, N'Package Order')
INSERT [dbo].[Order_Status] ([id], [name]) VALUES (4, N'Delivering')
INSERT [dbo].[Order_Status] ([id], [name]) VALUES (5, N'Successfully')
INSERT [dbo].[Order_Status] ([id], [name]) VALUES (6, N'Confirm')
INSERT [dbo].[Order_Status] ([id], [name]) VALUES (7, N'Cancel')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (50, 38, 32, 1, 2700000, CAST(N'2024-06-23' AS Date), 702)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (51, 48, 32, 2, 5792600, CAST(N'2024-06-23' AS Date), 833)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (52, 45, 33, 3, 8688900, CAST(N'2024-06-23' AS Date), 798)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (53, 14, 34, 2, 4320000, CAST(N'2024-06-23' AS Date), 245)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (54, 14, 34, 2, 4320000, CAST(N'2024-06-23' AS Date), 251)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (55, 55, 35, 1, 736400, CAST(N'2024-06-24' AS Date), 938)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (56, 55, 35, 2, 1472800, CAST(N'2024-06-24' AS Date), 953)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (57, 16, 36, 1, 1423600, CAST(N'2024-06-24' AS Date), 278)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (58, 16, 36, 1, 1423600, CAST(N'2024-06-24' AS Date), 287)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (59, 55, 37, 1, 736400, CAST(N'2024-06-24' AS Date), 939)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (60, 55, 37, 1, 736400, CAST(N'2024-06-24' AS Date), 952)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (61, 38, 40, 2, 5400000, CAST(N'2024-06-26' AS Date), 705)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (62, 38, 40, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (63, 61, 40, 1, 981800, CAST(N'2024-06-26' AS Date), 1055)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (64, 62, 40, 1, 1564700, CAST(N'2024-06-26' AS Date), 1056)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (65, 38, 41, 1, 2700000, CAST(N'2024-06-26' AS Date), 705)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (66, 38, 41, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (67, 38, 42, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (68, 38, 42, 2, 5400000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (69, 38, 43, 1, 2700000, CAST(N'2024-06-26' AS Date), 705)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (70, 38, 43, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (71, 38, 43, 1, 2700000, CAST(N'2024-06-26' AS Date), 708)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (72, 38, 44, 1, 2700000, CAST(N'2024-06-26' AS Date), 701)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (73, 38, 44, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (74, 38, 44, 1, 2700000, CAST(N'2024-06-26' AS Date), 716)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (75, 38, 45, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (76, 38, 45, 1, 2700000, CAST(N'2024-06-26' AS Date), 715)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (77, 38, 46, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (78, 38, 46, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (79, 38, 47, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (80, 38, 47, 1, 2700000, CAST(N'2024-06-26' AS Date), 707)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (81, 38, 47, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (84, 38, 49, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (85, 38, 49, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (86, 38, 49, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (87, 38, 50, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (88, 38, 50, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (89, 38, 50, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (90, 38, 51, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (91, 38, 51, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (92, 38, 51, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (93, 38, 52, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (94, 38, 52, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (95, 38, 52, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (96, 38, 53, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (97, 38, 53, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (98, 38, 53, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (111, 38, 53, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (112, 38, 53, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (113, 38, 53, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (114, 38, 57, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (115, 38, 57, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (116, 38, 57, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (120, 38, 59, 1, 2700000, CAST(N'2024-06-26' AS Date), 700)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (121, 38, 59, 1, 2700000, CAST(N'2024-06-26' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (122, 38, 59, 1, 2700000, CAST(N'2024-06-26' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (123, 38, 60, 1, 2700000, CAST(N'2024-06-26' AS Date), 702)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (124, 38, 60, 1, 2700000, CAST(N'2024-06-26' AS Date), 705)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (125, 38, 60, 1, 2700000, CAST(N'2024-06-26' AS Date), 707)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (127, 38, 63, 1, 2700000, CAST(N'2024-07-05' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (128, 38, 64, 1, 2700000, CAST(N'2024-07-06' AS Date), 706)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (129, 38, 64, 1, 2700000, CAST(N'2024-07-06' AS Date), 712)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (130, 38, 65, 1, 2700000, CAST(N'2024-07-06' AS Date), 718)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (131, 64, 66, 1, 1491100, CAST(N'2024-07-06' AS Date), 1068)
INSERT [dbo].[orderdetails] ([OrderDetailID], [ProductID], [OrderID], [Quantity], [Price], [order_date], [VariationID]) VALUES (132, 64, 66, 1, 1491100, CAST(N'2024-07-06' AS Date), 1069)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (3, 4, N'The Corduroy Wide-Leg Pant', 2405400, 1, N'Featuring a butt-boosting high rise, welt pockets, and a ’70s-inspired yoke, the Corduroy Wide-Leg Pant gives a whole new meaning to flattering-but-comfy bottoms. The best part? It’s made of our fine-wale corduroy, which means the texture is visibly smaller and softer than that of your average cords—and a whole lot cuter.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (4, 4, N'The Dream Pant', 2160000, 1, N'Made of soft double-knit fabric, the Dream Pant® features an elastic waist, pintuck detailing, and a sleek tapered leg. Plus, it has a flat finish, so it looks polished, but it’s comfortable enough to nap in. The best part? It’s wrinkle resistant. From morning meetings to afternoon errands to late-night lounging—this pant looks (and feels) like a dream.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (5, 4, N'The Easy Pant', 2160000, 1, N'The Easy Pant is comfortable from hip to hem, thanks to its lightweight cotton twill fabric, breathable silhouette, and pull-on waistband. Because putting on pants shouldn’t be hard.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (6, 4, N'The Organic Straight-Leg Pant', 2405400, 1, N'The Organic Straight-Leg Pant is back and better than ever. Featuring the same waist-nipping, butt-boosting, and leg-lengthening look you love from the original Straight-Leg Crop Pant—now in organic twill. Soft is an understatement. Organic cotton uses crop rotation, cover crops, and organic fertilizers instead of toxic chemical fertilizers or pesticides—which means cleaner water, lower water usage, lower pesticide use, healthier soil, and a safer working environment for cotton farmers, compared to conventional cotton.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (7, 4, N'The Perform Legging', 1669100, 1, N'Made of premium performance fabric from a renowned Italian mill, the Perform Legging® features an extra-high waist, minimal seams, an interior pocket, and lightweight compression with technical sweat-wicking properties. Plus, it’s comprised of 58% recycled nylon.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (8, 4, N'The Relaxed Chino', 2896300, 1, N'Our Relaxed Chino is a high-waisted pant with front pleats crafted in a buttery soft, 100% TENCEL™ Lyocell fabric. It features a cool curved leg (similar to the Utility Barrel Pant) and asymmetrical back pockets: one with a button-back flap pocket and one with a slip pocket. These pants are slouchy, so if you want a slimmer fit, try sizing down.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (10, 4, N'The Structured Cotton Belted Pant', 1202700, 1, N'A classic jogger silhouette, made for your everyday, The ReTrack Jogger is your new live-in bottoms. Featuring that signature elasticated waistband and adjustable draw-string plus tapered leg with ribbed cuffs, these pants have a roomy, relaxed fit to move effortlessly with you throughout your day. Made with a mix of recycled cotton and polyester, it has a fleecy, cozy texture for all the feels.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (11, 4, N'The Utility Barrel Pant', 2405400, 1, N'Made of lightweight cotton twill with just a touch of stretch, the Utility Barrel Pant is complete with a waist-nipping high rise, a cool curved leg, and an easy cropped length. Plus, it has utilitarian details, like accent stitching and patch pockets for a craftsman-inspired look.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (12, 4, N'The Way-High Drape Pant', 3141800, 1, N'Made of 100% linen so they’re breathable, light, and slightly sheer—the perfect alternative to denim for warmer days. Plus they are extra versatile so you can dress them up for weddings, or pair them with a tank for a more casual look.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (13, 8, N'The A-Line Denim Short', 1669100, 1, N'The A-Line Denim Short features a waist-nipping high rise, a zip-fly closure, an easy 5.5" inseam, and a flattering A-line shape. Plus, it’s made of premium non-stretch organic cotton, which means it has a gutsy feel that will stand the test of time.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (14, 8, N'The Denim Utility Short', 2160000, 1, N'Made of TENCEL™ Lyocell with REFIBRA™, The Denim Utility Short features an A-Line shaped style with a pull-on elasticated waistband. It features slash pockets with utility stitching details, a back patch pocket for a craftsman-inspired look, and a 5" inseam in our softest, most drapey denim.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (15, 8, N'The Dream Maxi Skirt', 1914500, 1, N'The Dream Maxi Skirt is a versatile style with minimalist ‘90s vibes. It features a high-waisted, straight silhouette with a tall back slit for easy movement. A maxi skirt length, it has an elastic trim at the waist and invisible side zipper. Made with a soft, double-knit fabric with a hint of stretch to hug in just the right places.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (16, 8, N'The Dream Mini Skirt', 1423600, 1, N'The Dream Mini Skirt is a high-waisted mini skirt with an elastic trim at the waist. It has a gentle A-line shape and is fastened with an invisible side zipper. Made with an oh-so soft, double-knit fabric with a hint of stretch to fit like a dream.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (17, 8, N'The Easy Short', 1423600, 1, N'The Easy Short is comfortable from hip to hem, thanks to its lightweight cotton twill fabric, breathable silhouette, and pull-on waistband. It’s a longer take on our Easy Short-Short—and it’s just as fuss-free.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (18, 8, N'The Linen Wrap Skirt', 3141800, 1, N'The Linen Wrap Skirt is the quintessential summer skirt featuring an attached belt that can be tied in front or to the side—we love versatility. It also has an internal button fastening, and a slightly cinched waist band for added ease and comfort. We love this skirt paired with The Linen High-Neck Tank for the perfectly polished linen set.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (19, 8, N'The Perform Bike Short', 1178200, 1, N'Made of premium performance fabric from a renowned Italian mill, the Perform Bike Short features an extra-high waist, minimal seams, an interior pocket, and lightweight compression with technical sweat-wicking properties. Plus, it’s comprised of 58% recycled nylon.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (20, 8, N'The Tencel Way-High Drape Short', 1914500, 1, N'We took your favorite The Way-High® Drape Pant and cropped it into The Way-High® Drape Short. Same highest-rise silhouette, handy side pockets, and that distinctive front pleat, now in cool city shorts. Made with TENCEL™ Lyocell and cotton blend, these shorts will keep you cool and composed all season long.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (21, 7, N'The Bikini Bottom', 343600, 2, N'The Bikini Bottom features a classic bikini cut, and moderate bum coverage. Plus, it’s made of fully lined Italian fabric with technical quick-drying and fade-resistant properties, which makes it versatile enough for every summer activity. Even better? This style was fit-tested on 112 different women to ensure that it feels comfortable, looks flattering, and stays put—no matter how you move.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (22, 7, N'The ReNew Plunge Triangle Top', 490900, 2, N'We reimagined our ultra-flattering, traditional bikini top to now include adjustable straps in the shoulders and an adjustable swan hook in the back strap for ultimate comfort and support.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (23, 7, N'The Square-Neck Bikini Top', 441800, 2, N'The Square-Neck Bikini Top features a modern square neckline, removable pads, and an adjustable band and straps for an easy fit. Plus, it’s made of fully lined Italian fabric with technical quick-drying and fade-resistant properties, which makes it versatile enough for every summer activity. Even better? This style was fit-tested on 112 different women to ensure that it feels comfortable, looks flattering, and stays put—no matter how you move.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (24, 7, N'The Square-Neck One-Piece', 945000, 2, N'The Square-Neck One-Piece features a modern square neckline, minimal topstitching, a built-in shelf bra, removable pads, and wide straps for an easy fit. Plus, it’s made of fully lined Italian fabric with technical quick-drying and fade-resistant properties, which makes it versatile enough for every summer activity. Even better? This style was fit-tested on 112 different women to ensure that it feels comfortable, looks flattering, and stays put—no matter how you move.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (25, 7, N'The String One-Piece', 515500, 2, N'Who said lower impact can’t be sexy? The String One-Piece features a softened square neckline, a low back, attractive crossover tie straps to help adjust the fit in the back, and a built-in shelf bra with removable pads for a super-supportive fit.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (26, 7, N'The Thigh-High Bikini Bottom', 257700, 2, N'The Thigh-High Bikini Bottom features a high-waist, high-leg, and a slightly cheeky cut that has flattering stomach coverage while giving you legs for days.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (27, 7, N'The Triangle Bikini Top', 490900, 2, N'We reimagined our ultra-flattering, traditional bikini top to now include adjustable straps in the shoulders and an adjustable swan hook in the back strap for ultimate comfort and support.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (28, 7, N'The V-Neck One-Piece', 945000, 2, N'The V-Neck One-Piece features a deep V neckline, minimal topstitching, a built-in shelf bra, removable pads, and wide straps for an easy fit. Plus, it’s made of fully lined Italian fabric with technical quick-drying and fade-resistant properties, which makes it versatile enough for every summer activity. Even better? This style was fit-tested on 112 different women to ensure that it feels comfortable, looks flattering, and stays put—no matter how you move.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (29, 3, N'The Air Oversized Crew Tee', 736400, 2, N'Made of drapey, super-light cotton, the Oversized Crew Neck Air Tee has an intentionally oversized fit and longer sleeves for a cool, relaxed look.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (30, 3, N'The Organic Cotton Box-Cut Tee', 736400, 2, N'The Organic Cotton Box-Cut Tee features a classic crew neckline, easy short sleeves, a slightly cropped length, and a relaxed fit for a truly timeless look. Plus, it’s made of 100%, organic cotton which makes it super breathable and soft to the touch.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (31, 3, N'The Organic Cotton Crew Tee', 736400, 3, N'The Organic Cotton Crew features a boyish cut with a slim, feminine fit. Plus, it’s made of lightweight organic cotton, which makes it ultra-breathable and soft to the touch. Go on—revamp your basics.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (32, 3, N'The Organic Cotton Cutaway Tank', 736400, 3, N'Made of super-soft cotton, the Organic Cotton Cutaway Tank features a high neck and back, and a slight curve at the shoulders, which makes it extra flattering. If there’s one thing the ’90s got right, it’s the basics.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (33, 3, N'The Organic Cotton Raglan Tee', 736400, 3, N'Take your tee a little more boxy with The Organic Cotton Raglan Tee. A best-selling crewneck tee remixed with a more directional cropped, squared shape, it features extra exaggerated raglan sleeves to make a subtle statement.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (34, 3, N'The Organic Cotton Relaxed Pocket Tee', 736400, 3, N'If relaxed, borrowed from the boys is what you’re looking for from a tee then The Organic Cotton Relaxed Pocket Tee will be your new favorite. A classic crewneck silhouette, gently oversized, with dropped shoulders, short sleeves, and of course a neat patch pocket, it has a slightly longer length than our other tees. Tuck it, tie it, or let it flow loose—wear it your way.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (35, 3, N'The Organic Cotton Tie Back Tee', 981800, 3, N'Made of organic cotton, The Organic Cotton Tie Back Tee, features a classic crew neck with dolman sleeves, and adjustable tie-back details with a breezy opening in the back. The best part? It’s bra-friendly. Pair this top with any of our signature High-Waisted bottoms for the ultimate summer look.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (36, 3, N'The Pima Micro-Rib Crew Tee', 981800, 3, N'This short-sleeve crewneck tee is made of extra-fine ribbed Supima® cotton with stretch that hugs in just the right places. For days when you want t-shirt comfort with eye-catching good looks.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (37, 3, N'The Tube Top', 736400, 3, N'Made of double-layered knit fabric with a touch of stretch, the Tube Top features an iconic strapless design, a comfy close-to-the-body fit, and a no-slip grip so it won’t ride up or down. The best part? It’s complete with a built-in shelf bra, so you don’t have to worry about straps, bulky bandeaus, or feeling exposed.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (38, 2, N'The ’90s Cheeky Jean', 2700000, 3, N'Our favorite jean meets our favorite decade. Made from premium non-stretch Japanese denim for a vintage-inspired look, the ’90s Cheeky® Jean has an easy straight leg, an extra-high rise, and a butt-boosting rear fit.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (39, 2, N'The Baggy Jean', 3141800, 3, N'Meet our super-soft summer jean. Featuring our signature Way-High rise with a roomier waist and a wide leg opening for a looser fit, The Baggy Jean is light and soft to the touch due to the fabrics Tencel content.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (40, 2, N'The Gardener Jean', 3387200, 3, N'Work it wide. The Gardener Jean is a wide-leg workwear-inspired jean that plays big into utilitarian style.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (41, 2, N'The High-Rise Flare Jean', 3387200, 3, N'The High-Rise Flare is a nod to an iconic 70s fit in modern washes. Featuring our signature 11" high-rise, a form-fitting silhouette through the thigh and hips, and a flared leg shape, with a full length 31" inseam, so you can pull those platforms on. Plus it’s made with low-stretch regenerative cotton for an all day close fit.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (42, 2, N'The Low-Rise Shortie Jean', 2896300, 3, N'Low rise. Low stretch. Straight leg. Get the authentic look and feel of classic denim with this essential style. Designed to hit at the ankles, it’s the perfect choice for showing off fun socks or your favorite boots.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (43, 2, N'The Rigid Slouch Jean', 721600, 3, N'The The Summer Slouch Jean features a straight, slouchy fit that sits just right at mid-waist—the perfect summertime vibe. Made with 60% organic cotton and 40% TENCEL™ Lyocell with REFIBRA™ technology for a vintage-inspired look.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (44, 2, N'The Utility Barrel Jean', 2896300, 3, N'Made of regenerative cotton denim with just a touch of stretch, the Utility Barrel Jean is complete with a waist-nipping high rise, a cool curved leg, and an easy cropped length. Plus, it has utilitarian details, like accent stitching and patch pockets for a craftsman-inspired look.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (45, 2, N'The Way-High Jean', 2896300, 3, N'The Curvy Way-High® Jean features a two-piece contour waistband (it contains no stretch so we recommend sizing up for more ease) that accentuates your true waist and a sculpting straight leg, which fits around every curve of your body for a bouncy and lifted look. Plus, its made of premium organic cotton with a touch of stretch. Your lower half will thank you.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (46, 1, N'The Daytripper Shirtdress', 2700000, 4, N'The Day Tripper Shirtdress features classic shirt detailing with a point collar, button-front closure and chest pockets. Perfectly oversized with short sleeves and an easy high-low shirt tail hemline—so you know it’s ultra-comfortable. Pair this with sneakers or any of our Italian Leather Day Family for an instantly successful outfit.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (47, 1, N'The Dream Shift Dress', 2405400, 4, N'Made with that same soft, double-knit fabric as The Dream Pant, with a hint of stretch for that fits-like-a-dream effect, meet The Dream Shift Dress. A slim-fit crew neck, sleeveless dress in a mini length, it features a gentle A-line skirt, plus slight shaping at the front and back for a figure-flattering shape. With minimalist, ‘90s vibes, this versatile dress can be styled with sandals or sneakers, depending on the mood.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (48, 1, N'The Linen Jumpsuit', 2896300, 4, N'Easy and flattering, the Linen Jumpsuit features a modern square neckline, adjustable bra-friendly straps, an elasticized back, a removable belt, and a cropped straight leg. Plus, it’s made of soft, breathable linen, so it’s ready for all of your warm-weather adventures.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (49, 1, N'The Linen Workwear Dress', 2405400, 4, N'Made of light, breathable linen, the Linen Workwear Dress features a classic notched collar, a clean button front, relaxed short sleeves, utility-inspired patch pockets, handy side pockets, and a cool, oversized fit. Dress it up with heeled sandals, or opt for a more casual look with your favorite sneakers—either way, you’ll look (and feel) cool.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (50, 1, N'The Organic Cotton Weekend Tee Dress', 1227300, 4, N'Complete with a classic crew neckline, set-in sleeves, a front chest pocket, and a relaxed fit throughout, it’s an easy pick for warm-weather days. Trust us—your weekend won’t know what hit it.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (51, 1, N'The Ribbed Tank Dress', 1443300, 4, N'Slip into pure comfort with an elevated edge with The Ribbed Midi Dress. Its scoop neck and fitted bodice with flattering stitch chest detail keeps it contoured up top, while a little more volume in the midi-length skirt adds to its relaxed silhouette. Made with 65% viscose and 35% recycled nylon for just enough stretch, it’s finished in a refined ribbed texture. Perfect for layering, add a blazer or wear over a tee for all-season style.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (52, 1, N'The Riviera Dress', 2700000, 4, N'The Riviera Dress features a comfortable knit top and a voluminous woven bottom. The top portion is made with 94% ECOVERO™ viscose and a touch of stretch, while the skirt is made with 100% cotton for all-day breathability. The pinnacle of versatility.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (53, 1, N'The Smock Dress', 2896300, 4, N'Made of 100% cotton poplin with a subtle sheen, the Smock Dress has a comfortable, breathable feel with an effortlessly polished look. It features a form-fitting smock at the top, bra-friendly straps, hidden side pockets, and a tiered midi skirt. In other words, it’s perfect for brunches, BBQs, and everything else on your social calendar.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (54, 5, N'The Air Cami', 589100, 4, N'The Air Cami features a rounded V neckline, bra-friendly straps, a curved hem, and a relaxed fit throughout. Plus, it’s made of our lightest, most breathable cotton, so you can let the breeze in.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (55, 5, N'The Air Scoop-Neck Tee', 736400, 4, N'The Air Scoop-Neck Tee features a flattering scoop neckline, easy short sleeves, and a loose boxy fit, making it great for warm-weather days. Plus, it’s made of our lightest, most breathable cotton, so you can let the breeze in.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (56, 5, N'The Boxy Oxford', 1296000, 4, N'Made of soft, premium organic cotton, the Boxy Oxford features a classic point collar, dropped shoulders, a clean button front, oversized patch pockets, and a relaxed boxy shape. Polish it up with trousers and heels, or dress it down with jeans and sneakers for a casual-yet-put-together look. Either way, you’ll look like you know what you’re doing.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (57, 5, N'The Hemp Scoop-Neck Muscle Tee', 1227300, 4, N'This versatile, minimalist Hemp Scoop-Neck Muscle Tee is the perfect topper for any look. Featuring a relaxed, low-key fit, it has a front scoop neckline with a roll-edge trim, and neat cap sleeves. Made with 55% hemp and 45% organic cotton it has a drapey, textured finish.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (58, 5, N'The Linen Relaxed Shirt', 2160000, 4, N'Made of lightweight linen, the Linen Relaxed Shirt is our classic relaxed shirt silhouette with a natural texture for a lived-in, low-maintenance look. Plus, it’s super breathable, making this an essential linen shirt.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (59, 5, N'The Organic Cotton Slouchy V-Neck', 736400, 4, N'The Organic Cotton V-Neck Tee features a laid-back shape with a deep, open neckline. Plus, it’s made of lightweight organic cotton, which makes it ultra-breathable and soft to the touch. Go on—revamp your basics.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (60, 5, N'The Pima Micro-Rib Scoop-Neck Tee', 981800, 4, N'The Pima Micro-Rib Scoop-Neck Tee is made of super-soft, fine-ribbed cotton, with a touch of stretch that hugs in all the right places. Featuring a flattering scoop-neck, elbow-length sleeves, and a snug fit throughout, this classic tee looks great on its own or layered under your favorite cardigan.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (61, 6, N'The Baseball Cap', 981800, 4, N'The Baseball Cap is made of durable organic canvas with brushed metal hardware and tonal embroidery.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (62, 6, N'The Day Crossover Sandal', 1564700, 4, N'Made of buttery soft leather, the Day Crossover Sandal features a tapered square toe, a flexible footbed that gives with every step, and a few updates from the last rendition—like a slightly raised sole and a wider, better fit throughout. Plus, the criss-cross straps are folded over for added comfort and less chafing—talk about a win-win.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (63, 6, N'The Glove Mule in ReKnit', 2700000, 4, N'Made of our breathable ReKnit fabric, the Glove Mule has a sleek holds-you-in fit and the perfect amount of stretch for all-day comfort. Complete with a modern square toe, textured rib detailing, a walkable heel, and a cushioned insole, this shoe fits like a glove and looks damn good. Plus its made from renewed plastic bottles (five per pair, to be exact), so you and the planet can look your best.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (64, 6, N'The Italian Leather Day Glove', 1491100, 4, N'The Day Glove is made of buttery soft leather that molds to your foot for a perfect, custom fit. With features like a back pull tab, side vents, a rubber sole, and a cushioned insole, it is truly up for anything.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (65, 6, N'The Modern Loafer', 4049900, 4, N'Made from buttery-soft leather, this 2.0 take features a sleek tapered toe, stitch detailing, and a slightly thicker stacked heel. Plus, we’ve added additional padding and a foam-cushioned insole, so there’s zero break-in needed for your first wear. Dress it up with a trench and trousers or down with a pullover and sweatpants—it looks good with (literally) anything.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (66, 6, N'The Organic Cotton No-Show Sock 3-Pack', 687300, 4, N'The Organic Cotton No-Show Sock 3-Pack is sneaker and bootie ready. Made of super-soft organic cotton (hence the name) it features silicone pads at the heels to ensure you won’t get caught slipping. Once they’re on, no one will ever know if you’re wearing socks—ta-da, magic.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (67, 6, N'The ReKnit City Flatform Sandal', 3313600, 4, N'Summer breeze feels fine in The ReKnit City Flatform Sandal. Featuring a textured, ReKnit recycled polyester crisscross upper style, and an EVA midsole and rubber outsole with leather welts. Slip them on and off with ease—these sandals are ready to take on your Summer festivities. Plus, made with our breathable ReKnit fabric, these are made for ultimate')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (68, 6, N'The Renew Transit Catch-All Case', 859100, 4, N'The Renew Transit Catch-All Case features five interior drop-in pockets and one exterior zip pocket, which makes it perfect for organizing toiletries (and other small things). Even better? It’s designed to snap down for compact travel or roll back for easy access. Oh, and it’s made from 100% recycled polyester.*')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (69, 6, N'The ReNew Transit Sling', 1350000, 4, N'The ReNew Transit Sling is an easy, throw-on bag for stashing your essentials. It has an external zippered pocket at the back for quick access, and features an adjustable shoulder strap with a quick release buckle. It’s made with 100% recycled polyester*.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (70, 6, N'The ReNew Transit Weekender', 2331800, 4, N'The ReNew Transit Weekender is fully featured—padded laptop sleeve, two water bottle holders, exterior zip pocket, luggage handle pass-through (thats also a pocket), and multiple ways to carry: crossbody, shoulder, or in-hand. Oh, and it’s made from 100% recycled polyester.*')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (71, 3, N'The Supima Sleeveless Top', 859100, 4, N'The Supima® Sleeveless Top is made of extra-fine Supima® cotton with just a touch of stretch to hug in all the right places. Featuring a square neckline, this cropped tank adds the perfect put-together polish to any look, whether dressed up with a skirt or paired with denim for a more low-key take.')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (72, 2, N'San rphamar 1', 444, 3, N'4444')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (73, 2, N'San rphamar 1', 444, 3, N'4444')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (74, 2, N'San rphamar 1', 444, 3, N'4444')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (75, 2, N'San rphamar 1', 444, 3, N'4444')
INSERT [dbo].[product] ([ProductID], [CategoryID], [ProductName], [Price], [CollectionID], [description]) VALUES (76, 2, N'San rphamar 1', 444, 3, N'4444')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_img] ON 

INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (5, N'thumbnail_The Corduroy Wide-Leg Pant_Black.jpg', N'1_The Corduroy Wide-Leg Pant_Black.jpg', N'2_The Corduroy Wide-Leg Pant_Black.jpg', N'3_The Corduroy Wide-Leg Pant_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (6, N'thumbnail_The Corduroy Wide-Leg Pant_Brown.jpg', N'1_The Corduroy Wide-Leg Pant_Brown.jpg', N'2_The Corduroy Wide-Leg Pant_Brown.jpg', N'2_The Corduroy Wide-Leg Pant_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (7, N'thumbnail_The Corduroy Wide-Leg Pant_White.jpg', N'1_The Corduroy Wide-Leg Pant_White.jpg', N'2_The Corduroy Wide-Leg Pant_White.jpg', N'2_The Corduroy Wide-Leg Pant_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (8, N'thumbnail_The Dream Pant_Black.jpg', N'1_The Dream Pant_Black.jpg', N'2_The Dream Pant_Black.jpg', N'3_The Dream Pant_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (9, N'thumbnail_The Dream Pant_Blue.jpg', N'1_The Dream Pant_Blue.jpg', N'2_The Dream Pant_Blue.jpg', N'2_The Dream Pant_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (10, N'thumbnail_The Dream Pant_Brown.jpg', N'1_The Dream Pant_Brown.jpg', N'2_The Dream Pant_Brown.jpg', N'2_The Dream Pant_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (11, N'thumbnail_The Dream Pant_Green.jpg', N'1_The Dream Pant_Green.jpg', N'2_The Dream Pant_Green.jpg', N'2_The Dream Pant_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (12, N'thumbnail_The Easy Pant_Black.jpg', N'1_The Easy Pant_Black.jpg', N'2_The Easy Pant_Black.jpg', N'3_The Easy Pant_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (13, N'thumbnail_The Easy Pant_Blue.jpg', N'1_The Easy Pant_Blue.jpg	', N'2_The Easy Pant_Blue.jpg	', N'3_The Easy Pant_Blue.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (14, N'thumbnail_The Easy Pant_Green.jpg	', N'1_The Easy Pant_Green.jpg	', N'2_The Easy Pant_Green.jpg	', N'3_The Easy Pant_Green.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (15, N'thumbnail_The Easy Pant_White.jpg	', N'1_The Easy Pant_White.jpg	', N'2_The Easy Pant_White.jpg	', N'3_The Easy Pant_White.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (16, N'thumbnail_The Organic Straight-Leg Pant_Black.jpg	', N'1_The Organic Straight-Leg Pant_Black.jpg	', N'2_The Organic Straight-Leg Pant_Black.jpg	', N'2_The Organic Straight-Leg Pant_Black.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (17, N'thumbnail_The Organic Straight-Leg Pant_Blue.jpg	', N'1_The Organic Straight-Leg Pant_Blue.jpg	', N'2_The Organic Straight-Leg Pant_Blue.jpg	', N'2_The Organic Straight-Leg Pant_Blue.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (18, N'thumbnail_The Organic Straight-Leg Pant_Brown.jpg	', N'1_The Organic Straight-Leg Pant_Brown.jpg	', N'2_The Organic Straight-Leg Pant_Brown.jpg	', N'3_The Organic Straight-Leg Pant_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (19, N'thumbnail_The Organic Straight-Leg Pant_White.jpg	', N'1_The Organic Straight-Leg Pant_White.jpg	', N'2_The Organic Straight-Leg Pant_White.jpg	', N'3_The Organic Straight-Leg Pant_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (20, N'thumbnail_The Perform Legging_Black.jpg	', N'1_The Perform Legging_Black.jpg	', N'2_The Perform Legging_Black.jpg	', N'2_The Perform Legging_Black.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (21, N'thumbnail_The Perform Legging_Blue.jpg', N'1_The Perform Legging_Blue.jpg	', N'2_The Perform Legging_Blue.jpg	', N'2_The Perform Legging_Blue.jpg	', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (22, N'thumbnail_The Relaxed Chino_Black.jpg', N'1_The Relaxed Chino_Black.jpg', N'2_The Relaxed Chino_Black.jpg', N'3_The Relaxed Chino_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (23, N'thumbnail_The Relaxed Chino_Brown.jpg', N'1_The Relaxed Chino_Brown.jpg', N'2_The Relaxed Chino_Brown.jpg', N'2_The Relaxed Chino_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (24, N'thumbnail_The Relaxed Chino_Tan.jpg', N'1_The Relaxed Chino_Tan.jpg', N'2_The Relaxed Chino_Tan.jpg', N'2_The Relaxed Chino_Tan.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (25, N'thumbnail_The Structured Cotton Belted Pant_Blue.jpg', N'1_The Structured Cotton Belted Pant_Blue.jpg', N'2_The Structured Cotton Belted Pant_Blue.jpg', N'2_The Structured Cotton Belted Pant_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (26, N'thumbnail_The Structured Cotton Belted Pant_Brown.jpg', N'1_The Structured Cotton Belted Pant_Brown.jpg', N'2_The Structured Cotton Belted Pant_Brown.jpg', N'2_The Structured Cotton Belted Pant_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (27, N'thumbnail_The Structured Cotton Belted Pant_White.jpg', N'1_The Structured Cotton Belted Pant_White.jpg', N'2_The Structured Cotton Belted Pant_White.jpg', N'3_The Structured Cotton Belted Pant_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (28, N'thumbnail_The Utility Barrel Pant_Black.jpg', N'1_The Utility Barrel Pant_Black.jpg', N'2_The Utility Barrel Pant_Black.jpg', N'3_The Utility Barrel Pant_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (29, N'thumbnail_The Utility Barrel Pant_Green.jpg', N'1_The Utility Barrel Pant_Green.jpg', N'2_The Utility Barrel Pant_Green.jpg', N'3_The Utility Barrel Pant_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (30, N'thumbnail_The Utility Barrel Pant_Red.jpg', N'1_The Utility Barrel Pant_Red.jpg', N'2_The Utility Barrel Pant_Red.jpg', N'3_The Utility Barrel Pant_Red.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (31, N'thumbnail_The Utility Barrel Pant_White.jpg', N'1_The Utility Barrel Pant_White.jpg', N'2_The Utility Barrel Pant_White.jpg', N'3_The Utility Barrel Pant_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (32, N'thumbnail_The Way-High Drape Pant_Green.jpg', N'1_The Way-High Drape Pant_Green.jpg', N'2_The Way-High Drape Pant_Green.jpg', N'2_The Way-High Drape Pant_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (33, N'thumbnail_The A-Line Denim Short_Black.jpg', N'1_The A-Line Denim Short_Black.jpg', N'2_The A-Line Denim Short_Black.jpg', N'3_The A-Line Denim Short_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (34, N'thumbnail_The A-Line Denim Short_Blue.jpg', N'1_The A-Line Denim Short_Blue.jpg', N'2_The A-Line Denim Short_Blue.jpg', N'3_The A-Line Denim Short_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (35, N'thumbnail_The A-Line Denim Short_Tan.jpg', N'1_The A-Line Denim Short_Tan.jpg', N'2_The A-Line Denim Short_Tan.jpg', N'3_The A-Line Denim Short_Tan.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (36, N'thumbnail_The Denim Utility Short_Black.jpg', N'1_The Denim Utility Short_Black.jpg', N'2_The Denim Utility Short_Black.jpg', N'3_The Denim Utility Short_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (37, N'thumbnail_The Denim Utility Short_Blue.jpg', N'1_The Denim Utility Short_Blue.jpg', N'2_The Denim Utility Short_Blue.jpg', N'3_The Denim Utility Short_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (38, N'thumbnail_The Denim Utility Short_Gray.jpg', N'1_The Denim Utility Short_Gray.jpg', N'2_The Denim Utility Short_Gray.jpg', N'3_The Denim Utility Short_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (39, N'thumbnail_The Dream Maxi Skirt_Black.jpg', N'1_The Dream Maxi Skirt_Black.jpg', N'2_The Dream Maxi Skirt_Black.jpg', N'3_The Dream Maxi Skirt_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (40, N'thumbnail_The Dream Maxi Skirt_Brown.jpg', N'1_The Dream Maxi Skirt_Brown.jpg', N'2_The Dream Maxi Skirt_Brown.jpg', N'3_The Dream Maxi Skirt_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (41, N'thumbnail_The Dream Mini Skirt_Black.jpg', N'1_The Dream Mini Skirt_Black.jpg', N'2_The Dream Mini Skirt_Black.jpg', N'3_The Dream Mini Skirt_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (42, N'thumbnail_The Dream Mini Skirt_Brown.jpg', N'1_The Dream Mini Skirt_Brown.jpg', N'2_The Dream Mini Skirt_Brown.jpg', N'3_The Dream Mini Skirt_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (43, N'thumbnail_The Easy Short_Black.jpg', N'1_The Easy Short_Black.jpg', N'2_The Easy Short_Black.jpg', N'3_The Easy Short_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (44, N'thumbnail_The Easy Short_White.jpg', N'1_The Easy Short_White.jpg', N'2_The Easy Short_White.jpg', N'3_The Easy Short_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (45, N'thumbnail_The Linen Wrap Skirt_Black.jpg', N'1_The Linen Wrap Skirt_Black.jpg', N'2_The Linen Wrap Skirt_Black.jpg', N'3_The Linen Wrap Skirt_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (46, N'thumbnail_The Linen Wrap Skirt_Green.jpg', N'1_The Linen Wrap Skirt_Green.jpg', N'2_The Linen Wrap Skirt_Green.jpg', N'3_The Linen Wrap Skirt_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (47, N'thumbnail_The Perform Bike Short_Black.jpg', N'1_The Perform Bike Short_Black.jpg', N'2_The Perform Bike Short_Black.jpg', N'3_The Perform Bike Short_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (48, N'thumbnail_The Tencel Way-High Drape Short_Black.jpg', N'1_The Tencel Way-High Drape Short_Black.jpg', N'2_The Tencel Way-High Drape Short_Black.jpg', N'3_The Tencel Way-High Drape Short_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (49, N'thumbnail_The Tencel Way-High Drape Short_Brown.jpg', N'1_The Tencel Way-High Drape Short_Brown.jpg', N'2_The Tencel Way-High Drape Short_Brown.jpg', N'3_The Tencel Way-High Drape Short_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (50, N'thumbnail_The Tencel Way-High Drape Short_Pink.jpg', N'1_The Tencel Way-High Drape Short_Pink.jpg', N'2_The Tencel Way-High Drape Short_Pink.jpg', N'3_The Tencel Way-High Drape Short_Pink.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (51, N'thumbnail_The Bikini Bottom_Black.jpg', N'1_The Bikini Bottom_Black.jpg', N'2_The Bikini Bottom_Black.jpg', N'3_The Bikini Bottom_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (52, N'thumbnail_The Bikini Bottom_Blue.jpg', N'1_The Bikini Bottom_Blue.jpg', N'2_The Bikini Bottom_Blue.jpg', N'3_The Bikini Bottom_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (53, N'thumbnail_The Bikini Bottom_Red.jpg', N'1_The Bikini Bottom_Red.jpg', N'2_The Bikini Bottom_Red.jpg', N'3_The Bikini Bottom_Red.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (54, N'thumbnail_The ReNew Plunge Triangle Top_Black.jpg', N'1_The ReNew Plunge Triangle Top_Black.jpg', N'2_The ReNew Plunge Triangle Top_Black.jpg', N'3_The ReNew Plunge Triangle Top_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (55, N'thumbnail_The ReNew Plunge Triangle Top_Blue.jpg', N'1_The ReNew Plunge Triangle Top_Blue.jpg', N'2_The ReNew Plunge Triangle Top_Blue.jpg', N'3_The ReNew Plunge Triangle Top_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (56, N'thumbnail_The ReNew Plunge Triangle Top_Green.jpg', N'1_The ReNew Plunge Triangle Top_Green.jpg', N'2_The ReNew Plunge Triangle Top_Green.jpg', N'3_The ReNew Plunge Triangle Top_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (57, N'thumbnail_The Square-Neck Bikini Top_Black.jpg', N'1_The Square-Neck Bikini Top_Black.jpg', N'2_The Square-Neck Bikini Top_Black.jpg', N'3_The Square-Neck Bikini Top_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (58, N'thumbnail_The Square-Neck Bikini Top_Blue.jpg', N'1_The Square-Neck Bikini Top_Blue.jpg', N'2_The Square-Neck Bikini Top_Blue.jpg', N'3_The Square-Neck Bikini Top_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (59, N'thumbnail_The Square-Neck Bikini Top_Green.jpg', N'1_The Square-Neck Bikini Top_Green.jpg', N'2_The Square-Neck Bikini Top_Green.jpg', N'3_The Square-Neck Bikini Top_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (60, N'thumbnail_The Square-Neck One-Piece_Black.jpg', N'1_The Square-Neck One-Piece_Black.jpg', N'2_The Square-Neck One-Piece_Black.jpg', N'3_The Square-Neck One-Piece_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (61, N'thumbnail_The Square-Neck One-Piece_Blue.jpg', N'1_The Square-Neck One-Piece_Blue.jpg', N'2_The Square-Neck One-Piece_Blue.jpg', N'3_The Square-Neck One-Piece_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (62, N'thumbnail_The Square-Neck One-Piece_Green.jpg', N'1_The Square-Neck One-Piece_Green.jpg', N'2_The Square-Neck One-Piece_Green.jpg', N'3_The Square-Neck One-Piece_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (63, N'thumbnail_The String One-Piece_Black.jpg', N'1_The String One-Piece_Black.jpg', N'2_The String One-Piece_Black.jpg', N'3_The String One-Piece_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (64, N'thumbnail_The Thigh-High Bikini Bottom_Black.jpg', N'1_The Thigh-High Bikini Bottom_Black.jpg', N'2_The Thigh-High Bikini Bottom_Black.jpg', N'3_The Thigh-High Bikini Bottom_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (65, N'thumbnail_The Thigh-High Bikini Bottom_Blue.jpg', N'1_The Thigh-High Bikini Bottom_Blue.jpg', N'2_The Thigh-High Bikini Bottom_Blue.jpg', N'3_The Thigh-High Bikini Bottom_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (66, N'thumbnail_The Thigh-High Bikini Bottom_Green.jpg', N'1_The Thigh-High Bikini Bottom_Green.jpg', N'2_The Thigh-High Bikini Bottom_Green.jpg', N'3_The Thigh-High Bikini Bottom_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (67, N'thumbnail_The Triangle Bikini Top_Black.jpg', N'1_The Triangle Bikini Top_Black.jpg', N'2_The Triangle Bikini Top_Black.jpg', N'3_The Triangle Bikini Top_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (68, N'thumbnail_The Triangle Bikini Top_Blue.jpg', N'1_The Triangle Bikini Top_Blue.jpg', N'2_The Triangle Bikini Top_Blue.jpg', N'3_The Triangle Bikini Top_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (69, N'thumbnail_The Triangle Bikini Top_Red.jpg', N'1_The Triangle Bikini Top_Red.jpg', N'2_The Triangle Bikini Top_Red.jpg', N'3_The Triangle Bikini Top_Red.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (70, N'thumbnail_The V-Neck One-Piece_Blue.jpg', N'1_The V-Neck One-Piece_Blue.jpg', N'2_The V-Neck One-Piece_Blue.jpg', N'3_The V-Neck One-Piece_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (71, N'thumbnail_The V-Neck One-Piece_Red.jpg', N'1_The V-Neck One-Piece_Red.jpg', N'2_The V-Neck One-Piece_Red.jpg', N'3_The V-Neck One-Piece_Red.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (72, N'thumbnail_The Air Oversized Crew Tee_Black.jpg', N'1_The Air Oversized Crew Tee_Black.jpg', N'2_The Air Oversized Crew Tee_Black.jpg', N'3_The Air Oversized Crew Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (73, N'thumbnail_The Air Oversized Crew Tee_Brown.jpg', N'1_The Air Oversized Crew Tee_Brown.jpg', N'2_The Air Oversized Crew Tee_Brown.jpg', N'3_The Air Oversized Crew Tee_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (74, N'thumbnail_The Air Oversized Crew Tee_White.jpg', N'1_The Air Oversized Crew Tee_White.jpg', N'2_The Air Oversized Crew Tee_White.jpg', N'3_The Air Oversized Crew Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (75, N'thumbnail_The Organic Cotton Box-Cut Tee_Black.jpg', N'1_The Organic Cotton Box-Cut Tee_Black.jpg', N'2_The Organic Cotton Box-Cut Tee_Black.jpg', N'3_The Organic Cotton Box-Cut Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (76, N'thumbnail_The Organic Cotton Box-Cut Tee_Gray.jpg', N'1_The Organic Cotton Box-Cut Tee_Gray.jpg', N'2_The Organic Cotton Box-Cut Tee_Gray.jpg', N'3_The Organic Cotton Box-Cut Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (77, N'thumbnail_The Organic Cotton Box-Cut Tee_White.jpg', N'1_The Organic Cotton Box-Cut Tee_White.jpg', N'2_The Organic Cotton Box-Cut Tee_White.jpg', N'3_The Organic Cotton Box-Cut Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (78, N'thumbnail_The Organic Cotton Cutaway Tank_Black.jpg', N'1_The Organic Cotton Cutaway Tank_Black.jpg', N'2_The Organic Cotton Cutaway Tank_Black.jpg', N'3_The Organic Cotton Cutaway Tank_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (79, N'thumbnail_The Organic Cotton Cutaway Tank_Gray.jpg', N'1_The Organic Cotton Cutaway Tank_Gray.jpg', N'2_The Organic Cotton Cutaway Tank_Gray.jpg', N'3_The Organic Cotton Cutaway Tank_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (80, N'thumbnail_The Organic Cotton Cutaway Tank_White.jpg', N'1_The Organic Cotton Cutaway Tank_White.jpg', N'2_The Organic Cotton Cutaway Tank_White.jpg', N'3_The Organic Cotton Cutaway Tank_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (81, N'thumbnail_The Organic Cotton Raglan Tee_Black.jpg', N'1_The Organic Cotton Raglan Tee_Black.jpg', N'2_The Organic Cotton Raglan Tee_Black.jpg', N'3_The Organic Cotton Raglan Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (82, N'thumbnail_The Organic Cotton Raglan Tee_Gray.jpg', N'1_The Organic Cotton Raglan Tee_Gray.jpg', N'2_The Organic Cotton Raglan Tee_Gray.jpg', N'3_The Organic Cotton Raglan Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (83, N'thumbnail_The Organic Cotton Raglan Tee_White.jpg', N'1_The Organic Cotton Raglan Tee_White.jpg', N'2_The Organic Cotton Raglan Tee_White.jpg', N'3_The Organic Cotton Raglan Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (84, N'thumbnail_The Organic Cotton Relaxed Pocket Tee_Black.jpg', N'1_The Organic Cotton Relaxed Pocket Tee_Black.jpg', N'2_The Organic Cotton Relaxed Pocket Tee_Black.jpg', N'3_The Organic Cotton Relaxed Pocket Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (85, N'thumbnail_The Organic Cotton Relaxed Pocket Tee_Gray.jpg', N'1_The Organic Cotton Relaxed Pocket Tee_Gray.jpg', N'2_The Organic Cotton Relaxed Pocket Tee_Gray.jpg', N'3_The Organic Cotton Relaxed Pocket Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (86, N'thumbnail_The Organic Cotton Relaxed Pocket Tee_White.jpg', N'1_The Organic Cotton Relaxed Pocket Tee_White.jpg', N'2_The Organic Cotton Relaxed Pocket Tee_White.jpg', N'3_The Organic Cotton Relaxed Pocket Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (87, N'thumbnail_The Organic Cotton Tie Back Tee_Black.jpg', N'1_The Organic Cotton Tie Back Tee_Black.jpg', N'2_The Organic Cotton Tie Back Tee_Black.jpg', N'3_The Organic Cotton Tie Back Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (88, N'thumbnail_The Organic Cotton Tie Back Tee_Gray.jpg', N'1_The Organic Cotton Tie Back Tee_Gray.jpg', N'2_The Organic Cotton Tie Back Tee_Gray.jpg', N'3_The Organic Cotton Tie Back Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (89, N'thumbnail_The Organic Cotton Tie Back Tee_White.jpg', N'1_The Organic Cotton Tie Back Tee_White.jpg', N'2_The Organic Cotton Tie Back Tee_White.jpg', N'3_The Organic Cotton Tie Back Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (90, N'thumbnail_The Pima Micro-Rib Crew Tee_Black.jpg', N'1_The Pima Micro-Rib Crew Tee_Black.jpg', N'2_The Pima Micro-Rib Crew Tee_Black.jpg', N'3_The Pima Micro-Rib Crew Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (91, N'thumbnail_The Pima Micro-Rib Crew Tee_Gray.jpg', N'1_The Pima Micro-Rib Crew Tee_Gray.jpg', N'2_The Pima Micro-Rib Crew Tee_Gray.jpg', N'3_The Pima Micro-Rib Crew Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (92, N'thumbnail_The Pima Micro-Rib Crew Tee_White.jpg', N'1_The Pima Micro-Rib Crew Tee_White.jpg', N'1_The Pima Micro-Rib Crew Tee_White.jpg', N'3_The Pima Micro-Rib Crew Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (93, N'thumbnail_The Supima Sleeveless Top_Black.jpg', N'1_The Supima Sleeveless Top_Black.jpg', N'2_The Supima Sleeveless Top_Black.jpg', N'3_The Supima Sleeveless Top_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (94, N'thumbnail_The Supima Sleeveless Top_Gray.jpg', N'1_The Supima Sleeveless Top_Gray.jpg', N'2_The Supima Sleeveless Top_Gray.jpg', N'3_The Supima Sleeveless Top_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (95, N'thumbnail_The Supima Sleeveless Top_White.jpg', N'1_The Supima Sleeveless Top_White.jpg', N'2_The Supima Sleeveless Top_White.jpg', N'3_The Supima Sleeveless Top_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (96, N'thumbnail_The Tube Top_Black.jpg', N'1_The Tube Top_Black.jpg', N'2_The Tube Top_Black.jpg', N'3_The Tube Top_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (97, N'thumbnail_The Tube Top_Gray.jpg', N'1_The Tube Top_Gray.jpg', N'2_The Tube Top_Gray.jpg', N'3_The Tube Top_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (98, N'thumbnail_The Tube Top_White.jpg', N'1_The Tube Top_White.jpg', N'2_The Tube Top_White.jpg', N'3_The Tube Top_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (99, N'thumbnail_The ’90s Cheeky Jean_Black.jpg', N'1_The ’90s Cheeky Jean_Black.jpg', N'2_The ’90s Cheeky Jean_Black.jpg', N'2_The ’90s Cheeky Jean_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (100, N'thumbnail_The ’90s Cheeky Jean_Blue.jpg', N'1_The ’90s Cheeky Jean_Blue.jpg', N'2_The ’90s Cheeky Jean_Blue.jpg', N'2_The ’90s Cheeky Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (101, N'thumbnail_The ’90s Cheeky Jean_White.jpg', N'1_The ’90s Cheeky Jean_White.jpg', N'2_The ’90s Cheeky Jean_White.jpg', N'3_The ’90s Cheeky Jean_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (102, N'thumbnail_The Baggy Jean_Black.jpg', N'1_The Baggy Jean_Black.jpg', N'2_The Baggy Jean_Black.jpg', N'2_The Baggy Jean_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (103, N'thumbnail_The Baggy Jean_Blue.jpg', N'1_The Baggy Jean_Blue.jpg', N'2_The Baggy Jean_Blue.jpg', N'2_The Baggy Jean_Blue.jpg', NULL)
GO
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (104, N'thumbnail_The Baggy Jean_Grey.jpg', N'1_The Baggy Jean_Grey.jpg', N'2_The Baggy Jean_Grey.jpg', N'2_The Baggy Jean_Grey.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (105, N'thumbnail_The Gardener Jean_Blue.jpg', N'1_The Gardener Jean_Blue.jpg', N'2_The Gardener Jean_Blue.jpg', N'3_The Gardener Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (106, N'thumbnail_The Gardener Jean_Green.jpg', N'1_The Gardener Jean_Green.jpg', N'2_The Gardener Jean_Green.jpg', N'2_The Gardener Jean_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (107, N'thumbnail_The Gardener Jean_White.jpg', N'1_The Gardener Jean_White.jpg', N'2_The Gardener Jean_White.jpg', N'3_The Gardener Jean_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (108, N'thumbnail_The High-Rise Flare Jean_Blue.jpg', N'1_The High-Rise Flare Jean_Blue.jpg', N'2_The High-Rise Flare Jean_Blue.jpg', N'2_The High-Rise Flare Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (109, N'thumbnail_The Low-Rise Shortie Jean_Blue.jpg', N'1_The Low-Rise Shortie Jean_Blue.jpg', N'2_The Low-Rise Shortie Jean_Blue.jpg', N'3_The Low-Rise Shortie Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (110, N'thumbnail_The Rigid Slouch Jean_Blue.jpg', N'1_The Rigid Slouch Jean_Blue.jpg', N'2_The Rigid Slouch Jean_Blue.jpg', N'2_The Rigid Slouch Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (111, N'thumbnail_The Rigid Slouch Jean_Grey.jpg', N'1_The Rigid Slouch Jean_Grey.jpg', N'2_The Rigid Slouch Jean_Grey.jpg', N'2_The Rigid Slouch Jean_Grey.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (112, N'thumbnail_The Utility Barrel Jean_Blue.jpg', N'1_The Utility Barrel Jean_Blue.jpg', N'2_The Utility Barrel Jean_Blue.jpg', N'2_The Utility Barrel Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (113, N'thumbnail_The Way-High Jean_Blue.jpg', N'1_The Way-High Jean_Blue.jpg', N'2_The Way-High Jean_Blue.jpg', N'3_The Way-High Jean_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (114, N'thumbnail_The Daytripper Shirtdress_Black.jpg', N'1_The Daytripper Shirtdress_Black.jpg', N'2_The Daytripper Shirtdress_Black.jpg', N'2_The Daytripper Shirtdress_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (115, N'thumbnail_The Daytripper Shirtdress_White.jpg', N'1_The Daytripper Shirtdress_White.jpg', N'2_The Daytripper Shirtdress_White.jpg', N'3_The Daytripper Shirtdress_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (116, N'thumbnail_The Dream Shift Dress_Black.jpg', N'1_The Dream Shift Dress_Black.jpg', N'2_The Dream Shift Dress_Black.jpg', N'3_The Dream Shift Dress_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (117, N'thumbnail_The Dream Shift Dress_Brown.jpg', N'1_The Dream Shift Dress_Brown.jpg', N'2_The Dream Shift Dress_Brown.jpg', N'2_The Dream Shift Dress_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (118, N'thumbnail_The Linen Jumpsuit_Black.jpg', N'1_The Linen Jumpsuit_Black.jpg', N'2_The Linen Jumpsuit_Black.jpg', N'2_The Linen Jumpsuit_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (119, N'thumbnail_The Linen Jumpsuit_Green.jpg', N'1_The Linen Jumpsuit_Green.jpg', N'2_The Linen Jumpsuit_Green.jpg', N'2_The Linen Jumpsuit_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (120, N'thumbnail_The Linen Jumpsuit_Grey.jpg', N'1_The Linen Jumpsuit_Grey.jpg', N'2_The Linen Jumpsuit_Grey.jpg', N'2_The Linen Jumpsuit_Grey.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (121, N'thumbnail_The Linen Workwear Dress_Green.jpg', N'1_The Linen Workwear Dress_Green.jpg', N'1_The Linen Workwear Dress_Green.jpg', N'1_The Linen Workwear Dress_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (122, N'thumbnail_The Organic Cotton Weekend Tee Dress_Black.jpg', N'1_The Organic Cotton Weekend Tee Dress_Black.jpg', N'2_The Organic Cotton Weekend Tee Dress_Black.jpg', N'2_The Organic Cotton Weekend Tee Dress_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (123, N'thumbnail_The Ribbed Tank Dress_Black.jpg', N'1_The Ribbed Tank Dress_Black.jpg', N'2_The Ribbed Tank Dress_Black.jpg', N'2_The Ribbed Tank Dress_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (124, N'thumbnail_The Ribbed Tank Dress_Brown.jpg', N'1_The Ribbed Tank Dress_Brown.jpg', N'2_The Ribbed Tank Dress_Brown.jpg', N'3_The Ribbed Tank Dress_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (125, N'thumbnail_The Ribbed Tank Dress_White.jpg', N'1_The Ribbed Tank Dress_White.jpg', N'2_The Ribbed Tank Dress_White.jpg', N'2_The Ribbed Tank Dress_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (126, N'thumbnail_The Riviera Dress_Black.jpg', N'1_The Riviera Dress_Black.jpg', N'2_The Riviera Dress_Black.jpg', N'2_The Riviera Dress_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (127, N'thumbnail_The Riviera Dress_Blue.jpg', N'1_The Riviera Dress_Blue.jpg', N'2_The Riviera Dress_Blue.jpg', N'3_The Riviera Dress_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (128, N'thumbnail_The Smock Dress_Black.jpg', N'1_The Smock Dress_Black.jpg', N'2_The Smock Dress_Black.jpg', N'2_The Smock Dress_Black.jpg', N's')
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (129, N'thumbnail_The Air Cami_Black.jpg', N'1_The Air Cami_Black.jpg', N'2_The Air Cami_Black.jpg', N'3_The Air Cami_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (130, N'thumbnail_The Air Cami_Brown.jpg', N'1_The Air Cami_Brown.jpg', N'2_The Air Cami_Brown.jpg', N'3_The Air Cami_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (131, N'thumbnail_The Air Cami_White.jpg', N'1_The Air Cami_White.jpg', N'2_The Air Cami_White.jpg', N'3_The Air Cami_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (132, N'thumbnail_The Air Scoop-Neck Tee_Black.jpg', N'1_The Air Scoop-Neck Tee_Black.jpg', N'2_The Air Scoop-Neck Tee_Black.jpg', N'3_The Air Scoop-Neck Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (133, N'thumbnail_The Air Scoop-Neck Tee_Gray.jpg', N'1_The Air Scoop-Neck Tee_Gray.jpg', N'2_The Air Scoop-Neck Tee_Gray.jpg', N'3_The Air Scoop-Neck Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (134, N'thumbnail_The Air Scoop-Neck Tee_White.jpg', N'1_The Air Scoop-Neck Tee_White.jpg', N'2_The Air Scoop-Neck Tee_White.jpg', N'3_The Air Scoop-Neck Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (135, N'thumbnail_The Boxy Oxford_Blue.jpg', N'1_The Boxy Oxford_Blue.jpg', N'2_The Boxy Oxford_Blue.jpg', N'3_The Boxy Oxford_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (136, N'thumbnail_The Boxy Oxford_White.jpg', N'1_The Boxy Oxford_White.jpg', N'2_The Boxy Oxford_White.jpg', N'3_The Boxy Oxford_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (137, N'thumbnail_The Hemp Scoop-Neck Muscle Tee_Black.jpg', N'1_The Hemp Scoop-Neck Muscle Tee_Black.jpg', N'2_The Hemp Scoop-Neck Muscle Tee_Black.jpg', N'3_The Hemp Scoop-Neck Muscle Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (138, N'thumbnail_The Hemp Scoop-Neck Muscle Tee_Brown.jpg', N'1_The Hemp Scoop-Neck Muscle Tee_Brown.jpg', N'2_The Hemp Scoop-Neck Muscle Tee_Brown.jpg', N'3_The Hemp Scoop-Neck Muscle Tee_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (139, N'thumbnail_The Hemp Scoop-Neck Muscle Tee_White.jpg', N'1_The Hemp Scoop-Neck Muscle Tee_White.jpg', N'2_The Hemp Scoop-Neck Muscle Tee_White.jpg', N'3_The Hemp Scoop-Neck Muscle Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (140, N'thumbnail_The Linen Relaxed Shirt_Black.jpg', N'1_The Linen Relaxed Shirt_Black.jpg', N'2_The Linen Relaxed Shirt_Black.jpg', N'3_The Linen Relaxed Shirt_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (141, N'thumbnail_The Linen Relaxed Shirt_Blue.jpg', N'1_The Linen Relaxed Shirt_Blue.jpg', N'2_The Linen Relaxed Shirt_Blue.jpg', N'3_The Linen Relaxed Shirt_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (142, N'thumbnail_The Linen Relaxed Shirt_White.jpg', N'1_The Linen Relaxed Shirt_White.jpg', N'2_The Linen Relaxed Shirt_White.jpg', N'3_The Linen Relaxed Shirt_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (143, N'thumbnail_The Organic Cotton Slouchy V-Neck_Black.jpg', N'1_The Organic Cotton Slouchy V-Neck_Black.jpg', N'2_The Organic Cotton Slouchy V-Neck_Black.jpg', N'3_The Organic Cotton Slouchy V-Neck_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (144, N'thumbnail_The Organic Cotton Slouchy V-Neck_Gray.jpg', N'1_The Organic Cotton Slouchy V-Neck_Gray.jpg', N'2_The Organic Cotton Slouchy V-Neck_Gray.jpg', N'3_The Organic Cotton Slouchy V-Neck_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (145, N'thumbnail_The Organic Cotton Slouchy V-Neck_White.jpg', N'1_The Organic Cotton Slouchy V-Neck_White.jpg', N'2l_The Organic Cotton Slouchy V-Neck_White.jpg', N'3_The Organic Cotton Slouchy V-Neck_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (146, N'thumbnail_The Pima Micro-Rib Scoop-Neck Tee_Black.jpg', N'1_The Pima Micro-Rib Scoop-Neck Tee_Black.jpg', N'2_The Pima Micro-Rib Scoop-Neck Tee_Black.jpg', N'3_The Pima Micro-Rib Scoop-Neck Tee_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (147, N'thumbnail_The Pima Micro-Rib Scoop-Neck Tee_Gray.jpg', N'1_The Pima Micro-Rib Scoop-Neck Tee_Gray.jpg', N'2_The Pima Micro-Rib Scoop-Neck Tee_Gray.jpg', N'3_The Pima Micro-Rib Scoop-Neck Tee_Gray.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (148, N'thumbnail_The Pima Micro-Rib Scoop-Neck Tee_White.jpg', N'1_The Pima Micro-Rib Scoop-Neck Tee_White.jpg', N'2_The Pima Micro-Rib Scoop-Neck Tee_White.jpg', N'3_The Pima Micro-Rib Scoop-Neck Tee_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (149, N'thumbnail_The Baseball Cap_Black.jpg', N'1_The Baseball Cap_Black.jpg', N'2_The Baseball Cap_Black.jpg', N'2_The Baseball Cap_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (150, N'thumbnail_The Day Crossover Sandal_Black.jpg', N'1_The Day Crossover Sandal_Black.jpg', N'2_The Day Crossover Sandal_Black.jpg', N'2_The Day Crossover Sandal_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (151, N'thumbnail_The Glove Mule in ReKnit_Black.jpg', N'1_The Glove Mule in ReKnit_Black.jpg', N'2_The Glove Mule in ReKnit_Black.jpg', N'2_The Glove Mule in ReKnit_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (152, N'thumbnail_The Italian Leather Day Glove_Black.jpg', N'1_The Italian Leather Day Glove_Black.jpg', N'2_The Italian Leather Day Glove_Black.jpg', N'2_The Italian Leather Day Glove_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (153, N'thumbnail_The Italian Leather Day Glove_Blue.jpg', N'1_The Italian Leather Day Glove_Blue.jpg', N'2_The Italian Leather Day Glove_Blue.jpg', N'2_The Italian Leather Day Glove_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (154, N'thumbnail_The Italian Leather Day Glove_Brown.jpg', N'1_The Italian Leather Day Glove_Brown.jpg', N'2_The Italian Leather Day Glove_Brown.jpg', N'2_The Italian Leather Day Glove_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (155, N'thumbnail_The Modern Loafer_Black.jpg', N'1_The Modern Loafer_Black.jpg', N'2_The Modern Loafer_Black.jpg', N'3_The Modern Loafer_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (156, N'thumbnail_The Modern Loafer_Brown.jpg', N'1_The Modern Loafer_Brown.jpg', N'2_The Modern Loafer_Brown.jpg', N'2_The Modern Loafer_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (157, N'thumbnail_The Organic Cotton No-Show Sock 3-Pack_Black.jpg', N'1_The Organic Cotton No-Show Sock 3-Pack_Black.jpg', N'2_The Organic Cotton No-Show Sock 3-Pack_Black.jpg', N'2_The Organic Cotton No-Show Sock 3-Pack_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (158, N'thumbnail_The Organic Cotton No-Show Sock 3-Pack_White.jpg', N'1_The Organic Cotton No-Show Sock 3-Pack_White.jpg', N'2_The Organic Cotton No-Show Sock 3-Pack_White.jpg', N'2_The Organic Cotton No-Show Sock 3-Pack_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (159, N'thumbnail_The ReKnit City Flatform Sandal_Black.jpg', N'1_The ReKnit City Flatform Sandal_Black.jpg', N'2_The ReKnit City Flatform Sandal_Black.jpg', N'3_The ReKnit City Flatform Sandal_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (160, N'thumbnail_The ReKnit City Flatform Sandal_Brown.jpg', N'1_The ReKnit City Flatform Sandal_Brown.jpg', N'2_The ReKnit City Flatform Sandal_Brown.jpg', N'2_The ReKnit City Flatform Sandal_Brown.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (161, N'thumbnail_The Renew Transit Catch-All Case_Black.jpg', N'1_The Renew Transit Catch-All Case_Black.jpg', N'2_The Renew Transit Catch-All Case_Black.jpg', N'2_The Renew Transit Catch-All Case_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (162, N'thumbnail_The Renew Transit Catch-All Case_Green.jpg', N'1_The Renew Transit Catch-All Case_Green.jpg', N'2_The Renew Transit Catch-All Case_Green.jpg', N'2_The Renew Transit Catch-All Case_Green.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (163, N'thumbnail_The Renew Transit Catch-All Case_White.jpg', N'1_The Renew Transit Catch-All Case_White.jpg', N'2_The Renew Transit Catch-All Case_White.jpg', N'2_The Renew Transit Catch-All Case_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (164, N'thumbnail_The ReNew Transit Sling_Black.jpg', N'1_The ReNew Transit Sling_Black.jpg', N'2_The ReNew Transit Sling_Black.jpg', N'3_The ReNew Transit Sling_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (165, N'thumbnail_The ReNew Transit Sling_Blue.jpg', N'1_The ReNew Transit Sling_Blue.jpg', N'2_The ReNew Transit Sling_Blue.jpg', N'3_The ReNew Transit Sling_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (166, N'thumbnail_The ReNew Transit Sling_White.jpg', N'1_The ReNew Transit Sling_White.jpg', N'2_The ReNew Transit Sling_White.jpg', N'3_The ReNew Transit Sling_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (167, N'thumbnail_The ReNew Transit Weekender_Black.jpg', N'1_The ReNew Transit Weekender_Black.jpg', N'2_The ReNew Transit Weekender_Black.jpg', N'2_The ReNew Transit Weekender_Black.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (168, N'thumbnail_The ReNew Transit Weekender_Blue.jpg', N'1_The ReNew Transit Weekender_Blue.jpg', N'2_The ReNew Transit Weekender_Blue.jpg', N'2_The ReNew Transit Weekender_Blue.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (169, N'thumbnail_The ReNew Transit Weekender_White.jpg', N'1_The ReNew Transit Weekender_White.jpg', N'2_The ReNew Transit Weekender_White.jpg', N'3_The ReNew Transit Weekender_White.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (170, N'Monivongsa-Bopharam.jpg', N'Logo.PNG', N'Monivongsa-Bopharam.jpg', N'muicamau.jpg', NULL)
INSERT [dbo].[product_img] ([product_img_ID], [thumbnail], [product_img_1], [product_img_2], [product_img_3], [product_img_name]) VALUES (171, N'Monivongsa-Bopharam.jpg', N'Logo.PNG', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[product_img] OFF
GO
SET IDENTITY_INSERT [dbo].[promotion] ON 

INSERT [dbo].[promotion] ([PromotionID], [PromotionName], [PromotionDescription], [DiscountRate], [StartDate], [EndDate], [background_color]) VALUES (1, NULL, NULL, 100, CAST(N'2023-07-23' AS Date), CAST(N'9999-12-31' AS Date), NULL)
INSERT [dbo].[promotion] ([PromotionID], [PromotionName], [PromotionDescription], [DiscountRate], [StartDate], [EndDate], [background_color]) VALUES (2, N'New Summer Markdowns', NULL, 60, CAST(N'2023-07-23' AS Date), CAST(N'2023-07-25' AS Date), N'rgb(122, 117, 112)')
SET IDENTITY_INSERT [dbo].[promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'sale')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'makerting')
INSERT [dbo].[Role] ([id], [name]) VALUES (4, N'user')
INSERT [dbo].[Role] ([id], [name]) VALUES (5, N'sale manager')
INSERT [dbo].[Role] ([id], [name]) VALUES (6, N'store staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleAssignment] ON 

INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (5, 32, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (6, 33, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (7, 34, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (8, 35, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (9, 36, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (10, 37, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (11, 40, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (12, 41, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (13, 42, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (14, 43, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (15, 44, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (18, 45, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (19, 46, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (21, 47, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (22, 48, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (23, 49, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (24, 50, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (25, 51, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (26, 52, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (27, 53, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (33, 57, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (35, 59, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (36, 60, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (38, 63, 2)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (39, 64, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (40, 65, 16)
INSERT [dbo].[SaleAssignment] ([id], [orderId], [userId]) VALUES (41, 66, 16)
SET IDENTITY_INSERT [dbo].[SaleAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[shop_order] ON 

INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (32, 14, 34, 14321200, 5, N'Quang Huy', N'034619')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (33, 4, 35, 26102700, 5, N'John Wick', N'037774366')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (34, 5, 36, 17316000, 5, N'Tim Peer', N'032911916')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (35, 13, 37, 3718000, 2, N'Nguyen Huong', N'03441336')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (36, 13, 38, 2883200, 6, N'Nguyen Huong', N'098494')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (37, 14, 39, 1508800, 5, N'Quang Huy', N'034984')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (38, 13, 40, NULL, 1, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (39, 13, 41, NULL, 1, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (40, 13, 42, 16082500, 7, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (41, 13, 43, 5436000, 6, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (42, 13, 44, 13536000, 6, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (43, 13, 45, 8136000, 1, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (44, 13, 46, 8136000, 6, N'Nguyen Huong', N'124345')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (45, 13, 47, 5436000, 1, N'Nguyen Huong', N'1234')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (46, 13, 48, 5436000, 2, N'Nguyen Huong', N'124345')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (47, 13, 49, 8136000, 7, N'Tan Kim', N'123456')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (48, 13, 50, NULL, 1, N'AHHwnkljcsdnfnkol', N'33333')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (49, 13, 51, 8136000, 6, N'AWWW', N'1111')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (50, 13, 52, 8136000, 1, N'Nguyen Huong', N'123456')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (51, 13, 53, 8136000, 6, N'Nguyen Huong', N'1111')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (52, 13, 54, 8136000, 1, N'Nguyen Huong', N'111111')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (53, 13, 58, 16236000, 5, N'1223333', N'122344365476587')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (57, 13, 59, 8136000, 2, N'Nguyen Huong', N'111111')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (59, 13, 61, 8136000, 1, N'Nguyen Huong', N'11111')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (60, 13, 62, 8136000, 5, N'Nguyen Huong1111', N'124345')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (63, 6, 72, 2736000, 5, N'Morgan Peer', N'012345671')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (64, 11, 74, 5436000, 7, N'N/A', N'0987654321')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (65, 11, 74, 2736000, 6, N'TEst', N'0987654321')
INSERT [dbo].[shop_order] ([shop_orderID], [UserID], [AddressID], [Order_total], [Order_status], [recipient], [recipent_phone]) VALUES (66, 11, 74, 3018200, 6, N'TEst', N'0987654321')
SET IDENTITY_INSERT [dbo].[shop_order] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (1, N'XXS')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (2, N'XS')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (3, N'S')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (4, N'M')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (5, N'L')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (6, N'XL')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (7, N'XXL')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (8, N'5')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (9, N'6')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (10, N'7')
INSERT [dbo].[size] ([size_ID], [size_Name]) VALUES (11, N'8')
SET IDENTITY_INSERT [dbo].[size] OFF
GO
SET IDENTITY_INSERT [dbo].[story] ON 

INSERT [dbo].[story] ([story_id], [thumbnail], [title], [description]) VALUES (1, N'1.jpg', N'The Fashion Lane Sustainability Team', N'# At Fashion Lane, we design our timeless staples to be passed down, not tossed out—so you can curate the most beautiful wardrobe with the least impact on the planet.

![t](https://media.everlane.com/image/upload/c_scale,dpr_3.0,f_auto,q_auto,w_auto/c_limit,w_400/v1/i/d2ac1f92_5286.jpg)

To achieve this, our Sustainability Team diligently partners with various experts both inside and outside of Fashion Lane HQ to carefully consider every material as well as reduce waste, minimize natural resource use, and remove harmful chemicals and plastics that endanger people and ecosystems.

We are big fans of our small, but mighty Sustainability Team, and wanted to take a moment to spotlight them and all their hard work by asking them to share their favorite consciously crafted pieces that they helped bring to life.')
INSERT [dbo].[story] ([story_id], [thumbnail], [title], [description]) VALUES (2, N'2.jpg', N'Ways To Wear Color: Summer Edition', N'# At Fashion Lane, we design our timeless staples to be passed down, not tossed out—so you can curate the most beautiful wardrobe with the least impact on the planet.')
INSERT [dbo].[story] ([story_id], [thumbnail], [title], [description]) VALUES (3, N'3.jpg', N'Styles to Pack for Your Next Getaway', N'# At Fashion Lane, we design our timeless staples to be passed down, not tossed out—so you can curate the most beautiful wardrobe with the least impact on the planet.')
INSERT [dbo].[story] ([story_id], [thumbnail], [title], [description]) VALUES (4, N'4.jpg', N'In Conversation With The ACLU', N'# At Fashion Lane, we design our timeless staples to be passed down, not tossed out—so you can curate the most beautiful wardrobe with the least impact on the planet.')
SET IDENTITY_INSERT [dbo].[story] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (1, N'admin', N'123', N'admin@gmail.com', N'Son', N'Nguyen', CAST(N'1997-01-20' AS Date), 1, 1, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (2, N'sale', N'567', N'sale@gmail.com', N'Huong', N'Nguyen', CAST(N'1997-01-20' AS Date), 2, 2, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (3, N'marketing', N'789', N'marketing@gmail.com', N'Marketing', N'Marketing ', CAST(N'1997-01-20' AS Date), 1, 3, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (4, N'cus1', N'123', N'cus1@gmail.com', N'John', N'Wick', CAST(N'1997-01-20' AS Date), 1, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (5, N'cus2', N'113', N'cus2@gmail.com', N'Tim', N'Peer', CAST(N'1997-01-20' AS Date), 2, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (6, N'cus3', N'114', N'cus3@gmail.com', N'Morgan', N'Peer', CAST(N'1997-01-20' AS Date), 3, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (7, N'cus4', N'115', N'cus4@gmail.com', N'Kai', N'Cenat', CAST(N'1997-01-20' AS Date), 1, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (8, N'cus5 ', N'116', N'cus5@gmail.com', N'Andrew', N'Tate', CAST(N'1997-01-20' AS Date), 2, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (9, N'cus6', N'117', N'cus6@gmail.com', N'Tristan', N'Tate', CAST(N'1997-01-20' AS Date), 1, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (10, N'cus7', N'118', N'cus7@gmail.com', N'Luke', N'Tate', CAST(N'1997-01-20' AS Date), 2, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (11, N'cus8', N'119', N'cus8@gmail.com', N'Hai', N'Nguyen', CAST(N'1997-01-20' AS Date), 1, 4, N'012345678')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (12, N'leminhduc', N'110', N'leminhductod@gmail.com', N'Minh', N'Duc', CAST(N'2000-01-23' AS Date), NULL, 4, NULL)
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (13, N'4user123', N'1234', N'4userfpt@gmail.com', N'Nguyen', N'Huong', CAST(N'2003-02-10' AS Date), 1, 4, N'12312312312')
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (14, N'Quang Huy', N'1234', N'huylqhe170039@fpt.edu.vn', N'Quang', N'Huy', CAST(N'2000-10-10' AS Date), NULL, 6, NULL)
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (15, N'4user3', N'123', N'4userfpt3@gmail.com', N'Duc', N'Dung', NULL, NULL, 5, NULL)
INSERT [dbo].[user] ([UserID], [UserName], [Password], [Email], [FirstName], [LastName], [Dob], [Sex], [Role], [Phone]) VALUES (16, N'Son Nguyen', N'1234', N'sonnkhe160358@fpt.edu.vn', N'Son', N'Nguyen', CAST(N'2002-07-09' AS Date), 1, 2, N'034999885')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (68, 13)
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (69, 13)
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (70, 13)
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (71, 6)
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (72, 6)
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (73, 11)
INSERT [dbo].[useraddress] ([AddressID], [UserID]) VALUES (74, 11)
GO
INSERT [dbo].[userreview] ([UserReviewID], [UserID], [rating_value], [OrderDetailID], [comment]) VALUES (NULL, 13, 4, 57, N'Quá tuyệt vời')
INSERT [dbo].[userreview] ([UserReviewID], [UserID], [rating_value], [OrderDetailID], [comment]) VALUES (NULL, 13, 5, 58, N'Hời cùi đấy')
INSERT [dbo].[userreview] ([UserReviewID], [UserID], [rating_value], [OrderDetailID], [comment]) VALUES (NULL, 13, 3, 67, N'Hời ok đấy')
INSERT [dbo].[userreview] ([UserReviewID], [UserID], [rating_value], [OrderDetailID], [comment]) VALUES (NULL, 13, 2, 65, N'aaaa')
INSERT [dbo].[userreview] ([UserReviewID], [UserID], [rating_value], [OrderDetailID], [comment]) VALUES (NULL, 13, 4, 90, N'Abcccc')
INSERT [dbo].[userreview] ([UserReviewID], [UserID], [rating_value], [OrderDetailID], [comment]) VALUES (NULL, 11, 3, 131, N'123')
GO
SET IDENTITY_INSERT [dbo].[variation] ON 

INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (11, 3, 3, 1, 1000, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (12, 3, 3, 2, 1000, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (13, 3, 3, 3, 998, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (14, 3, 3, 4, 1000, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (15, 3, 3, 5, 1000, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (16, 3, 3, 6, 1000, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (17, 3, 3, 7, 1000, 5)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (18, 3, 6, 1, 1000, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (19, 3, 6, 2, 1000, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (20, 3, 6, 3, 1000, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (21, 3, 6, 4, 1000, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (22, 3, 6, 5, 998, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (23, 3, 6, 6, 1000, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (24, 3, 6, 7, 1000, 6)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (25, 3, 1, 1, 1000, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (26, 3, 1, 2, 998, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (27, 3, 1, 3, 1000, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (28, 3, 1, 4, 1000, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (29, 3, 1, 5, 1000, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (30, 3, 1, 6, 1000, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (31, 3, 1, 7, 1000, 7)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (46, 4, 3, 1, 1000, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (47, 4, 3, 2, 1000, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (48, 4, 3, 3, 999, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (49, 4, 3, 4, 1000, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (50, 4, 3, 5, 999, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (51, 4, 3, 6, 1000, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (52, 4, 3, 7, 1000, 8)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (53, 4, 2, 1, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (54, 4, 2, 2, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (55, 4, 2, 3, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (56, 4, 2, 4, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (57, 4, 2, 5, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (58, 4, 2, 6, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (59, 4, 2, 7, 1000, 9)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (60, 4, 6, 1, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (61, 4, 6, 2, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (62, 4, 6, 3, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (63, 4, 6, 4, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (64, 4, 6, 5, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (65, 4, 6, 6, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (66, 4, 6, 7, 1000, 10)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (67, 4, 5, 1, 1000, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (68, 4, 5, 2, 1000, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (69, 4, 5, 3, 1000, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (70, 4, 5, 4, 999, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (71, 4, 5, 5, 1000, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (72, 4, 5, 6, 1000, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (73, 4, 5, 7, 1000, 11)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (74, 5, 3, 1, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (75, 5, 3, 2, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (76, 5, 3, 3, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (77, 5, 3, 4, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (78, 5, 3, 5, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (79, 5, 3, 6, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (80, 5, 3, 7, 1000, 12)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (81, 5, 2, 1, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (82, 5, 2, 2, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (83, 5, 2, 3, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (84, 5, 2, 4, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (85, 5, 2, 5, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (86, 5, 2, 6, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (87, 5, 2, 7, 1000, 13)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (88, 5, 3, 1, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (89, 5, 3, 2, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (90, 5, 3, 3, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (91, 5, 3, 4, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (92, 5, 3, 5, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (93, 5, 3, 6, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (94, 5, 3, 7, 1000, 14)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (95, 5, 1, 1, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (96, 5, 1, 2, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (97, 5, 1, 3, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (98, 5, 1, 4, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (99, 5, 1, 5, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (100, 5, 1, 6, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (101, 5, 1, 7, 1000, 15)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (102, 6, 3, 1, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (103, 6, 3, 2, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (104, 6, 3, 3, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (105, 6, 3, 4, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (106, 6, 3, 5, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (107, 6, 3, 6, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (108, 6, 3, 7, 1000, 16)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (116, 6, 6, 1, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (117, 6, 6, 2, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (118, 6, 6, 3, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (119, 6, 6, 4, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (120, 6, 6, 5, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (121, 6, 6, 6, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (122, 6, 6, 7, 1000, 18)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (123, 6, 1, 1, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (124, 6, 1, 2, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (125, 6, 1, 3, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (126, 6, 1, 4, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (127, 6, 1, 5, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (128, 6, 1, 6, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (129, 6, 1, 7, 1000, 19)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (130, 7, 3, 1, 1000, 20)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (131, 7, 3, 2, 1000, 20)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (132, 7, 3, 3, 1000, 20)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (133, 7, 3, 4, 1000, 20)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (134, 7, 3, 5, 1000, 20)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (135, 7, 3, 6, 1000, 20)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (136, 7, 3, 7, 1000, 20)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (137, 7, 2, 1, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (138, 7, 2, 2, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (139, 7, 2, 3, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (140, 7, 2, 4, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (141, 7, 2, 5, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (142, 7, 2, 6, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (143, 7, 2, 7, 1000, 21)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (144, 8, 9, 1, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (145, 8, 9, 2, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (146, 8, 9, 3, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (147, 8, 9, 4, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (148, 8, 9, 5, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (149, 8, 9, 6, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (150, 8, 9, 7, 1000, 24)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (151, 8, 3, 1, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (152, 8, 3, 2, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (153, 8, 3, 3, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (154, 8, 3, 4, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (155, 8, 3, 5, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (156, 8, 3, 6, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (157, 8, 3, 7, 1000, 22)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (158, 8, 6, 1, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (159, 8, 6, 2, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (160, 8, 6, 3, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (161, 8, 6, 4, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (162, 8, 6, 5, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (163, 8, 6, 6, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (164, 8, 6, 7, 1000, 23)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (165, 10, 2, 1, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (166, 10, 2, 2, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (167, 10, 2, 3, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (168, 10, 2, 4, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (169, 10, 2, 5, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (170, 10, 2, 6, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (171, 10, 2, 7, 1000, 25)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (172, 10, 1, 1, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (173, 10, 1, 2, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (174, 10, 1, 3, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (175, 10, 1, 4, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (176, 10, 1, 5, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (177, 10, 1, 6, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (178, 10, 1, 7, 1000, 27)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (179, 11, 3, 1, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (180, 11, 3, 2, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (181, 11, 3, 3, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (182, 11, 3, 4, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (183, 11, 3, 5, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (184, 11, 3, 6, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (185, 11, 3, 7, 1000, 28)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (186, 11, 5, 1, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (187, 11, 5, 2, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (188, 11, 5, 3, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (189, 11, 5, 4, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (190, 11, 5, 5, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (191, 11, 5, 6, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (192, 11, 5, 7, 1000, 29)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (193, 11, 1, 1, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (194, 11, 1, 2, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (195, 11, 1, 3, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (196, 11, 1, 4, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (197, 11, 1, 5, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (198, 11, 1, 6, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (199, 11, 1, 7, 1000, 31)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (207, 12, 5, 1, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (208, 12, 5, 2, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (209, 12, 5, 3, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (210, 12, 5, 4, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (211, 12, 5, 5, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (212, 12, 5, 6, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (213, 12, 5, 7, 1000, 32)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (221, 13, 2, 1, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (222, 13, 2, 2, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (223, 13, 2, 3, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (224, 13, 2, 4, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (225, 13, 2, 5, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (226, 13, 2, 6, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (227, 13, 2, 7, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (228, 13, 3, 1, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (229, 13, 3, 2, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (230, 13, 3, 3, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (231, 13, 3, 4, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (232, 13, 3, 5, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (233, 13, 3, 6, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (234, 13, 3, 7, 1000, 34)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (235, 13, 9, 1, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (236, 13, 9, 2, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (237, 13, 9, 3, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (238, 13, 9, 4, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (239, 13, 9, 5, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (240, 13, 9, 6, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (241, 13, 9, 7, 1000, 35)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (242, 14, 3, 1, 1000, 36)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (243, 14, 3, 2, 1000, 36)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (244, 14, 3, 3, 1000, 36)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (245, 14, 3, 4, 998, 36)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (246, 14, 3, 5, 1000, 36)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (247, 14, 3, 6, 1000, 36)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (248, 14, 3, 7, 1000, 36)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (249, 14, 2, 1, 1000, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (250, 14, 2, 2, 1000, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (251, 14, 2, 3, 998, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (252, 14, 2, 4, 1000, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (253, 14, 2, 5, 1000, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (254, 14, 2, 6, 1000, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (255, 14, 2, 7, 1000, 37)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (256, 14, 4, 1, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (257, 14, 4, 2, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (258, 14, 4, 3, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (259, 14, 4, 4, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (260, 14, 4, 5, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (261, 14, 4, 6, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (262, 14, 4, 7, 1000, 38)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (263, 15, 3, 1, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (264, 15, 3, 2, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (265, 15, 3, 3, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (266, 15, 3, 4, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (267, 15, 3, 5, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (268, 15, 3, 6, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (269, 15, 3, 7, 1000, 39)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (270, 15, 6, 1, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (271, 15, 6, 2, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (272, 15, 6, 3, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (273, 15, 6, 4, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (274, 15, 6, 5, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (275, 15, 6, 6, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (276, 15, 6, 7, 1000, 40)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (277, 16, 3, 1, 1000, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (278, 16, 3, 2, 999, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (279, 16, 3, 3, 1000, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (280, 16, 3, 4, 999, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (281, 16, 3, 5, 1000, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (282, 16, 3, 6, 1000, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (283, 16, 3, 7, 1000, 41)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (284, 16, 6, 1, 1000, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (285, 16, 6, 2, 1000, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (286, 16, 6, 3, 1000, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (287, 16, 6, 4, 999, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (288, 16, 6, 5, 1000, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (289, 16, 6, 6, 1000, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (290, 16, 6, 7, 1000, 42)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (291, 17, 1, 1, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (292, 17, 1, 2, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (293, 17, 1, 3, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (294, 17, 1, 4, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (295, 17, 1, 5, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (296, 17, 1, 6, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (297, 17, 1, 7, 1000, 44)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (312, 18, 3, 1, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (313, 18, 3, 2, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (314, 18, 3, 3, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (315, 18, 3, 4, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (316, 18, 3, 5, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (317, 18, 3, 6, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (318, 18, 3, 7, 1000, 45)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (326, 19, 3, 1, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (327, 19, 3, 2, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (328, 19, 3, 3, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (329, 19, 3, 4, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (330, 19, 3, 5, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (331, 19, 3, 6, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (332, 19, 3, 7, 1000, 47)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (333, 20, 8, 1, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (334, 20, 8, 2, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (335, 20, 8, 3, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (336, 20, 8, 4, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (337, 20, 8, 5, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (338, 20, 8, 6, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (339, 20, 8, 7, 1000, 50)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (340, 20, 3, 1, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (341, 20, 3, 2, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (342, 20, 3, 3, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (343, 20, 3, 4, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (344, 20, 3, 5, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (345, 20, 3, 6, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (346, 20, 3, 7, 1000, 48)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (347, 20, 6, 1, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (348, 20, 6, 2, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (349, 20, 6, 3, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (350, 20, 6, 4, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (351, 20, 6, 5, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (352, 20, 6, 6, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (353, 20, 6, 7, 1000, 49)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (354, 21, 3, 1, 1000, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (355, 21, 3, 2, 1000, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (356, 21, 3, 3, 1000, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (357, 21, 3, 4, 999, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (358, 21, 3, 5, 1000, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (359, 21, 3, 6, 1000, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (360, 21, 3, 7, 999, 51)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (361, 21, 2, 1, 1000, 52)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (362, 21, 2, 2, 1000, 52)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (363, 21, 2, 3, 996, 52)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (364, 21, 2, 4, 1000, 52)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (365, 21, 2, 5, 1000, 52)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (366, 21, 2, 6, 1000, 52)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (367, 21, 2, 7, 1000, 52)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (368, 21, 10, 1, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (369, 21, 10, 2, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (370, 21, 10, 3, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (371, 21, 10, 4, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (372, 21, 10, 5, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (373, 21, 10, 6, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (374, 21, 10, 7, 1000, 53)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (375, 22, 3, 1, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (376, 22, 3, 2, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (377, 22, 3, 3, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (378, 22, 3, 4, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (379, 22, 3, 5, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (380, 22, 3, 6, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (381, 22, 3, 7, 1000, 54)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (382, 22, 2, 1, 1000, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (383, 22, 2, 2, 1000, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (384, 22, 2, 3, 1000, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (385, 22, 2, 4, 998, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (386, 22, 2, 5, 1000, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (387, 22, 2, 6, 1000, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (388, 22, 2, 7, 1000, 55)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (389, 22, 5, 1, 1000, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (390, 22, 5, 2, 1000, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (391, 22, 5, 3, 1000, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (392, 22, 5, 4, 998, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (393, 22, 5, 5, 1000, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (394, 22, 5, 6, 1000, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (395, 22, 5, 7, 1000, 56)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (396, 23, 3, 1, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (397, 23, 3, 2, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (398, 23, 3, 3, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (399, 23, 3, 4, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (400, 23, 3, 5, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (401, 23, 3, 6, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (402, 23, 3, 7, 1000, 57)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (403, 23, 2, 1, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (404, 23, 2, 2, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (405, 23, 2, 3, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (406, 23, 2, 4, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (407, 23, 2, 5, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (408, 23, 2, 6, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (409, 23, 2, 7, 1000, 58)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (410, 23, 5, 1, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (411, 23, 5, 2, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (412, 23, 5, 3, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (413, 23, 5, 4, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (414, 23, 5, 5, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (415, 23, 5, 6, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (416, 23, 5, 7, 1000, 59)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (417, 24, 3, 1, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (418, 24, 3, 2, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (419, 24, 3, 3, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (420, 24, 3, 4, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (421, 24, 3, 5, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (422, 24, 3, 6, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (423, 24, 3, 7, 1000, 60)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (424, 24, 2, 1, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (425, 24, 2, 2, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (426, 24, 2, 3, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (427, 24, 2, 4, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (428, 24, 2, 5, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (429, 24, 2, 6, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (430, 24, 2, 7, 1000, 61)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (431, 24, 5, 1, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (432, 24, 5, 2, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (433, 24, 5, 3, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (434, 24, 5, 4, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (435, 24, 5, 5, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (436, 24, 5, 6, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (437, 24, 5, 7, 1000, 62)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (438, 25, 3, 1, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (439, 25, 3, 2, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (440, 25, 3, 3, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (441, 25, 3, 4, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (442, 25, 3, 5, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (443, 25, 3, 6, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (444, 25, 3, 7, 1000, 63)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (445, 26, 3, 1, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (446, 26, 3, 2, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (447, 26, 3, 3, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (448, 26, 3, 4, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (449, 26, 3, 5, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (450, 26, 3, 6, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (451, 26, 3, 7, 1000, 64)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (452, 10, 6, 1, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (453, 10, 6, 2, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (454, 10, 6, 3, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (455, 10, 6, 4, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (456, 10, 6, 5, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (457, 10, 6, 6, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (458, 10, 6, 7, 1000, 26)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (459, 26, 2, 1, 1000, 65)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (460, 26, 2, 2, 1000, 65)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (461, 26, 2, 3, 1000, 65)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (462, 26, 2, 4, 1000, 65)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (463, 26, 2, 5, 1000, 65)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (464, 26, 2, 6, 1000, 65)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (465, 26, 2, 7, 1000, 65)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (466, 26, 5, 1, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (467, 26, 5, 2, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (468, 26, 5, 3, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (469, 26, 5, 4, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (470, 26, 5, 5, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (471, 26, 5, 6, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (472, 26, 5, 7, 1000, 66)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (473, 27, 3, 1, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (474, 27, 3, 2, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (475, 27, 3, 3, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (476, 27, 3, 4, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (477, 27, 3, 5, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (478, 27, 3, 6, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (479, 27, 3, 7, 1000, 67)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (480, 27, 2, 1, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (481, 27, 2, 2, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (482, 27, 2, 3, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (483, 27, 2, 4, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (484, 27, 2, 5, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (485, 27, 2, 6, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (486, 27, 2, 7, 1000, 68)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (487, 27, 10, 1, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (488, 27, 10, 2, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (489, 27, 10, 3, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (490, 27, 10, 4, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (491, 27, 10, 5, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (492, 27, 10, 6, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (493, 27, 10, 7, 1000, 69)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (494, 28, 2, 1, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (495, 28, 2, 2, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (496, 28, 2, 3, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (497, 28, 2, 4, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (498, 28, 2, 5, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (499, 28, 2, 6, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (500, 28, 2, 7, 1000, 70)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (501, 28, 10, 1, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (502, 28, 10, 2, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (503, 28, 10, 3, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (504, 28, 10, 4, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (505, 28, 10, 5, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (506, 28, 10, 6, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (507, 28, 10, 7, 1000, 71)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (508, 29, 3, 1, 1000, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (509, 29, 3, 2, 1000, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (510, 29, 3, 3, 1000, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (511, 29, 3, 4, 1000, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (512, 29, 3, 5, 999, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (513, 29, 3, 6, 1000, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (514, 29, 3, 7, 1000, 72)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (515, 29, 6, 1, 1000, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (516, 29, 6, 2, 1000, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (517, 29, 6, 3, 999, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (518, 29, 6, 4, 1000, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (519, 29, 6, 5, 1000, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (520, 29, 6, 6, 1000, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (521, 29, 6, 7, 1000, 73)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (522, 29, 1, 1, 1000, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (523, 29, 1, 2, 998, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (524, 29, 1, 3, 1000, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (525, 29, 1, 4, 1000, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (526, 29, 1, 5, 1000, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (527, 29, 1, 6, 1000, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (528, 29, 1, 7, 1000, 74)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (529, 30, 3, 1, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (530, 30, 3, 2, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (531, 30, 3, 3, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (532, 30, 3, 4, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (533, 30, 3, 5, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (534, 30, 3, 6, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (535, 30, 3, 7, 1000, 75)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (536, 30, 4, 1, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (537, 30, 4, 2, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (538, 30, 4, 3, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (539, 30, 4, 4, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (540, 30, 4, 5, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (541, 30, 4, 6, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (542, 30, 4, 7, 1000, 76)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (543, 30, 1, 1, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (544, 30, 1, 2, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (545, 30, 1, 3, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (546, 30, 1, 4, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (547, 30, 1, 5, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (548, 30, 1, 6, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (549, 30, 1, 7, 1000, 77)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (571, 32, 3, 1, 998, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (572, 32, 3, 2, 1000, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (573, 32, 3, 3, 1000, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (574, 32, 3, 4, 1000, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (575, 32, 3, 5, 1000, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (576, 32, 3, 6, 1000, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (577, 32, 3, 7, 1000, 78)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (578, 32, 4, 1, 1000, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (579, 32, 4, 2, 1000, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (580, 32, 4, 3, 1000, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (581, 32, 4, 4, 998, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (582, 32, 4, 5, 1000, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (583, 32, 4, 6, 1000, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (584, 32, 4, 7, 1000, 79)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (585, 32, 1, 1, 1000, 80)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (586, 32, 1, 2, 998, 80)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (587, 32, 1, 3, 1000, 80)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (588, 32, 1, 4, 1000, 80)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (589, 32, 1, 5, 1000, 80)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (590, 32, 1, 6, 1000, 80)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (591, 32, 1, 7, 1000, 80)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (592, 33, 3, 1, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (593, 33, 3, 2, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (594, 33, 3, 3, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (595, 33, 3, 4, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (596, 33, 3, 5, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (597, 33, 3, 6, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (598, 33, 3, 7, 1000, 81)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (599, 33, 4, 1, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (600, 33, 4, 2, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (601, 33, 4, 3, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (602, 33, 4, 4, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (603, 33, 4, 5, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (604, 33, 4, 6, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (605, 33, 4, 7, 1000, 82)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (606, 33, 1, 1, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (607, 33, 1, 2, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (608, 33, 1, 3, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (609, 33, 1, 4, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (610, 33, 1, 5, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (611, 33, 1, 6, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (612, 33, 1, 7, 1000, 83)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (613, 34, 3, 1, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (614, 34, 3, 2, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (615, 34, 3, 3, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (616, 34, 3, 4, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (617, 34, 3, 5, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (618, 34, 3, 6, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (619, 34, 3, 7, 1000, 84)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (620, 34, 4, 1, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (621, 34, 4, 2, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (622, 34, 4, 3, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (623, 34, 4, 4, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (624, 34, 4, 5, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (625, 34, 4, 6, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (626, 34, 4, 7, 1000, 85)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (627, 34, 1, 1, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (628, 34, 1, 2, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (629, 34, 1, 3, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (630, 34, 1, 4, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (631, 34, 1, 5, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (632, 34, 1, 6, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (633, 34, 1, 7, 1000, 86)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (634, 35, 3, 1, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (635, 35, 3, 2, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (636, 35, 3, 3, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (637, 35, 3, 4, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (638, 35, 3, 5, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (639, 35, 3, 6, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (640, 35, 3, 7, 1000, 87)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (641, 35, 4, 1, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (642, 35, 4, 2, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (643, 35, 4, 3, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (644, 35, 4, 4, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (645, 35, 4, 5, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (646, 35, 4, 6, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (647, 35, 4, 7, 1000, 88)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (648, 35, 1, 1, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (649, 35, 1, 2, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (650, 35, 1, 3, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (651, 35, 1, 4, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (652, 35, 1, 5, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (653, 35, 1, 6, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (654, 35, 1, 7, 1000, 89)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (656, 36, 3, 1, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (657, 36, 3, 2, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (658, 36, 3, 3, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (659, 36, 3, 4, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (660, 36, 3, 5, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (661, 36, 3, 6, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (662, 36, 3, 7, 1000, 90)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (663, 36, 4, 1, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (664, 36, 4, 2, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (665, 36, 4, 3, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (666, 36, 4, 4, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (667, 36, 4, 5, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (668, 36, 4, 6, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (669, 36, 4, 7, 1000, 91)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (670, 36, 1, 1, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (671, 36, 1, 2, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (672, 36, 1, 3, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (673, 36, 1, 4, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (674, 36, 1, 5, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (675, 36, 1, 6, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (676, 36, 1, 7, 1000, 92)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (677, 37, 3, 1, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (678, 37, 3, 2, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (679, 37, 3, 3, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (680, 37, 3, 4, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (681, 37, 3, 5, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (682, 37, 3, 6, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (683, 37, 3, 7, 1000, 96)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (684, 37, 4, 1, 1000, 97)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (685, 37, 4, 2, 1000, 97)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (686, 37, 4, 3, 1000, 97)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (687, 37, 4, 4, 1000, 97)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (688, 37, 4, 5, 1000, 97)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (689, 37, 4, 6, 1000, 97)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (690, 37, 4, 7, 1000, 97)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (691, 37, 1, 1, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (692, 37, 1, 2, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (693, 37, 1, 3, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (694, 37, 1, 4, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (695, 37, 1, 5, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (696, 37, 1, 6, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (697, 37, 1, 7, 1000, 98)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (698, 38, 3, 1, 999, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (699, 38, 3, 2, 1000, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (700, 38, 3, 3, 987, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (701, 38, 3, 4, 999, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (702, 38, 3, 5, 998, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (703, 38, 3, 6, 1000, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (704, 38, 3, 7, 1000, 99)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (705, 38, 2, 1, 995, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (706, 38, 2, 2, 979, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (707, 38, 2, 3, 996, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (708, 38, 2, 4, 997, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (709, 38, 2, 5, 1000, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (710, 38, 2, 6, 1000, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (711, 38, 2, 7, 999, 100)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (712, 38, 1, 1, 977, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (713, 38, 1, 2, 998, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (714, 38, 1, 3, 998, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (715, 38, 1, 4, 998, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (716, 38, 1, 5, 999, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (717, 38, 1, 6, 1000, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (718, 38, 1, 7, 999, 101)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (719, 39, 3, 1, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (720, 39, 3, 2, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (721, 39, 3, 3, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (722, 39, 3, 4, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (723, 39, 3, 5, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (724, 39, 3, 6, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (725, 39, 3, 7, 1000, 102)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (726, 39, 2, 1, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (727, 39, 2, 2, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (728, 39, 2, 3, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (729, 39, 2, 4, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (730, 39, 2, 5, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (731, 39, 2, 6, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (732, 39, 2, 7, 1000, 103)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (733, 39, 4, 1, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (734, 39, 4, 2, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (735, 39, 4, 3, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (736, 39, 4, 4, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (737, 39, 4, 5, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (738, 39, 4, 6, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (739, 39, 4, 7, 1000, 104)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (740, 40, 1, 1, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (741, 40, 1, 2, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (742, 40, 1, 3, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (743, 40, 1, 4, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (744, 40, 1, 5, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (745, 40, 1, 6, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (746, 40, 1, 7, 1000, 107)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (747, 40, 2, 1, 1000, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (748, 40, 2, 2, 1000, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (749, 40, 2, 3, 998, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (750, 40, 2, 4, 1000, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (751, 40, 2, 5, 1000, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (752, 40, 2, 6, 1000, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (753, 40, 2, 7, 1000, 105)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (754, 40, 5, 1, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (755, 40, 5, 2, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (756, 40, 5, 3, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (757, 40, 5, 4, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (758, 40, 5, 5, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (759, 40, 5, 6, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (760, 40, 5, 7, 1000, 106)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (761, 41, 2, 1, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (762, 41, 2, 2, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (763, 41, 2, 3, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (764, 41, 2, 4, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (765, 41, 2, 5, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (766, 41, 2, 6, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (767, 41, 2, 7, 1000, 108)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (768, 42, 2, 1, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (769, 42, 2, 2, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (770, 42, 2, 3, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (771, 42, 2, 4, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (772, 42, 2, 5, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (773, 42, 2, 6, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (774, 42, 2, 7, 1000, 109)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (775, 43, 2, 1, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (776, 43, 2, 2, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (777, 43, 2, 3, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (778, 43, 2, 4, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (779, 43, 2, 5, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (780, 43, 2, 6, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (781, 43, 2, 7, 1000, 110)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (782, 43, 4, 1, 1000, 111)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (783, 43, 4, 2, 1000, 111)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (784, 43, 4, 3, 1000, 111)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (785, 43, 4, 4, 1000, 111)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (786, 43, 4, 5, 1000, 111)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (787, 43, 4, 6, 1000, 111)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (788, 43, 4, 7, 1000, 111)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (789, 44, 2, 1, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (790, 44, 2, 2, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (791, 44, 2, 3, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (792, 44, 2, 4, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (793, 44, 2, 5, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (794, 44, 2, 6, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (795, 44, 2, 7, 1000, 112)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (796, 45, 2, 1, 1000, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (797, 45, 2, 2, 1000, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (798, 45, 2, 3, 997, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (799, 45, 2, 4, 1000, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (800, 45, 2, 5, 1000, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (801, 45, 2, 6, 1000, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (802, 45, 2, 7, 1000, 113)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (803, 46, 3, 1, 997, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (804, 46, 3, 2, 1000, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (805, 46, 3, 3, 1000, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (806, 46, 3, 4, 999, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (807, 46, 3, 5, 1000, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (808, 46, 3, 6, 997, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (809, 46, 3, 7, 999, 114)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (810, 46, 1, 1, 1000, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (811, 46, 1, 2, 1000, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (812, 46, 1, 3, 998, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (813, 46, 1, 4, 1000, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (814, 46, 1, 5, 999, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (815, 46, 1, 6, 1000, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (816, 46, 1, 7, 998, 115)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (817, 47, 3, 1, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (818, 47, 3, 2, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (819, 47, 3, 3, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (820, 47, 3, 4, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (821, 47, 3, 5, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (822, 47, 3, 6, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (823, 47, 3, 7, 1000, 116)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (824, 47, 6, 1, 1000, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (825, 47, 6, 2, 1000, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (826, 47, 6, 3, 1000, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (827, 47, 6, 4, 999, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (828, 47, 6, 5, 1000, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (829, 47, 6, 6, 1000, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (830, 47, 6, 7, 1000, 117)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (831, 48, 3, 1, 1000, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (832, 48, 3, 2, 1000, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (833, 48, 3, 3, 998, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (834, 48, 3, 4, 1000, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (835, 48, 3, 5, 1000, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (836, 48, 3, 6, 1000, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (837, 48, 3, 7, 1000, 118)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (838, 48, 5, 1, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (839, 48, 5, 2, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (840, 48, 5, 3, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (841, 48, 5, 4, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (842, 48, 5, 5, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (843, 48, 5, 6, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (844, 48, 5, 7, 1000, 119)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (845, 48, 4, 1, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (846, 48, 4, 2, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (847, 48, 4, 3, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (848, 48, 4, 4, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (849, 48, 4, 5, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (850, 48, 4, 6, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (851, 48, 4, 7, 1000, 120)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (852, 49, 5, 1, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (853, 49, 5, 2, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (854, 49, 5, 3, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (855, 49, 5, 4, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (856, 49, 5, 5, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (857, 49, 5, 6, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (858, 49, 5, 7, 1000, 121)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (859, 50, 3, 1, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (860, 50, 3, 2, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (861, 50, 3, 3, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (862, 50, 3, 4, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (863, 50, 3, 5, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (864, 50, 3, 6, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (865, 50, 3, 7, 1000, 122)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (866, 51, 1, 1, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (867, 51, 1, 2, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (868, 51, 1, 3, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (869, 51, 1, 4, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (870, 51, 1, 5, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (871, 51, 1, 6, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (872, 51, 1, 7, 1000, 125)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (873, 51, 6, 1, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (874, 51, 6, 2, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (875, 51, 6, 3, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (876, 51, 6, 4, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (877, 51, 6, 5, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (878, 51, 6, 6, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (879, 51, 6, 7, 1000, 124)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (880, 51, 3, 1, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (881, 51, 3, 2, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (882, 51, 3, 3, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (883, 51, 3, 4, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (884, 51, 3, 5, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (885, 51, 3, 6, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (886, 51, 3, 7, 1000, 123)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (887, 52, 3, 1, 1000, 126)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (888, 52, 3, 2, 1000, 126)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (889, 52, 3, 3, 1000, 126)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (890, 52, 3, 4, 1000, 126)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (891, 52, 3, 5, 1000, 126)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (892, 52, 3, 6, 1000, 126)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (893, 52, 3, 7, 1000, 126)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (894, 52, 2, 1, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (895, 52, 2, 2, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (896, 52, 2, 3, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (897, 52, 2, 4, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (898, 52, 2, 5, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (899, 52, 2, 6, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (900, 52, 2, 7, 1000, 127)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (908, 53, 3, 1, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (909, 53, 3, 2, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (910, 53, 3, 3, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (911, 53, 3, 4, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (912, 53, 3, 5, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (913, 53, 3, 6, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (914, 53, 3, 7, 1000, 128)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (915, 54, 3, 1, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (916, 54, 3, 2, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (917, 54, 3, 3, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (918, 54, 3, 4, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (919, 54, 3, 5, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (920, 54, 3, 6, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (921, 54, 3, 7, 1000, 129)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (922, 54, 6, 1, 1000, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (923, 54, 6, 2, 1000, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (924, 54, 6, 3, 1000, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (925, 54, 6, 4, 998, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (926, 54, 6, 5, 1000, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (927, 54, 6, 6, 1000, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (928, 54, 6, 7, 1000, 130)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (929, 54, 1, 1, 1000, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (930, 54, 1, 2, 997, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (931, 54, 1, 3, 1000, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (932, 54, 1, 4, 1000, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (933, 54, 1, 5, 1000, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (934, 54, 1, 6, 1000, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (935, 54, 1, 7, 1000, 131)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (936, 55, 3, 1, 1000, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (937, 55, 3, 2, 1000, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (938, 55, 3, 3, 999, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (939, 55, 3, 4, 999, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (940, 55, 3, 5, 1000, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (941, 55, 3, 6, 1000, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (942, 55, 3, 7, 1000, 132)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (943, 55, 4, 1, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (944, 55, 4, 2, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (945, 55, 4, 3, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (946, 55, 4, 4, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (947, 55, 4, 5, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (948, 55, 4, 6, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (949, 55, 4, 7, 1000, 133)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (950, 55, 1, 1, 1000, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (951, 55, 1, 2, 1000, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (952, 55, 1, 3, 999, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (953, 55, 1, 4, 998, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (954, 55, 1, 5, 1000, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (955, 55, 1, 6, 1000, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (956, 55, 1, 7, 1000, 134)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (957, 56, 2, 1, 1000, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (958, 56, 2, 2, 999, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (959, 56, 2, 3, 1000, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (960, 56, 2, 4, 999, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (961, 56, 2, 5, 1000, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (962, 56, 2, 6, 1000, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (963, 56, 2, 7, 1000, 135)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (964, 56, 1, 1, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (965, 56, 1, 2, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (966, 56, 1, 3, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (967, 56, 1, 4, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (968, 56, 1, 5, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (969, 56, 1, 6, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (970, 56, 1, 7, 1000, 136)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (971, 57, 3, 1, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (972, 57, 3, 2, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (973, 57, 3, 3, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (974, 57, 3, 4, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (975, 57, 3, 5, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (976, 57, 3, 6, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (977, 57, 3, 7, 1000, 137)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (978, 57, 6, 1, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (979, 57, 6, 2, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (980, 57, 6, 3, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (981, 57, 6, 4, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (982, 57, 6, 5, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (983, 57, 6, 6, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (984, 57, 6, 7, 1000, 138)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (985, 57, 1, 1, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (986, 57, 1, 2, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (987, 57, 1, 3, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (988, 57, 1, 4, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (989, 57, 1, 5, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (990, 57, 1, 6, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (991, 57, 1, 7, 1000, 139)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (992, 58, 3, 1, 1000, 140)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (993, 58, 3, 2, 1000, 140)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (994, 58, 3, 3, 1000, 140)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (995, 58, 3, 4, 1000, 140)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (996, 58, 3, 5, 1000, 140)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (997, 58, 3, 6, 1000, 140)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (998, 58, 3, 7, 1000, 140)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (999, 58, 2, 1, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1000, 58, 2, 2, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1001, 58, 2, 3, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1002, 58, 2, 4, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1003, 58, 2, 5, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1004, 58, 2, 6, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1005, 58, 2, 7, 1000, 141)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1006, 58, 1, 1, 1000, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1007, 58, 1, 2, 1000, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1008, 58, 1, 3, 1000, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1009, 58, 1, 4, 999, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1010, 58, 1, 5, 1000, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1011, 58, 1, 6, 1000, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1012, 58, 1, 7, 1000, 142)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1013, 59, 3, 1, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1014, 59, 3, 2, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1015, 59, 3, 3, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1016, 59, 3, 4, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1017, 59, 3, 5, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1018, 59, 3, 6, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1019, 59, 3, 7, 1000, 143)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1020, 59, 4, 1, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1021, 59, 4, 2, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1022, 59, 4, 3, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1023, 59, 4, 4, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1024, 59, 4, 5, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1025, 59, 4, 6, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1026, 59, 4, 7, 1000, 144)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1027, 59, 1, 1, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1028, 59, 1, 2, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1029, 59, 1, 3, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1030, 59, 1, 4, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1031, 59, 1, 5, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1032, 59, 1, 6, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1033, 59, 1, 7, 1000, 145)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1034, 60, 1, 1, 1000, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1035, 60, 1, 2, 1000, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1036, 60, 1, 3, 1000, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1037, 60, 1, 4, 999, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1038, 60, 1, 5, 1000, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1039, 60, 1, 6, 1000, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1040, 60, 1, 7, 1000, 148)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1041, 60, 3, 1, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1042, 60, 3, 2, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1043, 60, 3, 3, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1044, 60, 3, 4, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1045, 60, 3, 5, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1046, 60, 3, 6, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1047, 60, 3, 7, 1000, 146)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1048, 60, 4, 1, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1049, 60, 4, 2, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1050, 60, 4, 3, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1051, 60, 4, 4, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1052, 60, 4, 5, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1053, 60, 4, 6, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1054, 60, 4, 7, 1000, 147)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1055, 61, 3, 4, 993, 149)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1056, 62, 3, 8, 999, 150)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1057, 62, 3, 9, 1000, 150)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1058, 62, 3, 10, 998, 150)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1059, 62, 3, 11, 1000, 150)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1060, 63, 3, 8, 1000, 151)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1061, 63, 3, 9, 999, 151)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1062, 63, 3, 10, 1000, 151)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1063, 63, 3, 11, 999, 151)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1064, 64, 3, 8, 1000, 152)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1065, 64, 3, 9, 1000, 152)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1066, 64, 3, 10, 1000, 152)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1067, 64, 3, 11, 1000, 152)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1068, 64, 2, 8, 999, 153)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1069, 64, 2, 9, 998, 153)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1070, 64, 2, 10, 1000, 153)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1071, 64, 2, 11, 1000, 153)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1072, 64, 6, 8, 1000, 154)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1073, 64, 6, 9, 1000, 154)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1074, 64, 6, 10, 1000, 154)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1075, 64, 6, 11, 1000, 154)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1076, 65, 3, 8, 1000, 155)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1077, 65, 3, 9, 1000, 155)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1078, 65, 3, 10, 1000, 155)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1079, 65, 3, 11, 1000, 155)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1080, 65, 6, 8, 1000, 156)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1081, 65, 6, 9, 1000, 156)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1082, 65, 6, 10, 998, 156)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1083, 65, 6, 11, 1000, 156)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1084, 66, 3, 3, 1000, 157)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1085, 66, 3, 4, 1000, 157)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1086, 66, 3, 5, 1000, 157)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1087, 66, 1, 3, 1000, 158)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1088, 66, 1, 4, 1000, 158)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1089, 66, 1, 5, 1000, 158)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1090, 67, 3, 8, 1000, 159)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1091, 67, 3, 9, 1000, 159)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1092, 67, 3, 10, 1000, 159)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1093, 67, 3, 11, 1000, 159)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1094, 67, 6, 8, 1000, 160)
GO
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1095, 67, 6, 9, 1000, 160)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1096, 67, 6, 10, 1000, 160)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1097, 67, 6, 11, 1000, 160)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1098, 68, 3, 4, 1000, 161)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1099, 68, 5, 4, 1000, 162)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1100, 68, 1, 4, 1000, 163)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1101, 69, 3, 4, 1000, 164)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1102, 69, 2, 4, 1000, 165)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1103, 69, 1, 4, 1000, 166)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1104, 70, 3, 4, 1000, 167)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1105, 70, 2, 4, 1000, 168)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1106, 70, 1, 4, 1000, 169)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1107, 71, 3, 1, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1108, 71, 3, 2, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1109, 71, 3, 3, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1110, 71, 3, 4, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1111, 71, 3, 5, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1112, 71, 3, 6, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1113, 71, 3, 7, 1000, 93)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1114, 71, 4, 1, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1115, 71, 4, 2, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1116, 71, 4, 3, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1117, 71, 4, 4, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1118, 71, 4, 5, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1119, 71, 4, 6, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1120, 71, 4, 7, 1000, 94)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1121, 71, 1, 1, 1000, 95)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1122, 71, 1, 2, 1000, 95)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1123, 71, 1, 3, 1000, 95)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1124, 71, 1, 4, 1000, 95)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1125, 71, 1, 5, 1000, 95)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1126, 71, 1, 6, 1000, 95)
INSERT [dbo].[variation] ([VariationID], [ProductID], [color_ID], [size_ID], [qty_in_stock], [product_img_ID]) VALUES (1127, 71, 1, 7, 1000, 95)
SET IDENTITY_INSERT [dbo].[variation] OFF
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [addressline]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [postalcode]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [CountryID]
GO
ALTER TABLE [dbo].[cart] ADD  DEFAULT (NULL) FOR [UserID]
GO
ALTER TABLE [dbo].[cart_item] ADD  DEFAULT (NULL) FOR [CartID]
GO
ALTER TABLE [dbo].[cart_item] ADD  DEFAULT (NULL) FOR [ProductID]
GO
ALTER TABLE [dbo].[cart_item] ADD  DEFAULT (NULL) FOR [Quantity]
GO
ALTER TABLE [dbo].[cart_item] ADD  DEFAULT (NULL) FOR [VariationID]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (NULL) FOR [CategoryName]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (NULL) FOR [Category_img]
GO
ALTER TABLE [dbo].[collection] ADD  DEFAULT (NULL) FOR [CollectionName]
GO
ALTER TABLE [dbo].[collection] ADD  DEFAULT (NULL) FOR [collectionImg]
GO
ALTER TABLE [dbo].[collection] ADD  DEFAULT (NULL) FOR [create_date]
GO
ALTER TABLE [dbo].[collection] ADD  DEFAULT (NULL) FOR [PromotionID]
GO
ALTER TABLE [dbo].[color] ADD  DEFAULT (NULL) FOR [color_Name]
GO
ALTER TABLE [dbo].[country] ADD  DEFAULT (NULL) FOR [CountryName]
GO
ALTER TABLE [dbo].[orderdetails] ADD  DEFAULT (NULL) FOR [ProductID]
GO
ALTER TABLE [dbo].[orderdetails] ADD  DEFAULT (NULL) FOR [OrderID]
GO
ALTER TABLE [dbo].[orderdetails] ADD  DEFAULT (NULL) FOR [Quantity]
GO
ALTER TABLE [dbo].[orderdetails] ADD  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [dbo].[orderdetails] ADD  DEFAULT (NULL) FOR [order_date]
GO
ALTER TABLE [dbo].[orderdetails] ADD  DEFAULT (NULL) FOR [VariationID]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (NULL) FOR [UserID]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (NULL) FOR [OrderDetailID]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (NULL) FOR [type]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [CategoryID]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [ProductName]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [CollectionID]
GO
ALTER TABLE [dbo].[product_img] ADD  DEFAULT (NULL) FOR [thumbnail]
GO
ALTER TABLE [dbo].[product_img] ADD  DEFAULT (NULL) FOR [product_img_1]
GO
ALTER TABLE [dbo].[product_img] ADD  DEFAULT (NULL) FOR [product_img_2]
GO
ALTER TABLE [dbo].[product_img] ADD  DEFAULT (NULL) FOR [product_img_3]
GO
ALTER TABLE [dbo].[product_img] ADD  DEFAULT (NULL) FOR [product_img_name]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (NULL) FOR [PromotionName]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (NULL) FOR [DiscountRate]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (NULL) FOR [StartDate]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (NULL) FOR [background_color]
GO
ALTER TABLE [dbo].[shop_order] ADD  CONSTRAINT [DF__shop_orde__UserI__6C190EBB]  DEFAULT (NULL) FOR [UserID]
GO
ALTER TABLE [dbo].[shop_order] ADD  CONSTRAINT [DF__shop_orde__Addre__6D0D32F4]  DEFAULT (NULL) FOR [AddressID]
GO
ALTER TABLE [dbo].[shop_order] ADD  CONSTRAINT [DF__shop_orde__Order__6E01572D]  DEFAULT (NULL) FOR [Order_total]
GO
ALTER TABLE [dbo].[shop_order] ADD  CONSTRAINT [DF__shop_orde__Order__6EF57B66]  DEFAULT (NULL) FOR [Order_status]
GO
ALTER TABLE [dbo].[shop_order] ADD  CONSTRAINT [DF__shop_orde__recip__6FE99F9F]  DEFAULT (NULL) FOR [recipient]
GO
ALTER TABLE [dbo].[shop_order] ADD  CONSTRAINT [DF__shop_orde__recip__70DDC3D8]  DEFAULT (NULL) FOR [recipent_phone]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT (NULL) FOR [size_Name]
GO
ALTER TABLE [dbo].[story] ADD  DEFAULT (NULL) FOR [thumbnail]
GO
ALTER TABLE [dbo].[story] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__UserName__74AE54BC]  DEFAULT (NULL) FOR [UserName]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__Password__75A278F5]  DEFAULT (NULL) FOR [Password]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__Email__76969D2E]  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__FirstName__778AC167]  DEFAULT (NULL) FOR [FirstName]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__LastName__787EE5A0]  DEFAULT (NULL) FOR [LastName]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__Dob__797309D9]  DEFAULT (NULL) FOR [Dob]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__Sex__7A672E12]  DEFAULT (NULL) FOR [Sex]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__Role__7B5B524B]  DEFAULT (NULL) FOR [Role]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__user__Phone__7C4F7684]  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[useraddress] ADD  DEFAULT (NULL) FOR [AddressID]
GO
ALTER TABLE [dbo].[useraddress] ADD  DEFAULT (NULL) FOR [UserID]
GO
ALTER TABLE [dbo].[userreview] ADD  DEFAULT (NULL) FOR [UserReviewID]
GO
ALTER TABLE [dbo].[userreview] ADD  DEFAULT (NULL) FOR [UserID]
GO
ALTER TABLE [dbo].[userreview] ADD  DEFAULT (NULL) FOR [rating_value]
GO
ALTER TABLE [dbo].[userreview] ADD  DEFAULT (NULL) FOR [OrderDetailID]
GO
ALTER TABLE [dbo].[variation] ADD  DEFAULT (NULL) FOR [ProductID]
GO
ALTER TABLE [dbo].[variation] ADD  DEFAULT (NULL) FOR [color_ID]
GO
ALTER TABLE [dbo].[variation] ADD  DEFAULT (NULL) FOR [size_ID]
GO
ALTER TABLE [dbo].[variation] ADD  DEFAULT (NULL) FOR [qty_in_stock]
GO
ALTER TABLE [dbo].[variation] ADD  DEFAULT (NULL) FOR [product_img_ID]
GO
ALTER TABLE [dbo].[address]  WITH NOCHECK ADD  CONSTRAINT [address$address_ibfk_1] FOREIGN KEY([CountryID])
REFERENCES [dbo].[country] ([CountryID])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [address$address_ibfk_1]
GO
ALTER TABLE [dbo].[cart]  WITH NOCHECK ADD  CONSTRAINT [cart$cart_ibfk_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [cart$cart_ibfk_1]
GO
ALTER TABLE [dbo].[cart_item]  WITH NOCHECK ADD  CONSTRAINT [cart_item$cart_item_ibfk_2] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([ProductID])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [cart_item$cart_item_ibfk_2]
GO
ALTER TABLE [dbo].[cart_item]  WITH NOCHECK ADD  CONSTRAINT [cart_item$cart_item_ibfk_3] FOREIGN KEY([VariationID])
REFERENCES [dbo].[variation] ([VariationID])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [cart_item$cart_item_ibfk_3]
GO
ALTER TABLE [dbo].[collection]  WITH NOCHECK ADD  CONSTRAINT [collection$collection_ibfk_1] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[promotion] ([PromotionID])
GO
ALTER TABLE [dbo].[collection] CHECK CONSTRAINT [collection$collection_ibfk_1]
GO
ALTER TABLE [dbo].[orderdetails]  WITH NOCHECK ADD  CONSTRAINT [orderdetails$orderdetails_ibfk_1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([ProductID])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [orderdetails$orderdetails_ibfk_1]
GO
ALTER TABLE [dbo].[orderdetails]  WITH NOCHECK ADD  CONSTRAINT [orderdetails$orderdetails_ibfk_2] FOREIGN KEY([OrderID])
REFERENCES [dbo].[shop_order] ([shop_orderID])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [orderdetails$orderdetails_ibfk_2]
GO
ALTER TABLE [dbo].[orderdetails]  WITH NOCHECK ADD  CONSTRAINT [orderdetails$orderdetails_ibfk_3] FOREIGN KEY([VariationID])
REFERENCES [dbo].[variation] ([VariationID])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [orderdetails$orderdetails_ibfk_3]
GO
ALTER TABLE [dbo].[payment]  WITH NOCHECK ADD  CONSTRAINT [payment$payment_ibfk_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [payment$payment_ibfk_1]
GO
ALTER TABLE [dbo].[payment]  WITH NOCHECK ADD  CONSTRAINT [payment$payment_ibfk_2] FOREIGN KEY([OrderDetailID])
REFERENCES [dbo].[orderdetails] ([OrderDetailID])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [payment$payment_ibfk_2]
GO
ALTER TABLE [dbo].[product]  WITH NOCHECK ADD  CONSTRAINT [product$product_ibfk_1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[category] ([CategoryID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [product$product_ibfk_1]
GO
ALTER TABLE [dbo].[product]  WITH NOCHECK ADD  CONSTRAINT [product$product_ibfk_2] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[collection] ([CollectionID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [product$product_ibfk_2]
GO
ALTER TABLE [dbo].[SaleAssignment]  WITH CHECK ADD  CONSTRAINT [FK_SaleAssignment_shop_order] FOREIGN KEY([orderId])
REFERENCES [dbo].[shop_order] ([shop_orderID])
GO
ALTER TABLE [dbo].[SaleAssignment] CHECK CONSTRAINT [FK_SaleAssignment_shop_order]
GO
ALTER TABLE [dbo].[SaleAssignment]  WITH CHECK ADD  CONSTRAINT [FK_SaleAssignment_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[SaleAssignment] CHECK CONSTRAINT [FK_SaleAssignment_user]
GO
ALTER TABLE [dbo].[shop_order]  WITH CHECK ADD  CONSTRAINT [FK_shop_order_Order_Status] FOREIGN KEY([Order_status])
REFERENCES [dbo].[Order_Status] ([id])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [FK_shop_order_Order_Status]
GO
ALTER TABLE [dbo].[shop_order]  WITH NOCHECK ADD  CONSTRAINT [shop_order$shop_order_ibfk_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [shop_order$shop_order_ibfk_1]
GO
ALTER TABLE [dbo].[shop_order]  WITH NOCHECK ADD  CONSTRAINT [shop_order$shop_order_ibfk_2] FOREIGN KEY([AddressID])
REFERENCES [dbo].[address] ([AddressID])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [shop_order$shop_order_ibfk_2]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_Role]
GO
ALTER TABLE [dbo].[useraddress]  WITH NOCHECK ADD  CONSTRAINT [useraddress$useraddress_ibfk_1] FOREIGN KEY([AddressID])
REFERENCES [dbo].[address] ([AddressID])
GO
ALTER TABLE [dbo].[useraddress] CHECK CONSTRAINT [useraddress$useraddress_ibfk_1]
GO
ALTER TABLE [dbo].[useraddress]  WITH NOCHECK ADD  CONSTRAINT [useraddress$useraddress_ibfk_2] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[useraddress] CHECK CONSTRAINT [useraddress$useraddress_ibfk_2]
GO
ALTER TABLE [dbo].[userreview]  WITH NOCHECK ADD  CONSTRAINT [userreview$userreview_ibfk_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[userreview] CHECK CONSTRAINT [userreview$userreview_ibfk_1]
GO
ALTER TABLE [dbo].[userreview]  WITH NOCHECK ADD  CONSTRAINT [userreview$userreview_ibfk_2] FOREIGN KEY([OrderDetailID])
REFERENCES [dbo].[orderdetails] ([OrderDetailID])
GO
ALTER TABLE [dbo].[userreview] CHECK CONSTRAINT [userreview$userreview_ibfk_2]
GO
ALTER TABLE [dbo].[variation]  WITH NOCHECK ADD  CONSTRAINT [variation$variation_ibfk_1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([ProductID])
GO
ALTER TABLE [dbo].[variation] CHECK CONSTRAINT [variation$variation_ibfk_1]
GO
ALTER TABLE [dbo].[variation]  WITH NOCHECK ADD  CONSTRAINT [variation$variation_ibfk_2] FOREIGN KEY([color_ID])
REFERENCES [dbo].[color] ([color_ID])
GO
ALTER TABLE [dbo].[variation] CHECK CONSTRAINT [variation$variation_ibfk_2]
GO
ALTER TABLE [dbo].[variation]  WITH NOCHECK ADD  CONSTRAINT [variation$variation_ibfk_3] FOREIGN KEY([size_ID])
REFERENCES [dbo].[size] ([size_ID])
GO
ALTER TABLE [dbo].[variation] CHECK CONSTRAINT [variation$variation_ibfk_3]
GO
ALTER TABLE [dbo].[variation]  WITH NOCHECK ADD  CONSTRAINT [variation$variation_ibfk_4] FOREIGN KEY([product_img_ID])
REFERENCES [dbo].[product_img] ([product_img_ID])
GO
ALTER TABLE [dbo].[variation] CHECK CONSTRAINT [variation$variation_ibfk_4]
GO
