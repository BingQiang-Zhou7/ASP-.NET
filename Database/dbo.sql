/*
 Navicat Premium Data Transfer

 Source Server         : SQLSERVER_REMOTE
 Source Server Type    : SQL Server
 Source Server Version : 11002100
 Source Host           : bingqiangzhou.cn:1433
 Source Catalog        : TestRemote
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 11002100
 File Encoding         : 65001

 Date: 24/09/2018 11:14:03
*/


-- ----------------------------
-- Table structure for Commodity
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Commodity]') AND type IN ('U'))
	DROP TABLE [dbo].[Commodity]
GO

CREATE TABLE [dbo].[Commodity] (
  [CommodityID] nvarchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Price] float(53)  NULL,
  [Image] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Commodity] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Commodity
-- ----------------------------
INSERT INTO [dbo].[Commodity]  VALUES (N'C001', N'全脂牛奶', N'89', N'全脂牛奶89.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C002', N'双蛋白莲蓉月饼', N'149', N'双蛋白莲蓉月饼149.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C003', N'坚果大礼包', N'118', N'坚果大礼包118.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C004', N'柠檬茶饮料', N'57', N'柠檬茶饮料57.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C005', N'玫瑰红糖', N'37', N'玫瑰红糖37.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C006', N'珍珠米', N'28', N'珍珠米28.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C007', N'酸奶', N'45', N'酸奶45.jpg')
GO

INSERT INTO [dbo].[Commodity]  VALUES (N'C008', N'食用油', N'103', N'食用油103.jpg')
GO


-- ----------------------------
-- Table structure for Details
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Details]') AND type IN ('U'))
	DROP TABLE [dbo].[Details]
GO

CREATE TABLE [dbo].[Details] (
  [ID] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Name] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TypeID] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Number] int  NULL,
  [Price] float(53)  NULL,
  [ImgPath] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Details] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Details
-- ----------------------------
INSERT INTO [dbo].[Details]  VALUES (N'D001', N'Apple Iphone Xs Max', N'T001', N'1000', N'10000', N'images/iphonexsmax.png')
GO

INSERT INTO [dbo].[Details]  VALUES (N'D002', N'Huawei Mate 10', N'T002', N'100', N'4000', N'images/mate10.png')
GO

INSERT INTO [dbo].[Details]  VALUES (N'D003', N'XiaoMi Phone 8', N'T003', N'100', N'2000', N'images/xiaomi8.png')
GO

INSERT INTO [dbo].[Details]  VALUES (N'D004', N'Apple Macbook Pro', N'T001', N'100', N'20000', N'images/macbookpro.png')
GO

INSERT INTO [dbo].[Details]  VALUES (N'D005', N'Huawei Magicbook', N'T002', N'100', N'10000', N'images/magicbook.png')
GO

INSERT INTO [dbo].[Details]  VALUES (N'D006', N'XiaoMi Airbook', N'T003', N'100', N'6000', N'images/air.png')
GO


-- ----------------------------
-- Table structure for OrderList
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderList]') AND type IN ('U'))
	DROP TABLE [dbo].[OrderList]
GO

CREATE TABLE [dbo].[OrderList] (
  [OrderID] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [CommodityID] nvarchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Amount] int  NULL
)
GO

ALTER TABLE [dbo].[OrderList] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of OrderList
-- ----------------------------
INSERT INTO [dbo].[OrderList]  VALUES (N'O131821538864282947', N'C001', N'2')
GO

INSERT INTO [dbo].[OrderList]  VALUES (N'O131821538864282947', N'C003', N'1')
GO

INSERT INTO [dbo].[OrderList]  VALUES (N'O131821538864282947', N'C004', N'1')
GO


-- ----------------------------
-- Table structure for ShoppingCart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCart]') AND type IN ('U'))
	DROP TABLE [dbo].[ShoppingCart]
GO

CREATE TABLE [dbo].[ShoppingCart] (
  [CommodityID] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Amount] int  NULL
)
GO

ALTER TABLE [dbo].[ShoppingCart] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ShoppingCart
-- ----------------------------
INSERT INTO [dbo].[ShoppingCart]  VALUES (N'', N'43')
GO

INSERT INTO [dbo].[ShoppingCart]  VALUES (N'C001', N'1')
GO

INSERT INTO [dbo].[ShoppingCart]  VALUES (N'C002', N'3')
GO


-- ----------------------------
-- Table structure for Table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Table]') AND type IN ('U'))
	DROP TABLE [dbo].[Table]
GO

CREATE TABLE [dbo].[Table] (
  [Id] int  NOT NULL,
  [name] nchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Table] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Table
-- ----------------------------
INSERT INTO [dbo].[Table]  VALUES (N'1', N'1         ')
GO

