USE [master]
GO
/****** Object:  Database [InventoryModule]    Script Date: 23-01-2024 10:09:56 ******/
CREATE DATABASE [InventoryModule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryModule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InventoryModule.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryModule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InventoryModule_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InventoryModule] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryModule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryModule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryModule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryModule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryModule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryModule] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryModule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryModule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryModule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryModule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryModule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryModule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryModule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryModule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryModule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryModule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryModule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryModule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryModule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryModule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryModule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryModule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryModule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryModule] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventoryModule] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryModule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryModule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryModule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryModule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryModule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryModule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InventoryModule] SET QUERY_STORE = OFF
GO
USE [InventoryModule]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateDiscountedPrice]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CalculateDiscountedPrice]
(
	@OriginalPrice DECIMAL(10,2),
	@DiscountPercentage DECIMAL(5,2)
)
RETURNS DECIMAL(10,2) AS 
BEGIN

	DECLARE @DiscountedPrice DECIMAL(10,2);
	SET @DiscountedPrice = @OriginalPrice  - (@OriginalPrice * @DiscountPercentage / 100.0);
	RETURN @DiscountedPrice;

END;

GO
/****** Object:  UserDefinedFunction [dbo].[CalculateTotalOrderAmount]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CalculateTotalOrderAmount]( @OrderID INT ) RETURNS DECIMAL(12,2) AS
BEGIN
	DECLARE @TotalAmount DECIMAL(12,2);

	SELECT @TotalAmount = SUM(PurchaseOrder.TotalAmount)
	FROM PurchaseOrder
	WHERE PurchaseOrder.OrderID = @OrderID

	RETURN @TotalAmount;
END;
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[InStockQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductWithCategory]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ProductWithCategory] AS
SELECT
	Product.ProductID,
	Product.ProductName,
	Product.CategoryID,
	Category.CategoryName,
	Product.UnitPrice,
	Product.InStockQuantity

FROM
    Product
JOIN
    Category  ON Product.CategoryID = Category.CategoryID;

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](12, 2) NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[TotalPrice] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PurchaseOrderDetails]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PurchaseOrderDetails] AS
SELECT
	PurchaseOrder.OrderID,
	PurchaseOrder.SupplierID,
	PurchaseOrder.OrderDate,
	PurchaseOrder.TotalAmount,
	PurchaseOrder.Status,
	OrderDetail.ProductID,
	OrderDetail.Quantity,
	OrderDetail.UnitPrice,
	OrderDetail.TotalPrice

FROM
	PurchaseOrder

JOIN
	OrderDetail ON PurchaseOrder.OrderID = OrderDetail.OrderID


GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[ContactPerson] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Category_CategoryName]    Script Date: 23-01-2024 10:09:56 ******/
CREATE NONCLUSTERED INDEX [IX_Category_CategoryName] ON [dbo].[Category]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_ProductName]    Script Date: 23-01-2024 10:09:56 ******/
CREATE NONCLUSTERED INDEX [IX_Product_ProductName] ON [dbo].[Product]
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (NULL) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (NULL) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (NULL) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (NULL) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [InStockQuantity]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT (NULL) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (NULL) FOR [ContactPerson]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (NULL) FOR [Phone]
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @ProductName VARCHAR(50),
    @CategoryID INT,
    @UnitPrice DECIMAL(10, 2),
    @InStockQuantity INT
AS
BEGIN
    INSERT INTO Product (ProductName, CategoryID, UnitPrice, InStockQuantity)
    VALUES (@ProductName, @CategoryID, @UnitPrice, @InStockQuantity);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
    @ProductID INT
AS
BEGIN
    DELETE FROM Product
    WHERE
        ProductID = @ProductID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DisplayProductWithCategory]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayProductWithCategory]
	@ProductID INT
AS
BEGIN
	SELECT * 
	FROM Product
	JOIN Category ON Product.CategoryID = Category.CategoryID
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectProducts]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProducts]
AS
BEGIN
    SELECT 
        ProductID,
        ProductName,
        CategoryID,
        UnitPrice,
        InStockQuantity
    FROM 
        Product;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 23-01-2024 10:09:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
    @ProductID INT,
    @ProductName VARCHAR(50),
    @CategoryID INT,
    @UnitPrice DECIMAL(10, 2),
    @InStockQuantity INT
AS
BEGIN
    UPDATE Product
    SET 
        ProductName = @ProductName,
        CategoryID = @CategoryID,
        UnitPrice = @UnitPrice,
        InStockQuantity = @InStockQuantity
    WHERE
        ProductID = @ProductID;
END;
GO
USE [master]
GO
ALTER DATABASE [InventoryModule] SET  READ_WRITE 
GO
