--SET Operators in SQL Server

UNION ALL
UNION
INTERSECT
EXCEPT
--Ex1

		--SET Operators in SQL Server
		UNION ALL
		UNION
		INTERSECT
		EXCEPT

		---

		SELECT * FROM 
		(
			SELECT 1 AS ID, 'ABC' AS Name UNION ALL
			SELECT 2 AS ID, 'DEF' AS Name UNION ALL
			SELECT 3 AS ID, 'XYZ' AS Name 
		)A

		UNION ALL

		SELECT * FROM 
		(
			SELECT 3 AS ID, 'XYZ' AS Name UNION ALL
			SELECT 4 AS ID, 'BCD' AS Name UNION ALL
			SELECT 5 AS ID, 'WXY' AS Name 
		)B
 
		---------
		SELECT * FROM 
		(
			SELECT 1 AS ID, 'ABC' AS Name UNION ALL
			SELECT 2 AS ID, 'DEF' AS Name UNION ALL
			SELECT 3 AS ID, 'XYZ' AS Name 
		)A

		UNION 

		SELECT * FROM 
		(
			SELECT 3 AS ID, 'XYZ' AS Name UNION ALL
			SELECT 4 AS ID, 'BCD' AS Name UNION ALL
			SELECT 5 AS ID, 'WXY' AS Name 
		)B
 
		 --------

		SELECT * FROM 
		(
			SELECT 1 AS ID, 'ABC' AS Name UNION ALL
			SELECT 2 AS ID, 'DEF' AS Name UNION ALL
			SELECT 3 AS ID, 'XYZ' AS Name 
		)A

		INTERSECT

		SELECT * FROM 
		(
			SELECT 3 AS ID, 'XYZ' AS Name UNION ALL
			SELECT 4 AS ID, 'BCD' AS Name UNION ALL
			SELECT 5 AS ID, 'WXY' AS Name 
		)B
 
		--------
		SELECT * FROM 
		(
			SELECT 1 AS ID, 'ABC' AS Name UNION ALL
			SELECT 2 AS ID, 'DEF' AS Name UNION ALL
			SELECT 3 AS ID, 'XYZ' AS Name 
		)A

		EXCEPT

		SELECT * FROM 
		(
			SELECT 3 AS ID, 'XYZ' AS Name UNION ALL
			SELECT 4 AS ID, 'BCD' AS Name UNION ALL
			SELECT 5 AS ID, 'WXY' AS Name 
		)B
 




---Ex2

SELECT * FROM 
(
	SELECT 1 AS ID, 'ABC' COLLATE Latin1_General_CS_AI AS Name UNION ALL
	SELECT 2 AS ID, 'DEF' COLLATE Latin1_General_CS_AI AS Name UNION ALL
	SELECT 3 AS ID, 'XYZ' COLLATE Latin1_General_CS_AI AS Name 
)A

UNION ALL

SELECT * FROM 
(
	SELECT 3 AS ID, 'XYZ' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 4 AS ID, 'BCD' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 5 AS ID, 'WXY' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 1 AS ID, 'aBC' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 2 AS ID, 'DeF' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 3 AS ID, 'XYz' COLLATE Latin1_General_CS_AI  AS Name 
)B
 


SELECT * FROM 
(
	SELECT 1 AS ID, 'ABC' COLLATE Latin1_General_CS_AI AS Name UNION ALL
	SELECT 2 AS ID, 'DEF' COLLATE Latin1_General_CS_AI AS Name UNION ALL
	SELECT 3 AS ID, 'XYZ' COLLATE Latin1_General_CS_AI AS Name 
)A

UNION 

SELECT * FROM 
(
	SELECT 3 AS ID, 'XYZ' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 4 AS ID, 'BCD' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 5 AS ID, 'WXY' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 1 AS ID, 'aBC' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 2 AS ID, 'DeF' COLLATE Latin1_General_CS_AI  AS Name UNION ALL
	SELECT 3 AS ID, 'XYz' COLLATE Latin1_General_CS_AI  AS Name 
)B

-----------
 SELECT * FROM EmpTab WHERE EmpFirstName = 'Mouli. K'
 SELECT * FROM EmpTab WHERE EmpFirstName = 'mouli. k'
 SELECT * FROM EmpTab WHERE EmpFirstName = 'MOULI. K'

	 ALTER TABLE EMPtab
	 ALTER COLUMN EmpFirstName VARCHAR(100) COLLATE Latin1_General_CS_AI

 SELECT * FROM EmpTab WHERE EmpFirstName = 'Mouli. K'

 SELECT * FROM EmpTab WHERE EmpFirstName = 'Mouli. k'

 SELECT * FROM EmpTab WHERE EmpFirstName = 'mouli. k'
 SELECT * FROM EmpTab WHERE EmpFirstName = 'MOULI. K'
