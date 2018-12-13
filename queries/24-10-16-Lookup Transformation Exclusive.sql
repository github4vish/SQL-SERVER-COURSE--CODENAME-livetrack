--Incremental data load techniques in SSIS
--SSIS ETL approaches
	--Lookup Transformation(Similar to MERGE command in SQL)
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
INTO OLTP_Practice.dbo.EmpLookupSOURCE 
FROM AdventureWorksDW2014.dbo.DimEmployee
WHERE EndDate IS NULL


--DROP TABLE OLTP_Practice.dbo.EmpLookupSOURCE  

SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  
SELECT * INTO OLAP_Practice.dbo.EmpLookupDESTINATION FROM OLTP_Practice.dbo.EmpLookupSOURCE  

--Day1
	SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  
	SELECT * FROM OLAP_Practice.dbo.EmpLookupDESTINATION 

--Day2
	DELETE FROM OLTP_Practice.dbo.EmpLookupSOURCE  
	WHERE EMPID%2 = 0 

--Updates
	SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  

		UPDATE OLTP_Practice.dbo.EmpLookupSOURCE  
		SET EmailAddress = EmailAddress+'2'

	SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  
	
	SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  

		UPDATE OLTP_Practice.dbo.EmpLookupSOURCE  
		SET Phone = '0'+Phone 

	SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  
--Insertions
	SELECT * FROM OLTP_Practice.dbo.EmpLookupSOURCE  

	INSERT INTO OLTP_Practice.dbo.EmpLookupSOURCE  
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


UPDATE OLAP_Practice.dbo.EmpLookupDESTINATION 
SET 
 ManagerID = ?
,LastName = ?
,DepartmentName = ?
,EmailAddress = ?
,Phone = ?
,MaritalStatus = ?
,DateOfReleaving = ?
WHERE EMPID = ?

SELECT * FROM  OLTP_Practice.dbo.EmpLookupSOURCE 
SELECT * FROM OLAP_Practice.dbo.EmpLookupDESTINATION 

--Day3

SELECT * FROM  OLTP_Practice.dbo.EmpLookupSOURCE 
SELECT * FROM OLAP_Practice.dbo.EmpLookupDESTINATION 
