--JOINs in SQL Server 
--Def: Joins is an opposite process of normaliztion, which helps us to denormalize and combine the 
--splitted entities.
--The pre-requisite to join two tables is, 
--At  least ONE common column should exist B/W the two tables, with similar data type. Column title 
--need not to be same; but their data types should be same.

--We can join two or more tables. The very first table representing in the join query is known 
--as LEFT table, and next table is known as RIGHT table. 

--SELECT * FROM [dbo].[EmpDetails]

--SELECT * FROM DeptDetails 

CREATE TABLE EmpTab							
(
 EmpID	 INT
,EmpFirstName	VARCHAR(100) 
,EmpLastName	VARCHAR(100)	
,ManagerID	INT
,DOB	DATETIME
,DeptID	INT
,Mobile		BIGINT
,Email 	VARCHAR(100)
)

INSERT INTO EmpTab
SELECT '1','Manoj Kumar Reddy T','B','8','1990-01-02','10','9845023456','manojreddy.thallapalli@gmail.com' UNION ALL 
SELECT '2','Mouli. K','C','5','1990-01-03','12','9845034567','kmouli99@gmail.com' UNION ALL 
SELECT '3','John Babu G','A','5','1990-01-04','14','9845045678','johnganta88@gmail.com' UNION ALL 
SELECT '4','Gangaraju D','B','8','1990-01-05','11','9845056789','gangarajud906@gmail.com' UNION ALL 
SELECT '5','Trinadh Babu B','C','7','1990-01-06','103','9845067900','b.trinadh258@gmail.com' UNION ALL 
SELECT '6','Renuka G','A','7','1990-01-07','15','9845079011','renukamcasvec@gmail.com' UNION ALL 
SELECT '7','Sarada M','B',NULL,'1990-01-08','12','9845090122','Sarada.nit005@gmail.com' UNION ALL 
SELECT '8','Saikeerthi','C','5','1990-01-09','14','9845101233','sai.keerthi32@gmail.com' UNION ALL 
SELECT '9','B suman','A','7','1990-01-10','11','9845112344','bsuman993@outlook.com' UNION ALL 
SELECT '10','NARAYANA REDDY M','B','7','1990-01-11',NULL,'9845123455','mnarayanardy@gmail. com' UNION ALL 
SELECT '11','Penchalareddy M','C','8','1990-01-12','11','9845134566','penchal483.up@gmail.com' UNION ALL 
SELECT '12','Viswanath M','A','7','1990-01-13','107','9845145677','viswanath549@gmail.com' UNION ALL 
SELECT '13','Manoj Kumar Reddy T2','B2','8','1990-01-02','14','9845023456','manojreddy.thallapalli@gmail.com' UNION ALL 
SELECT '14','Manoj Kumar Reddy T3','B3','7','1990-01-02','14','9845023456','manojreddy.thallapalli@gmail.com' 

CREATE TABLE DeptTab		
(
 DeptID	INT
,DeptName VARCHAR(100)	
,DeptDesc VARCHAR(100)	
)

INSERT INTO DeptTab
SELECT '10','IT Dept','IT Dept' UNION ALL 
SELECT '11','HR Dept','HR Dept' UNION ALL 
SELECT '12','Transport Dept','Transport Dept' UNION ALL 
SELECT '13','Payroll Dept','Payroll Dept' UNION ALL 
SELECT '14','Admin Dept','Admin Dept' UNION ALL 
SELECT '15','Facilities Dept','Facilities Dept' UNION ALL 
SELECT '100','Admin Dept2','Admin Dept' UNION ALL 
SELECT '101','Facilities Dept2','Facilities Dept' UNION ALL 
SELECT NULL,'NA','NA'

SELECT * FROM EmpTab
SELECT * FROM DeptTab

--Equi Joins
--Syntax

SELECT
 L.Column1
,L.Column2
,
:
:
,R.Column1
,R.Column2
:
:
FROM LeftTable L,RightTable R
WHERE L.CommonColumn1 = R.CommonColumn1 
AND L.CommonColumn2 = R.CommonColumn2
AND .......

--Joining above tables with equi joins 


--Req: Bring all the VALID RECORDS by joining the above two tables
	SELECT 
	* 
	FROM Emptab E,DeptTab D
	WHERE E.DeptID = D.DeptID

--SELECT 
--* 
--FROM Emptab E,DeptTab D
--WHERE E.DeptID > D.DeptID

 --Non Equi joins
 --INNER 
 --OUTER
	--LEFT OUTER
	--RIGHT OUTER
	--FULL OUTER
 --CROSS
