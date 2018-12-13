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

	SELECT 
	* 
	FROM EmpTab E
	INNER JOIN DeptTab D
	ON E.DeptID = D.DeptID

	SELECT 
	* 
	FROM EmpTab E
	LEFT OUTER JOIN DeptTab D
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




 