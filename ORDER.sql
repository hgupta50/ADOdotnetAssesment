USE [Orders]
GO
/****** Object:  Table [dbo].[Order1]    Script Date: 11/2/2019 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order1](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_Name] [varchar](30) NULL,
	[Quantity] [int] NULL,
	[Total] [float] NULL,
	[PId] [int] NULL,
	[SId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/2/2019 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11/2/2019 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [varchar](30) NULL,
	[Price] [float] NULL,
	[Location] [varchar](50) NULL,
	[PId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order1] ON 

INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (1, N'Aatisha', 2, 12000, 3, 7)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (2, N'Aatisha', 2, 4000, 3, 6)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (3, N'Harshit', 1, 2890, 1, 2)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (4, N'Esha', 1, 4670, 1, 5)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (5, N'Aditya Dcruz', 2, 10000, 3, 4)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (7, N'Aditya', 1, 5000, 3, 4)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (8, N'Aakanksha', 1, 4670, 1, 5)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (9, N'Aakanksha', 2, 5780, 1, 2)
INSERT [dbo].[Order1] ([Order_ID], [Order_Name], [Quantity], [Total], [PId], [SId]) VALUES (10, N'Geetha', 1, 3000, 2, 1)
SET IDENTITY_INSERT [dbo].[Order1] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Product_Name]) VALUES (1, N'Television')
INSERT [dbo].[Product] ([Product_ID], [Product_Name]) VALUES (2, N'Laptop')
INSERT [dbo].[Product] ([Product_ID], [Product_Name]) VALUES (3, N'Mobile Phone')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (1, N'Mukesh Singh', 3000, N'Chattisgarh', 2)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (2, N'Amit Tiwary', 2890, N'Jaipur', 1)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (3, N'Vijay Kumar', 4500, N'Bangalore', 1)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (4, N'Neetu Edward', 5000, N'Surat', 3)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (5, N'Leena Singh', 4670, N'Patna', 1)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (6, N'Jaspreet Kaur', 2000, N'Punjab', 3)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Price], [Location], [PId]) VALUES (7, N'Vikram Seth', 6000, N'Chennai', 3)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[Order1]  WITH CHECK ADD FOREIGN KEY([PId])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Order1]  WITH CHECK ADD FOREIGN KEY([SId])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD FOREIGN KEY([PId])
REFERENCES [dbo].[Product] ([Product_ID])
GO
