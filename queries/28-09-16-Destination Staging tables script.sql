--Destination Staging tables script

CREATE TABLE [dbo].[CalenderDim](
	[Staging_CalenderDimID] [int] NOT NULL,
	[Year] [int] NULL,
	[Semister] [tinyint] NULL,
	[Quarter] [tinyint] NULL,
	[MonthNumber] [tinyint] NULL,
	[MonthName] [varchar](100) NULL,
	[Date] [date] NULL
) 


CREATE TABLE [dbo].[CategoryDim](
	[Staging_CategoryDimID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL
) 


CREATE TABLE [dbo].[CustomerDim](
	[Staging_CustomerDimID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[LocationDimID] [int] NULL
) 


CREATE TABLE [dbo].[EmployeeDim](
	[Staging_EmployeeDimID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[BirthDate] [date] NULL,
	[Photo] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL
) 


CREATE TABLE [dbo].[LocationDim](
	[Staging_LocationDimID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[PostalCode] [int] NULL
) 


CREATE TABLE [dbo].[OrderDim](
	[Staging_OrderDimID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerDimID] [int] NULL,
	[OrderDateID] [int] NULL,
	[ShipperID] [int] NULL
) 


CREATE TABLE [dbo].[OrderHistoryFact](
	[Staging_OrderHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDateID] [int] NULL,
	[OrderDimID] [int] NULL,
	[OrderID] [int] NULL,
	[CustomerDimID] [int] NULL,
	[EmployeeDimID] [int] NULL,
	[SupplierDimID] [int] NULL,
	[CategoryDimID] [int] NULL,
	[ProductDimID] [int] NULL,
	[OrderDetailID] [int] NULL,
	[ShipperID] [int] NULL,
	[OrderQuantity] [float] NULL,
	[SalesAmount] [money] NULL
) 


CREATE TABLE [dbo].[ProductDim](
	[Staging_ProductDimID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[CategoryDimID] [int] NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[SupplierDimID] [int] NULL,
	[Unit] [nvarchar](100) NULL,
	[Price] [money] NULL
) 

CREATE TABLE [dbo].[SupplierDim](
	[Staging_SupplierDimID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[LocationDimID] [int] NULL
) 

GO
