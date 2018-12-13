--Modeling the OLAP 
---OLTP E-R Model objects
-----------------------------------------------------------------
	--[dbo].[Categories](CategoryID,CategoryName,Description)
	--[dbo].[Customer](CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country)
	--[dbo].[Employees](EmployeeID,LastName,FirstName,BirthDate,Photo,Notes)
	--[dbo].[Shippers](ShipperID,ShipperName,Phone)
	--[dbo].[Orders](OrderID,CustomerID,EmployeeID,OrderDate,ShipperID)
	--[dbo].[Suppliers](SupplierID,SupplierName,ContactName,Address,City,PostalCode,Country,Phone)
	--[dbo].[Products](ProductID,ProductName,SupplierID,CategoryID,Unit,Price)
	--[dbo].[OrderDetails](OrderDetailID,OrderID,ProductID,Quantity)
-----------------------------------------------------------------
--OLAP F-D Model
	--CalenderDim(CalenderDimID,Year,Semister,Quarter,MonthNumber,MonthName,Date)
	--CustomerDim(CustomerDimID,CustomerName,LocationDimID)
	--EmployeeDim(EmployeeDimID,LastName,FirstName,BirthDate,Photo,Notes)
	--LocationDim(LocationDimID,Country,State,City,District,PostalCode)
	--OrderDim(OrderDimID,CustomerDimID,OrderDateID,ShipperID)
	--SuppliersDim(SupplierDimID,SupplierName,LocationDimID)
	--CategoryDim(CategoryDimID,CategoryName,Description) 
	--ProductDim(ProductDimID,ProductName,CategoryID,CategoryName,Description,SupplierDimID,Unit,Price,)
	--OrderHistoryFact(OrderHistoryID,OrderDateID,OrderID,CustomerDimID,EmployeeDimID,SupplierDimID,CategoryID,ProductDimID,OrderDetailID,ShipperID,OrderQuantity,SalesAmount)

CREATE TABLE CalenderDim
(
	 CalenderDimID INT PRIMARY KEY
	,[Year] INT
	,Semister TINYINT
	,[Quarter] TINYINT
	,MonthNumber TINYINT
	,[MonthName] VARCHAR(100)
	,[Date] DATE
)

CREATE TABLE LocationDim
(
	 LocationDimID INT IDENTITY(1,1) PRIMARY KEY
	,Country NVARCHAR(100)
	,[State] NVARCHAR(100)
	,City NVARCHAR(100)
	,District NVARCHAR(100)
	,PostalCode  INT 
)


CREATE TABLE CustomerDim
(
	 CustomerDimID INT IDENTITY(1,1) PRIMARY KEY 
	,CustomerName VARCHAR(100)
	,LocationDimID INT FOREIGN KEY REFERENCES LocationDim(LocationDimID) 
)


CREATE TABLE EmployeeDim
(
	 EmployeeDimID INT IDENTITY(1,1) PRIMARY KEY 
	,LastName NVARCHAR(100)
	,FirstName NVARCHAR(100)
	,BirthDate  DATE
	,Photo NVARCHAR(100)
	,Notes NVARCHAR(MAX)
)

CREATE TABLE OrderDim
(
	 OrderDimID INT IDENTITY(1,1) PRIMARY KEY
	,CustomerDimID INT FOREIGN KEY REFERENCES CustomerDim(CustomerDimID)
	,OrderDateID INT FOREIGN KEY REFERENCES CalenderDim(CalenderDimID)
	,ShipperID  INT
)
CREATE TABLE SupplierDim
(
	 SupplierDimID INT IDENTITY(1,1)  PRIMARY KEY
	,SupplierName NVARCHAR(100)
	,LocationDimID INT FOREIGN KEY REFERENCES LocationDim(LocationDimID) 
)

CREATE TABLE [CategoryDim]
 (
 	 [CategoryDimID] INT IDENTITY(1,1) PRIMARY KEY
	,[CategoryName] [nvarchar](255) 
	,[Description] [nvarchar](255)
) 

CREATE TABLE ProductDim
(
	 ProductDimID INT IDENTITY(1,1) PRIMARY KEY
	,ProductName NVARCHAR(100)
	,CategoryDimID INT FOREIGN KEY REFERENCES CategoryDim(CategoryDimID) 
	,CategoryName NVARCHAR(100)
	,[Description] NVARCHAR(MAX)
	,SupplierDimID  INT FOREIGN KEY REFERENCES SupplierDim(SupplierDimID) 
	,Unit NVARCHAR(100)
	,Price MONEY
)


--DROP TABLE OrderHistoryFact

CREATE TABLE OrderHistoryFact
(
	 OrderHistoryID INT IDENTITY(1,1) PRIMARY KEY
	,OrderDateID INT FOREIGN KEY REFERENCES CalenderDim(CalenderDimID) 
	,OrderDimID INT FOREIGN KEY REFERENCES OrderDim(OrderDimID) 
	,OrderID INT
	,CustomerDimID INT FOREIGN KEY REFERENCES CustomerDim(CustomerDimID) 
	,EmployeeDimID INT FOREIGN KEY REFERENCES EmployeeDim(EmployeeDimID) 
	,SupplierDimID INT FOREIGN KEY REFERENCES SupplierDim(SupplierDimID) 
	,CategoryDimID INT FOREIGN KEY REFERENCES CategoryDim(CategoryDimID) 
	,ProductDimID  INT FOREIGN KEY REFERENCES ProductDim(ProductDimID)  
	,OrderDetailID INT
	,ShipperID INT
	,OrderQuantity FLOAT
	,SalesAmount MONEY
)