INSERT INTO [dbo].[Table]  VALUES (N'2', N'2         ')
GO


-- ----------------------------
-- Table structure for Type
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Type]') AND type IN ('U'))
	DROP TABLE [dbo].[Type]
GO

CREATE TABLE [dbo].[Type] (
  [TypeID] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [TypeName] nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Type] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Type
-- ----------------------------
INSERT INTO [dbo].[Type]  VALUES (N'T001', N'Apple')
GO

INSERT INTO [dbo].[Type]  VALUES (N'T002', N'Huawei')
GO

INSERT INTO [dbo].[Type]  VALUES (N'T003', N'XiaoMi')
GO


-- ----------------------------
-- Procedure structure for Proc_AddCommodityToShoppingCart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_AddCommodityToShoppingCart]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Proc_AddCommodityToShoppingCart]
GO

CREATE PROCEDURE [dbo].[Proc_AddCommodityToShoppingCart]
  @ID AS nvarchar(16) 
AS
BEGIN
	IF EXISTS(SELECT * FROM ShoppingCart WHERE CommodityID = @ID)
			UPDATE ShoppingCart SET Amount=Amount+1 WHERE CommodityID = @ID;
	ELSE
			INSERT INTO ShoppingCart(CommodityID,Amount)
			VALUES(@ID,1);
END
GO


-- ----------------------------
-- Procedure structure for Proc_DeleteCommodityFromShoppingcart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_DeleteCommodityFromShoppingcart]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Proc_DeleteCommodityFromShoppingcart]
GO

CREATE PROCEDURE [dbo].[Proc_DeleteCommodityFromShoppingcart]
  @ID AS nvarchar(16) 
AS
BEGIN
	DELETE FROM ShoppingCart
	WHERE CommodityID = @ID;
END
GO


-- ----------------------------
-- Procedure structure for Proc_MinusCommodityFromShoppingCart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_MinusCommodityFromShoppingCart]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Proc_MinusCommodityFromShoppingCart]
GO

CREATE PROCEDURE [dbo].[Proc_MinusCommodityFromShoppingCart]
  @ID AS nvarchar(16)
AS
BEGIN
		UPDATE ShoppingCart SET Amount=Amount-1 WHERE CommodityID = @ID;
END
GO


-- ----------------------------
-- Procedure structure for Proc_AddCommodityToOrder
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_AddCommodityToOrder]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Proc_AddCommodityToOrder]
GO

CREATE PROCEDURE [dbo].[Proc_AddCommodityToOrder]
  @OrderNO AS nvarchar(32),
	@ID AS nvarchar(16),
  @Number AS INT 
AS
BEGIN
	INSERT INTO OrderList VALUES(@OrderNO,@ID,@Number);
	EXEC Proc_DeleteCommodityFromShoppingcart @ID;
END
GO


-- ----------------------------
-- Procedure structure for Proc_SelectOrderInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_SelectOrderInfo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Proc_SelectOrderInfo]
GO

CREATE PROCEDURE [dbo].[Proc_SelectOrderInfo]
AS
BEGIN
	SELECT * FROM OrderList
	INNER JOIN Commodity ON OrderList.CommodityID = Commodity.CommodityID;
END
GO


-- ----------------------------
-- Procedure structure for Proc_DeleteOrderInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_DeleteOrderInfo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Proc_DeleteOrderInfo]
GO

CREATE PROCEDURE [dbo].[Proc_DeleteOrderInfo]
  @ID AS nvarchar(32)
AS
BEGIN
	DELETE FROM OrderList
	WHERE OrderID = @ID;
END
GO


-- ----------------------------
-- Primary Key structure for table Commodity
-- ----------------------------
ALTER TABLE [dbo].[Commodity] ADD CONSTRAINT [PK__Commodit__3214EC2785540869] PRIMARY KEY CLUSTERED ([CommodityID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Details
-- ----------------------------
CREATE NONCLUSTERED INDEX [IX_Details]
ON [dbo].[Details] (
  [ID] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Details
-- ----------------------------
ALTER TABLE [dbo].[Details] ADD CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table OrderList
-- ----------------------------
ALTER TABLE [dbo].[OrderList] ADD CONSTRAINT [PK__Order__C3905BAF9A6B886A] PRIMARY KEY CLUSTERED ([OrderID], [CommodityID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ShoppingCart
-- ----------------------------
ALTER TABLE [dbo].[ShoppingCart] ADD CONSTRAINT [PK__Shopping__5C5A915AB59FA644] PRIMARY KEY CLUSTERED ([CommodityID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Table
-- ----------------------------
ALTER TABLE [dbo].[Table] ADD CONSTRAINT [PK__Table__3214EC07E3DB7E98] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

