--Incremental data load techniques in SQL
	--Pure SQL Server approaches
	--SSIS ETL approaches

--Day 1 data load 
	INSERT OLAP_Practice.dbo.LocationDim
	(
		 Country
		,[State]
		,City
		,District
		,PostalCode
		,LoadedDate
		,UpdatedDate
		,UpdatedBy
	)
	SELECT 
	DISTINCT 
	 Country
	,NULL AS [State]
	,City
	,NULL AS District
	,PostalCode
	,GETDATE()
	,NULL AS  UpdatedDate
	,NULL AS UpdatedBy
	FROM OLTP_Practice.dbo.Customer
	WHERE EffectiveDate BETWEEN '2016-10-19 00:00:00.000' AND '2016-10-19 23:59:59.997'

--Day 2 data load 

	--INSERT OLAP_Practice.dbo.LocationDim
	--(
	--	 Country
	--	,[State]
	--	,City
	--	,District
	--	,PostalCode
	--	,LoadedDate
	--	,UpdatedDate
	--	,UpdatedBy
	--)
	--SELECT 
	--DISTINCT 
	-- Country
	--,NULL AS [State]
	--,City
	--,NULL AS District
	--,PostalCode
	--,GETDATE()
	--,NULL AS  UpdatedDate
	--,NULL AS UpdatedBy
	--FROM OLTP_Practice.dbo.Customer
	--WHERE EffectiveDate BETWEEN '2016-10-20 00:00:00.000' AND '2016-10-20 23:59:59.997'
--Making changes to OLTP Customer Entity

	UPDATE OLTP_Practice.dbo.Customer
	SET 
	 PostalCode = 5024
	,EffectiveDate = '2016-10-20 08:30:00.000'
	WHERE CustomerID IN (5)

	UPDATE OLTP_Practice.dbo.Customer
	SET 
	 PostalCode = 5025
	,Country = 'UK'
	,EffectiveDate = '2016-10-20 08:30:00.000'
	WHERE CustomerID IN (72,73)

INSERT INTO OLTP_Practice.dbo.Customer
(
     CustomerID
	,CustomerName
	,ContactName
	,[Address]
	,City
	,PostalCode
	,Country
	,EffectiveDate
)
SELECT 111,'Brahma','brahma365msbi@gmail.com','Hyderabad','Hyderabad','560034','India','10/20/2016 8:36' UNION ALL 
SELECT 222,'Manoj Kumar Reddy T','manojreddy.thallapalli@gmail.com','Bangalore','Bangalore','560034','India','10/20/2016 8:36' UNION ALL 
SELECT 333,'Mouli. K','kmouli99@gmail.com','Bangalore','Bangalore','560035','India','10/20/2016 8:36' UNION ALL 
SELECT 444,'John Babu G','johnganta88@gmail.com','Bangalore','Bangalore','560030','India','10/20/2016 8:36' UNION ALL 
SELECT 555,'Gangaraju D','gangarajud906@gmail.com','Hyderabad','Hyderabad','560030','India','10/20/2016 8:30' 

--Loading the Data from OLTP to OLAP incrementally by Day-2

	MERGE 
	INTO OLAP_Practice.dbo.LocationDim D
	USING 
	(
	 SELECT DISTINCT 
		Country
	   ,City
	   ,PostalCode
	  FROM OLTP_Practice.dbo.Customer
	  WHERE EffectiveDate BETWEEN '2016-10-20 00:00:00.000' AND '2016-10-20 23:59:59.997'
	)  S
	ON  S.Country = D.Country
	AND S.City = D.City
	WHEN  MATCHED THEN
	UPDATE 
	SET  
	 D.PostalCode = S.PostalCode 
	,D.UpdatedDate = GETDATE()
	,D.UpdatedBy = 'Pure SQL Aproach'
	WHEN NOT MATCHED THEN 
	INSERT
	(
	 Country
	,[State]
	,City
	,District
	,PostalCode
	,LoadedDate
	,UpdatedDate
	,UpdatedBy
	)
	VALUES
	( 
		 S.Country
		,NULL 
		,S.City
		,NULL 
		,S.PostalCode
		,GETDATE()
		,NULL 
		,NULL 
	)
	;



ALTER TABLE OLAP_Practice.dbo.LocationDim
ALTER COLUMN PostalCode VARCHAR(100)



SELECT * FROM OLTP_Practice.dbo.Customer
WHERE EffectiveDate BETWEEN '2016-10-20 00:00:00.000' AND '2016-10-20 23:59:59.997'

