create table Orders
(
    OrderID int foreign key references Orderdetails (OrderID ),
	CustomerID	int foreign key references Customers (CustomerID),
	EmployeeID	int  foreign key references Employee(EmployeeID),
	OrderDate	date,
	ShipperID int foreign key references Shippers(ShipperID)
)
create table orderdetails
(
OrderDetailID	int,
OrderID	int  primary key ,
ProductID int ,
Quantity varchar(100)
)


create table categoriesdetails
(

    CategoryID int ,
	CategoryName varchar(100),
	Descriptions varchar(100)
)

create table customers
(
CustomerID	int primary key,
CustomerName	varchar(100),
ContactName	varchar(100),
Address1 varchar(100),	
City	varchar(100),
PostalCode int ,
Country varchar(100)

)

create table Employee 
(
    EmployeeID int primary  key,
	LastName varchar(100),
	FirstName varchar(100),
	BirthDate	date,
	Photo	varchar(100),
	Notes varchar(100)
)

create table Products 
(
ProductID int primary key,
ProductName varchar(100),
SupplierID int foreign key references Suppliers(ShipperID) ,
CategoryID	int,
Unit	varchar(100),
Price money
)
create table  Shippers
(
ShipperID int primary key,
ShipperName varchar(100),
Phone int
)
create table Suppliers
(
SupplierID	int primary key,
SupplierName varchar(100),
ContactName	 varchar(100),
Address1 varchar(100),
City varchar(100),
PostalCode int,
Country varchar(100),
Phone int
)