--Syntax
	SELECT
	 L.Column1
	,L.Column2
	,
	:
	:
	,R.Column1
	,R.Column2
	:
	:
	FROM LeftTable L
	INNER/LEFT OUTER/RIGHT OUTER/CROSS JOIN
	RightTable R
	ON L.CommonColumn1 = R.CommonColumn1 
	AND L.CommonColumn2 = R.CommonColumn2
	AND .......

--DO an inner join B/W the above two tables

	--SELECT 
	--* 
	--FROM Emptab E,DeptTab D
	--WHERE E.DeptID = D.DeptID

----------------E1

		SELECT 
		* 
		FROM EmpTab E
		INNER JOIN DeptTab D
		ON E.DeptID = D.DeptID

		SELECT 
		 D.* 
		,E.*
		FROM  DeptTab E
		RIGHT OUTER JOIN EmpTab D
		ON E.DeptID = D.DeptID
		WHERE D.DeptID IS NULL


		SELECT 
		* 
		FROM EmpTab E
		RIGHT OUTER JOIN DeptTab D
		ON E.DeptID = D.DeptID
		WHERE E.DeptID IS NULL

		SELECT 
		* 
		FROM EmpTab E
		FULL OUTER JOIN DeptTab D
		ON E.DeptID = D.DeptID
		WHERE E.DeptID IS NULL
		OR D.DeptID IS NULL

		SELECT 
		* 
		FROM EmpTab E
		CROSS JOIN DeptTab D
	
		SELECT 
		* 
		FROM EmpTab E
		INNER JOIN DeptTab D
		ON 1 = 1




--Notes
--1)LEFT TABLE(s) are always recognized after FROM clause. The right most table 
--after the JOIN specification is known as RIGHT TABLE. 

--2)In case of LOJ,Left table will be stamped as is whereas Right table may have
--some data loss. In another words, LOJ will bring Matched+Unmattched records of
--LEF TTABLE, and ONLY MATCHED records from RIGHT TABLE.

--3)In case of ROJ,Right table will be stamped as is whereas LEFT TABLE may have
--some data loss. In another words, ROJ will bring Matched+Unmattched records of
--RIGHT TABLE, and ONLY MATCHED records from LEFT TABLE.

--4) FOJ will bring the records from both LEFT & RIGHT tables, there will not 
--be any data loss from both the tables

 ---An instant excercise on joins 

----------------E2

	SELECT * FROM 
	(
		SELECT 1 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 5 AS C1 
	)A
	INNER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1

	---------------
	SELECT * FROM 
	(
		SELECT 1 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 5 AS C1 
	)A
	LEFT OUTER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1
	---------------
	SELECT * FROM 
	(
		SELECT 1 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 5 AS C1 
	)A
	RIGHT OUTER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1

	---------------
	SELECT * FROM 
	(
		SELECT 1 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 5 AS C1 
	)A
	FULL OUTER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1

----------------E3
	SELECT * FROM 
	(
		SELECT 10 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 50 AS C1 
	)A
	INNER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 40 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 20 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1

	---------------
	SELECT * FROM 
	(
		SELECT 10 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 50 AS C1 
	)A
	LEFT OUTER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 40 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 20 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1
	---------------
	SELECT * FROM 
	(
		SELECT 10 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 50 AS C1 
	)A
	RIGHT OUTER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 40 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 20 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1

	---------------
	SELECT * FROM 
	(
		SELECT 10 AS C1 UNION ALL
		SELECT 2 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 4 AS C1 UNION ALL
		SELECT 50 AS C1 
	)A
	FULL OUTER JOIN 
	(
		SELECT 5 AS C1 UNION ALL
		SELECT 40 AS C1 UNION ALL
		SELECT 3 AS C1 UNION ALL
		SELECT 20 AS C1 UNION ALL
		SELECT 1 AS C1 
	)B
	ON A.C1 = B.C1

--Ex4
--Bring the list employees, and their dept names from EmpTab & DeptTab table
--Expected fields EmpFUllName,EmpID,DeptID,DeptName

	SELECT 
	 E.EmpFirstName+' '+E.EmpLastName AS EmpFullName
	,E.EmpID
	,ISNULL(D.DeptID,'-1') AS DeptID
	,ISNULL(D.DeptName,'N/A') AS DeptName
	FROM EmpTab E
	LEFT OUTER JOIN DeptTab D
	ON E.DeptID = D.DeptID
--Ex5
--Bring the list Dept details , and count of employees under each dept
--Expected fields DeptID,DeptName,CountEmp


	SELECT 
	 D.DeptID
	,D.DeptName
	,ISNULL(E.CountEmp,'0') AS CountEmp
	FROM DeptTab D
	LEFT OUTER JOIN
	(
		SELECT E.DeptID,COUNT(*) AS CountEmp FROM EmpTab E GROUP BY E.DeptID
	)E
	ON D.DeptID = E.DeptID
