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
	--ProductDim(ProductDimID,ProductName,CategoryID,CategoryName,Description,SupplierDimID,Unit,Price,)
	--OrderHistoryFact(OrderHistoryID,OrderID,CustomerDimID,EmployeeDimID,SupplierDimID,CategoryID,ProductDimID,OrderDetailID,ShipperID,OrderQuantity,SalesAmount)
