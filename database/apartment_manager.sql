USE [ams]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aparment]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aparment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[type_id] [int] NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[commune] [nvarchar](100) NULL,
	[price] [decimal](18, 0) NULL,
	[area] [decimal](18, 0) NULL,
	[number_of_bedroom] [int] NULL,
	[status_apartment] [int] NULL,
	[landlord_id] [int] NULL,
	[tenant_id] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_image]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[Apartment_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_Posts]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[post_status] [int] NULL,
	[post_start] [date] NULL,
	[post_end] [date] NULL,
	[apartment_id] [int] NULL,
	[payment_id] [int] NULL,
	[landlord_id] [int] NULL,
	[first_image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Apartment_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_room]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apartment_id] [int] NOT NULL,
	[property_id] [int] NOT NULL,
 CONSTRAINT [PK_Apartment_room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_type]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Apartment_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community_post]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community_post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nchar](200) NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Community_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow_user]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow_user](
	[id] [int] NOT NULL,
	[id_user_followed] [int] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_Follow_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_post]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[post_id] [int] NOT NULL,
 CONSTRAINT [PK_Image_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident](
	[id] [int] NOT NULL,
	[tenant_id] [int] NOT NULL,
	[landlord_id] [int] NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [nchar](10) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Incident] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landlord]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landlord](
	[id] [int] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[civil_id] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_landlord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payement_method]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payement_method](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](18, 0) NULL,
	[week] [int] NULL,
 CONSTRAINT [PK_Payement_method] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[room_id] [int] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_maintain]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_maintain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apartment_id] [int] NOT NULL,
	[tenant_id] [int] NOT NULL,
	[landlord_id] [int] NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[date_post] [date] NOT NULL,
 CONSTRAINT [PK_Report_maintain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id] [int] NOT NULL,
	[user_name] [nchar](10) NULL,
	[staff_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[id] [int] NOT NULL,
	[civil_id] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[image] [nvarchar](max) NULL,
	[money] [decimal](18, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_image]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_image](
	[user_id] [int] NOT NULL,
	[image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User_image] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Whislist]    Script Date: 5/27/2024 8:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Whislist](
	[id] [int] NULL,
	[user_id] [int] NULL,
	[Apartment_id] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [user_name], [phone]) VALUES (1, N'thinh5k', N'0987654321')
GO
SET IDENTITY_INSERT [dbo].[Aparment] ON 

INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (1, N'thinh', 1, N'ha noi', N'ha noi', N'dong anh', N'dai mach', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 2, 0, 1, 1)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (3, N'Trọ xanh', 1, N'cây xăng 39', N'', N'', N'', CAST(690000 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 1, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (4, N'Trọ xanh', 1, N'cây xăng 39', N'Thành phố Hà Nội', N'Huyện Thạch Thất', N'Xã Thạch Hoà', CAST(690000 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 1, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (5, N'', 4, N'', N'', N'', N'', CAST(8500000 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), 2, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (6, N'', 3, N'', N'', N'', N'', CAST(690000 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), 2, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (7, N'nhà của thịnh', 1, N'', N'', N'', N'', CAST(1000000 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), 2, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (8, N'nhà của thịnh 2', 1, N' hà nội thôi', N'', N'', N'', CAST(1000000 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), 2, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (9, N'nhà của thịnh 3', 1, N'', N'', N'', N'', CAST(1000000 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), 2, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (10, N'nhà của thịnh 4', 2, N' hà nội thôi', N'', N'', N'', CAST(1000000 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), 2, 0, 2, 2)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (11, N'thinh 23', 7, N'số nhà 20', N'Tỉnh Hải Dương', N'Thành phố Chí Linh', N'Phường An Lạc', CAST(10000000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 4, 0, 2, 2)
SET IDENTITY_INSERT [dbo].[Aparment] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_image] ON 

INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (1, N'354223102_642172021265873_3675297031987126265_n.jpg', 11)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (2, N'357523368_742648257549436_2184860140300102511_n.jpg', 11)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (3, N'359755576_796825365377796_8208735724304248994_n.jpg', 11)
SET IDENTITY_INSERT [dbo].[Apartment_image] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_Posts] ON 

INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (5, N'1', N'1', 1, CAST(N'2024-05-25' AS Date), CAST(N'2003-02-02' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (6, N'2', N'2', 2, CAST(N'2002-02-02' AS Date), CAST(N'2003-02-20' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (7, N'asdasd', N'asdasdasd', 1, NULL, NULL, 1, 2, 1, NULL)
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (8, N'thinh', N'', 0, NULL, NULL, 1, 4, 1, NULL)
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (9, N'ádas', N'ádsa', 1, CAST(N'2024-05-27' AS Date), NULL, 1, 1, 1, NULL)
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (10, N'', N'', 1, CAST(N'2024-05-27' AS Date), CAST(N'2024-06-10' AS Date), 3, 1, 1, NULL)
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (12, N'asdas', N'asdasd', 1, CAST(N'2024-05-27' AS Date), CAST(N'2024-07-01' AS Date), 11, 4, 2, N'354223102_642172021265873_3675297031987126265_n.jpg')
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image]) VALUES (13, N'asdas', N'asdasd', 1, CAST(N'2024-05-27' AS Date), CAST(N'2024-06-17' AS Date), 11, 2, 2, N'354223102_642172021265873_3675297031987126265_n.jpg')
SET IDENTITY_INSERT [dbo].[Apartment_Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_room] ON 

INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (63, 10, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (64, 10, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (65, 10, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (66, 10, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (67, 10, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (68, 11, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (69, 11, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (70, 11, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (71, 11, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (72, 11, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (73, 11, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (74, 11, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (75, 11, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (76, 11, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (77, 11, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (78, 11, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (79, 11, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (80, 11, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (81, 11, 14)
SET IDENTITY_INSERT [dbo].[Apartment_room] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_type] ON 

INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (1, N'Căn hộ mini')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (2, N'Căn hộ trung cấp')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (3, N'Căn hộ cao cấp')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (4, N'Căn hộ penthouse')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (5, N'Căn hộ duplex')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (6, N'Căn hộ skyvilla')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (7, N'Căn hộ loft-house')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (8, N'Căn hộ studio')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (9, N'Căn hộ condotel')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (10, N'Căn hộ officetel')
SET IDENTITY_INSERT [dbo].[Apartment_type] OFF
GO
INSERT [dbo].[landlord] ([id], [address], [civil_id], [phone]) VALUES (2, N'Hà Đông', N'01100023412', N'0123456789')
GO
SET IDENTITY_INSERT [dbo].[Payement_method] ON 

INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (1, N'Basic', N'Là loại tin đăng có tiêu đề màu đen', CAST(100000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (2, N'Silver', N'Là loại tin đăng có tiêu đề màu xanh', CAST(200000 AS Decimal(18, 0)), 3)
INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (3, N'Gold', N'Là loại tin đăng có tiêu đề màu vàng', CAST(300000 AS Decimal(18, 0)), 4)
INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (4, N'Diamond', N'Là loại tin đăng có tiêu đề màu đỏ', CAST(400000 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[Payement_method] OFF
GO
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (1, N'Kệ TV', 1)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (2, N'Tủ trang trí', 1)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (3, N'Bàn ghế phòng khách', 1)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (4, N'Giường ngủ', 2)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (5, N'Bàn phấn', 2)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (6, N'Tủ quần áo', 2)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (7, N'Tủ bếp', 4)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (8, N'Bàn ăn', 4)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (9, N'Máy hút mùi', 4)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (10, N'BÌnh nóng lạnh', 3)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (11, N'Bồn tắm', 3)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (12, N'Vòi hoa sen', 3)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (13, N'Bồn rửa mặt', 3)
INSERT [dbo].[Property] ([id], [name], [room_id]) VALUES (14, N'Bồn cầu', 3)
SET IDENTITY_INSERT [dbo].[Property] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (2, N'Landlord')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (3, N'Tenant')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (4, N'Guess')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [name]) VALUES (1, N'Livingroom')
INSERT [dbo].[Room] ([id], [name]) VALUES (2, N'Bedroom')
INSERT [dbo].[Room] ([id], [name]) VALUES (3, N'Bathroom')
INSERT [dbo].[Room] ([id], [name]) VALUES (4, N'Kitchen')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
INSERT [dbo].[Tenant] ([id], [civil_id], [phone]) VALUES (6, N'012830123802183', N'0192837465')
INSERT [dbo].[Tenant] ([id], [civil_id], [phone]) VALUES (7, N'873284238463246', N'0987612345')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (1, N'thinhnnthe172159@gmail.com', N'123', 1, 0, N'Nguyễn Trọng', N'Thịnh', CAST(N'1990-02-02' AS Date), NULL, NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (2, N'thai1992@gmail.com', N'123', 2, 0, N'Lê Duy', N'Thái', CAST(N'1992-02-04' AS Date), NULL, NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (6, N'LeHUy1991@gmail.com', N'123', 3, 0, N'Lê Đức', N'Huy', CAST(N'1991-04-19' AS Date), NULL, NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (7, N'Haiquoc2000@gmail.com', N'123', 3, 0, N'Nguyễn Quốc', N'Hải', CAST(N'2000-02-03' AS Date), NULL, NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (9, N'LeHUy1991@gmail.com', N'123', 3, 0, N'Lê Đức', N'Huy', CAST(N'1991-04-19' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Apartment_Posts] ADD  CONSTRAINT [DF_Apartment_Post_post_start_1]  DEFAULT (getdate()) FOR [post_start]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_Apartment_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[Apartment_type] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_Apartment_type]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_User]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_User1]
GO
ALTER TABLE [dbo].[Apartment_image]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_image_Aparment] FOREIGN KEY([Apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Apartment_image] CHECK CONSTRAINT [FK_Apartment_image_Aparment]
GO
ALTER TABLE [dbo].[Apartment_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Posts_Aparment] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Apartment_Posts] CHECK CONSTRAINT [FK_Apartment_Posts_Aparment]
GO
ALTER TABLE [dbo].[Apartment_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Posts_Payement_method] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payement_method] ([id])
GO
ALTER TABLE [dbo].[Apartment_Posts] CHECK CONSTRAINT [FK_Apartment_Posts_Payement_method]
GO
ALTER TABLE [dbo].[Apartment_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Posts_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Apartment_Posts] CHECK CONSTRAINT [FK_Apartment_Posts_User]
GO
ALTER TABLE [dbo].[Apartment_room]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_room_Aparment] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Apartment_room] CHECK CONSTRAINT [FK_Apartment_room_Aparment]
GO
ALTER TABLE [dbo].[Apartment_room]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_room_Property] FOREIGN KEY([property_id])
REFERENCES [dbo].[Property] ([id])
GO
ALTER TABLE [dbo].[Apartment_room] CHECK CONSTRAINT [FK_Apartment_room_Property]
GO
ALTER TABLE [dbo].[Community_post]  WITH CHECK ADD  CONSTRAINT [FK_Community_post_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Community_post] CHECK CONSTRAINT [FK_Community_post_User]
GO
ALTER TABLE [dbo].[Follow_user]  WITH CHECK ADD  CONSTRAINT [FK_Follow_user_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Follow_user] CHECK CONSTRAINT [FK_Follow_user_User]
GO
ALTER TABLE [dbo].[Follow_user]  WITH CHECK ADD  CONSTRAINT [FK_Follow_user_User1] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Follow_user] CHECK CONSTRAINT [FK_Follow_user_User1]
GO
ALTER TABLE [dbo].[Image_post]  WITH CHECK ADD  CONSTRAINT [FK_Image_post_Community_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Community_post] ([id])
GO
ALTER TABLE [dbo].[Image_post] CHECK CONSTRAINT [FK_Image_post_Community_post]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_User]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_User1]
GO
ALTER TABLE [dbo].[landlord]  WITH CHECK ADD  CONSTRAINT [FK_landlord_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[landlord] CHECK CONSTRAINT [FK_landlord_User]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Room]
GO
ALTER TABLE [dbo].[Report_maintain]  WITH CHECK ADD  CONSTRAINT [FK_Report_maintain_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Report_maintain] CHECK CONSTRAINT [FK_Report_maintain_User]
GO
ALTER TABLE [dbo].[Report_maintain]  WITH CHECK ADD  CONSTRAINT [FK_Report_maintain_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Report_maintain] CHECK CONSTRAINT [FK_Report_maintain_User1]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_User]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenant_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenant_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User_image]  WITH CHECK ADD  CONSTRAINT [FK_User_image_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_image] CHECK CONSTRAINT [FK_User_image_User]
GO
ALTER TABLE [dbo].[Whislist]  WITH CHECK ADD  CONSTRAINT [FK_Whislist_Aparment] FOREIGN KEY([Apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Whislist] CHECK CONSTRAINT [FK_Whislist_Aparment]
GO
ALTER TABLE [dbo].[Whislist]  WITH CHECK ADD  CONSTRAINT [FK_Whislist_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Whislist] CHECK CONSTRAINT [FK_Whislist_User]
GO
