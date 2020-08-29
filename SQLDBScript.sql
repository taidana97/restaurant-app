USE [RestaurantDB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderItems_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderItems]'))
ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK_OrderItems_Order]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderItems_Item]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderItems]'))
ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK_OrderItems_Item]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/7/2018 7:37:48 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderItems]') AND type in (N'U'))
DROP TABLE [dbo].[OrderItems]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/7/2018 7:37:48 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/7/2018 7:37:48 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
DROP TABLE [dbo].[Item]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/7/2018 7:37:48 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/7/2018 7:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/7/2018 7:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/7/2018 7:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](50) NULL,
	[CustomerID] [int] NULL,
	[PMethod] [varchar](50) NULL,
	[GTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/7/2018 7:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Item]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (1, N'Olivia Kathleen')
GO
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (2, N'Liam Patrick')
GO
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (3, N'Charlotte Rose')
GO
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (4, N'Elijah Burke ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (5, N'Ayesha Ameer')
GO
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (6, N'Eva Louis')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (1, N'Chicken Tenders', CAST(3.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (2, N'Chicken Tenders w/ Fries', CAST(4.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (3, N'Chicken Tenders w/ Onion', CAST(5.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (4, N'Grilled Cheese Sandwich', CAST(2.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (5, N'Grilled Cheese Sandwich w/ Fries', CAST(3.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (6, N'Grilled Cheese Sandwich w/ Onion', CAST(4.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (7, N'Lettuce and Tomato Burger', CAST(1.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (8, N'Soup', CAST(2.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (9, N'Onion Rings', CAST(2.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (10, N'Fries', CAST(1.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (11, N'Sweet Potato Fries', CAST(2.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (12, N'Sweet Tea', CAST(1.79 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (13, N'Botttle Water', CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (14, N'Canned Drinks', CAST(1.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
