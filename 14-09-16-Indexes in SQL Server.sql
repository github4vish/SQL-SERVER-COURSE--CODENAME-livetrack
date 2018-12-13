--Indexes in SQL Server

	--SELECT * FROM EmpDetails_WithConstraints
	--WHERE EMPID BETWEEN 10 AND 20

	--SELECT * FROM [dbo].[EmpTab]--Heap
	--WHERE EMPID BETWEEN 10 AND 20

--General syntax
CREATE CLUSTERED/NONCLUSTERED INDEX <IndexName> ON <TableName>(Column(s))

SELECT *  into  Bulk_EmpDetails_Ex from master.dbo.Bulk_EmpDetails_Ex
SELECT * into Bak_Bulk_EmpDetails_Ex from master.dbo.Bak_Bulk_EmpDetails_Ex


SP_SPACEUSED Bulk_EmpDetails_Ex
GO
SP_SPACEUSED Bak_Bulk_EmpDetails_Ex

SELECT 630952/1024.00

--Before indexes

	SELECT * FROM Bulk_EmpDetails_Ex 
	WHERE FirstName = '' --00:00:05 Seconds

	SELECT * FROM Bak_Bulk_EmpDetails_Ex
	WHERE FirstName = '' --00:00:05 Seconds

SELECT TOP 10 * FROM Bulk_EmpDetails_Ex 
SELECT TOP 10 * FROM Bak_Bulk_EmpDetails_Ex
	

--After a Clusterd index on Bulk_EmpDetails_Ex for "FirstName" column

CREATE CLUSTERED INDEX CX_FirstName_Bulk_EmpDetails_Ex ON Bulk_EmpDetails_Ex(FirstName) --00:01:31 seconds

--After indexes(Table1 CX, Table2 No indexes)

	SELECT * FROM Bulk_EmpDetails_Ex 
	WHERE FirstName = 'dfbsdfbsdfb' --00:00:00.000 milli Seconds

	SELECT * FROM Bak_Bulk_EmpDetails_Ex
	WHERE FirstName = 'dfbsdfbsdfb' --00:00:00.250 milli Seconds

	SELECT * FROM Bak_Bulk_EmpDetails_Ex
	WHERE FirstName = '' --00:00:00.270 milli Seconds

SELECT TOP 10 * FROM Bulk_EmpDetails_Ex 
SELECT TOP 10 * FROM Bak_Bulk_EmpDetails_Ex

--After indexes(Table1 CX, Table2 a NCX)
CREATE NONCLUSTERED INDEX NCX_FirstName_Bak_Bulk_EmpDetails_Ex ON Bak_Bulk_EmpDetails_Ex(FirstName) --00:00:08 seconds

	SELECT * FROM Bulk_EmpDetails_Ex 
	WHERE FirstName = 'dfbsdfbsdfb' --00:00:00.000 milli Seconds

	SELECT * FROM Bak_Bulk_EmpDetails_Ex
	WHERE FirstName = 'dfbsdfbsdfb' --00:00:00.000 milli Seconds

	SELECT * FROM Bak_Bulk_EmpDetails_Ex
	WHERE FirstName = '' --00:00:00.270 milli Seconds

SELECT TOP 10 * FROM Bulk_EmpDetails_Ex 
SELECT TOP 10 * FROM Bak_Bulk_EmpDetails_Ex

--Drawbacks of indexes
--For bulk data insertions, indexes are definately a big braw back. When we have bulk data load req., 
--(Generally in case of ETL kind of activities) we overcome this draw back by following three stpes

	--Drop all the existing indexes
	--Do ETL/Bulk load
	--Re create the dropped indexes