------Concept of Self join
--Ex6: Bring the list of emp & and their respective manager details
--Expected fields
--EmpID,EmpFullName,ManagerID,ManagerFullName,EmpDeptId,EmpDeptName,ManagerDeptId,ManagerDeptName


Select * into EmpDetails from EmpTab

Select * into DeptDetails from DeptTab


SELECT 
 E1.EmpID 
,E1.EmpFirstName +' '+E1.EmpLastName AS EmpFullName
,ISNULL(D1.DeptID,'-1') AS EmpDeptId
,ISNULL(D1.DeptName,'N/A') AS EmpDeptName

,ISNULL(E2.EmpID,'-1') AS ManagerID
,ISNULL(E2.EmpFirstName +' '+ E2.EmpLastName,'N/A') AS ManagerFullName
,ISNULL(D2.DeptID,'-1') AS ManagerDeptId
,ISNULL(D2.DeptName,'N/A') AS ManagerDeptName

FROM EmpDetails E1
LEFT OUTER JOIN EmpDetails E2
ON E1.ManagerID = E2.EmpID
LEFT OUTER JOIN DeptDetails D1
ON E1.DeptID = D1.DeptID
LEFT OUTER JOIN DeptDetails D2
ON E2.DeptID = D2.DeptID


SELECT 
 E1.EmpID 
,E1.EmpFirstName +' '+E1.EmpLastName AS EmpFullName
,ISNULL(D1.DeptID,'-1') AS EmpDeptId
,ISNULL(D1.DeptName,'N/A') AS EmpDeptName

,ISNULL(E2.EmpID,'-1') AS ManagerID
,ISNULL(E2.EmpFirstName +' '+ E2.EmpLastName,'N/A') AS ManagerFullName
,ISNULL(D2.DeptID,'-1') AS ManagerDeptId
,ISNULL(D2.DeptName,'N/A') AS ManagerDeptName

FROM EmpDetails E1
INNER JOIN EmpDetails E2
ON E1.ManagerID = E2.EmpID
INNER JOIN DeptDetails D1
ON E1.DeptID = D1.DeptID
INNER JOIN DeptDetails D2
ON E2.DeptID = D2.DeptID



------------
--SELECT 
--*
--FROM DeptDetails D1
--LEFT OUTER JOIN EmpDetails E1
--ON E1.DeptID = D1.DeptID
--LEFT OUTER JOIN EmpDetails E2
--ON E1.ManagerID = E2.EmpID

------------
SELECT 
*
FROM EmpDetails E2
RIGHT OUTER JOIN EmpDetails E1
ON E1.ManagerID = E2.EmpID
LEFT OUTER JOIN DeptDetails D1
ON E1.DeptID = D1.DeptID

------------

SELECT * FROM 
(
	SELECT 
	 E.EmpFirstName +' '+E.EmpLastName AS EmpFullName
	,ISNULL(M1.EmpFirstName +' '+ M1.EmpLastName,'N/A') AS LevelOneManagerFullName
	,ISNULL(M2.EmpFirstName +' '+ M2.EmpLastName,'N/A') AS LevelTwoManagerFullName
	,ISNULL(M3.EmpFirstName +' '+ M3.EmpLastName,'N/A') AS LevelThreeManagerFullName
	,ISNULL(M4.EmpFirstName +' '+ M4.EmpLastName,'N/A') AS LevelFourManagerFullName
	FROM EmpDetails E
	LEFT OUTER JOIN EmpDetails M1
	ON E.ManagerID = M1.EmpID
	LEFT OUTER JOIN EmpDetails M2
	ON M1.ManagerID = M2.EmpID
	LEFT OUTER JOIN EmpDetails M3
	ON M2.ManagerID = M3.EmpID
	LEFT OUTER JOIN EmpDetails M4
	ON M3.ManagerID = M4.EmpID
)A
WHERE A.LevelFourManagerFullName = 'N/A'

SELECT 
 E.EmpFirstName +' '+E.EmpLastName AS EmpFullName
,ISNULL(M1.EmpFirstName +' '+ M1.EmpLastName,'N/A') AS LevelOneManagerFullName
,ISNULL(M2.EmpFirstName +' '+ M2.EmpLastName,'N/A') AS LevelTwoManagerFullName
,ISNULL(M3.EmpFirstName +' '+ M3.EmpLastName,'N/A') AS LevelThreeManagerFullName
FROM EmpDetails E
INNER JOIN EmpDetails M1
ON E.ManagerID = M1.EmpID
INNER JOIN EmpDetails M2
ON M1.ManagerID = M2.EmpID
INNER JOIN EmpDetails M3
ON M2.ManagerID = M3.EmpID