SELECT * FROM OLAP_Practice.dbo.LocationDim
WHERE Country = N'Sweden'
AND City =  N'Luleå'

--------------------
	UPDATE OLTP_Practice.dbo.Customer
	SET PostalCode = 560034
	WHERE City = 'bangalore' 

	UPDATE OLTP_Practice.dbo.Customer
	SET PostalCode = 500001
	WHERE CustomerID = 111

	UPDATE OLTP_Practice.dbo.Customer
	SET PostalCode = 500005
	WHERE CustomerID = 555

	-------------
	UPDATE OLTP_Practice.dbo.Customer
	SET PostalCode =
	(
		CASE 
			WHEN  CustomerID = 111 THEN 500001
			WHEN  CustomerID = 555 THEN 500005
			ELSE PostalCode 
		END
	)
	WHERE CustomerID IN(111,555)





SELECT * FROM OLTP_Practice.dbo.Customer
WHERE CustomerID IN (72,73)

--
















SELECT * FROM OLAP_Practice.dbo.LocationDim

OLAP_Practice.dbo.SP_HELP LocationDim


SELECT * FROM OLTP_Practice.dbo.Customer
SELECT * FROM OLAP_Practice.dbo.CustomerDim

SELECT * FROM OLTP_Practice.dbo.Products

--Normal joins to make incremental data load

USE SQL_Practice

GO 

CREATE TABLE ETLSource
(
	 ID INT
	,Name VARCHAR(100)
	,FullDesc VARCHAR(100) 
)

CREATE TABLE ETLDest
(
	 ID INT
	,Name VARCHAR(100)
	,FullDesc VARCHAR(100) 
)


--Day1
	INSERT INTO ETLSource
	SELECT 1,'AAA','aaa' UNION ALL
	SELECT 2,'BBB','bbb' UNION ALL
	SELECT 3,'CCC','ccc' UNION ALL
	SELECT 4,'DDD','ddd' UNION ALL
	SELECT 5,'EEE','eee'

	INSERT INTO ETLDest
	SELECT 1,'AAA','aaa' UNION ALL
	SELECT 2,'BBB','bbb' UNION ALL
	SELECT 3,'CCC','ccc' UNION ALL
	SELECT 4,'DDD','ddd' UNION ALL
	SELECT 5,'EEE','eee'


	SELECT * FROM ETLSource

	SELECT * FROM ETLDest
--Day2
   
   DELETE FROM ETLSource WHERE ID IN(1,3,5)

   UPDATE ETLSource 
   SET FullDesc = 'bbbbbbb'
   WHERE ID = 2

   UPDATE ETLSource 
   SET FullDesc = 'g777777'
   WHERE ID = 7

   UPDATE ETLSource 
   SET FullDesc = 'd444444'
   WHERE ID = 4


	INSERT INTO ETLSource
	SELECT 6,'FFF','fff' UNION ALL
	SELECT 7,'GGG','ggg' 

	SELECT * FROM ETLSource
	SELECT * FROM ETLDest

   INSERT INTO ETLSource
	SELECT 8,'HHH','hhh' UNION ALL
	SELECT 9,'III','iii' 


--Updates

	SELECT 
	* 
	FROM ETLSource S
	INNER JOIN ETLDest D
	ON S.ID = D.ID

	UPDATE  D
	SET 
	D.FullDesc = S.FullDesc
	FROM ETLSource S
	INNER JOIN ETLDest D
	ON S.ID = D.ID

--Inserts
	
	INSERT INTO ETLDest

	SELECT 
	S.* 
	FROM ETLSource S
	LEFT OUTER JOIN ETLDest D
	ON S.ID = D.ID
	WHERE D.ID IS NULL

--Day3
   
   DELETE FROM ETLSource WHERE ID IN(6,2)

   UPDATE ETLSource 
   SET FullDesc = 'bbbbbbb'
   WHERE ID = 2

   UPDATE ETLSource 
   SET FullDesc = 'ddddddd'
   WHERE ID = 4



	INSERT INTO ETLSource
	SELECT 6,'FFF','fff' UNION ALL
	SELECT 7,'GGG','ggg' 

	SELECT * FROM ETLSource
	SELECT * FROM ETLDest

--Delete rows from the destination table 
	
	DELETE FROM ETLDest
	WHERE ID IN
	(SELECT ID FROM ETLSource)--8,9,7,4

--Inserts

	INSERT INTO ETLDest
	SELECT * FROM ETLSource

-----
