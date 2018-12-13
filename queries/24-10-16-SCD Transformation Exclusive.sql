--Incremental data load techniques in SSIS
--SSIS ETL approaches
	--SCD Transformation
	--Fuzzy Lookup Transformation

SELECT 
TOP 10
 CAST(EmployeeKey AS INT)  AS EMPID
,ParentEmployeeKey AS ManagerID
,LastName
,FirstName
,MiddleName
,DepartmentName
,Gender
,HireDate DateOfJoin
,BirthDate
,EmailAddress
,Phone
,MaritalStatus
,EndDate DateOfReleaving
INTO OLTP_Practice.dbo.EmpSCDSOURCE 
FROM AdventureWorksDW2014.dbo.DimEmployee
WHERE EndDate IS NULL


--DROP TABLE OLTP_Practice.dbo.EmpSCDSOURCE  

SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  
SELECT * INTO OLAP_Practice.dbo.EmpSCDDESTINATION FROM OLTP_Practice.dbo.EmpSCDSOURCE  

--Day1
	SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  
	SELECT * FROM OLAP_Practice.dbo.EmpSCDDESTINATION 


	ALTER TABLE OLAP_Practice.dbo.EmpSCDDESTINATION 
	ADD 
	   EffectiveDateFrom DATETIME
	  ,EffectiveDateTo DATETIME

UPDATE OLAP_Practice.dbo.EmpSCDDESTINATION 
SET EffectiveDateFrom  = '2016-10-23 00:00:00.000'



--Day2
	DELETE FROM OLTP_Practice.dbo.EmpSCDSOURCE  
	WHERE EMPID%2 = 0 

--Updates
	SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  

		UPDATE OLTP_Practice.dbo.EmpSCDSOURCE  
		SET EmailAddress = EmailAddress+'2'

	SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  
	
	SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  

		UPDATE OLTP_Practice.dbo.EmpSCDSOURCE  
		SET Phone = '0'+Phone 

	SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  
--Insertions
	SELECT * FROM OLTP_Practice.dbo.EmpSCDSOURCE  

	INSERT INTO OLTP_Practice.dbo.EmpSCDSOURCE  
	SELECT 
	TOP 5
		CAST(EmployeeKey AS INT)  AS EMPID
	,ParentEmployeeKey AS ManagerID
	,LastName
	,FirstName
	,MiddleName
	,DepartmentName
	,Gender
	,HireDate DateOfJoin
	,BirthDate
	,EmailAddress
	,Phone
	,MaritalStatus
	,EndDate DateOfReleaving
	FROM AdventureWorksDW2014.dbo.DimEmployee
	WHERE EmployeeKey >12


UPDATE OLAP_Practice.dbo.EmpSCDDESTINATION 
SET 
 ManagerID = ?
,LastName = ?
,DepartmentName = ?
,EmailAddress = ?
,Phone = ?
,MaritalStatus = ?
,DateOfReleaving = ?
WHERE EMPID = ?

SELECT * FROM  OLTP_Practice.dbo.EmpSCDSOURCE 
SELECT * FROM OLAP_Practice.dbo.EmpSCDDESTINATION 

--Day3

SELECT * FROM  OLTP_Practice.dbo.EmpSCDSOURCE 
SELECT * FROM OLAP_Practice.dbo.EmpSCDDESTINATION 



SELECT * FROM  OLTP_Practice.dbo.EmpSCDSOURCE 


SELECT * FROM OLAP_Practice.dbo.EmpSCDDESTINATION 
--WHERE EMPID = 3
WHERE EffectiveDateTo IS NULL 

ORDER BY EffectiveDateFrom DESC
