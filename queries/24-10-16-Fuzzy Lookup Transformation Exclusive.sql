--Incremental data load techniques in SSIS
--SSIS ETL approaches
	--


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
INTO OLTP_Practice.dbo.EmpFuzzyLookupSOURCE 
FROM AdventureWorksDW2014.dbo.DimEmployee
WHERE EndDate IS NULL


--DROP TABLE OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  

SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
SELECT * INTO OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  

--Day1
	SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
	SELECT * FROM OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 


	ALTER TABLE OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 
	ADD 
	   EffectiveDateFrom DATETIME
	  ,EffectiveDateTo DATETIME

UPDATE OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 
SET EffectiveDateFrom  = '2016-10-23 00:00:00.000'



--Day2
	DELETE FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
	WHERE EMPID%2 = 0 

--Updates
	SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  

		UPDATE OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
		SET EmailAddress = EmailAddress+'2'

	SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
	
	SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  

		UPDATE OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
		SET Phone = '0'+Phone 

	SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
--Insertions
	SELECT * FROM OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  

	INSERT INTO OLTP_Practice.dbo.EmpFuzzyLookupSOURCE  
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


UPDATE OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 
SET 
 ManagerID = ?
,LastName = ?
,DepartmentName = ?
,EmailAddress = ?
,Phone = ?
,MaritalStatus = ?
,DateOfReleaving = ?
WHERE EMPID = ?

SELECT * FROM  OLTP_Practice.dbo.EmpFuzzyLookupSOURCE 
SELECT * FROM OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 

--Day3

SELECT * FROM  OLTP_Practice.dbo.EmpFuzzyLookupSOURCE 
SELECT * FROM OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 

ALTER TABLE OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 
ALTER COLUMN FirstName NVARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS

SELECT * FROM  OLTP_Practice.dbo.EmpFuzzyLookupSOURCE 


SELECT * FROM OLAP_Practice.dbo.EmpFuzzyLookupDESTINATION 
--WHERE EMPID = 3
WHERE EffectiveDateTo IS NULL 

ORDER BY EffectiveDateFrom DESC

