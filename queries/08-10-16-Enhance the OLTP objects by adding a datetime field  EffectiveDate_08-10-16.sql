--Enhance the OLTP objects by adding a datetime field  EffectiveDate

SELECT * FROM INFORMATION_SCHEMA.TABLES

ALTER TABLE Categories ADD EffectiveDate DATETIME
ALTER TABLE Customer ADD EffectiveDate DATETIME
ALTER TABLE Employees ADD EffectiveDate DATETIME
ALTER TABLE Shippers ADD EffectiveDate DATETIME
ALTER TABLE Suppliers ADD EffectiveDate DATETIME
ALTER TABLE Products ADD EffectiveDate DATETIME

GO

UPDATE Categories SET EffectiveDate = GETDATE()-1
UPDATE Customer SET EffectiveDate = GETDATE()-1
UPDATE Employees SET EffectiveDate = GETDATE()-1
UPDATE Shippers SET EffectiveDate = GETDATE()-1
UPDATE Suppliers SET EffectiveDate = GETDATE()-1
UPDATE Products SET EffectiveDate = GETDATE()-1


SELECT * FROM Categories


--2016-10-07 00:00:00.000 to 2016-10-07 23:59:59.997

SELECT CAST(CONVERT(VARCHAR(100),GETDATE()-1,107) AS DATETIME) DateFrom
SELECT DATEADD(MILLISECOND,-3,CAST(CONVERT(VARCHAR(100),GETDATE(),107) AS DATETIME)) DateTo



SELECT GETDATE()

SELECT DATEADD(DAY,1,CAST(CONVERT(VARCHAR(100),GETDATE()-1,105) AS DATETIME))

2016-07-10 00:00:00.000