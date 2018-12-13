--User defined functions in SQL Server
--Def: A *function is set of T-SQL ststements which is capable of perfroming ONLY DQL(SELECT) inside in it.
--Function can accpets zero or more number of arguments. 

--A function must and should return a value.

--Based on the return value type, we do have the following types of functions exists.

--a)Sclalar valued retutn functions(Scalar data types: INT,FLOAT,DECIMAL,NUMERIC,MONEY,SMALLMONEY,DATETIME,TIME,DATETIME2,Strings)
	--(Non scalar Datatypes: IMAGE,BINARY,VARBINARY,TEXT,NTEXT,XML.......)
--b)Table valued return functions
	--i)Inline Table valued return functions(ILTVF)
	--ii)Multi Statement Table valued return functions(MSTVF)

--a)Sclalar valued retutn functions
--Syntax(Create): 
	CREATE FUNCTION <SchemaName>.<FunctionName>
	(
		List of argumets with their datatypes (Commaseperated)
	)
	RETURNS <ReturningDataType[<Size>]>
	AS
	BEGIN
		Functioning T-SQL statement(s)
		:
		:
		:
		:
		RETURN (<ReturningValue>)
	END
--Syntax(Access/Call)

	SELECT <SchemaName>.<FunctionName>(Argumnets commaseperates)

--Ex1: Write a scalar function to perfrom addition of two supplied input arguments
CREATE FUNCTION dbo.AddFunction
(
	 @A INT
	,@B INT
)
RETURNS INT
AS
BEGIN
	DECLARE @C INT
	SET @C  = @A+@B

	RETURN(@C)
END

SELECT dbo.AddFunction(10,20),dbo.AddFunction(20,40),dbo.AddFunction(20,40)

SELECT * FROM StdDetails
WHERE StdName = 'Chaitanya M'

DECLARE 
 @Sub1 INT
,@Sub2 INT
,@Sub3 INT
,@Total1 INT
,@GrandTotal INT


SET @Sub1 = (SELECT Marks FROM StdDetails WHERE StdName = 'Chaitanya M' AND Sub = 'Eng' )
SET @Sub2 = (SELECT Marks FROM StdDetails WHERE StdName = 'Chaitanya M' AND Sub = 'Phy' )
SET @Sub3 = (SELECT Marks FROM StdDetails WHERE StdName = 'Chaitanya M' AND Sub = 'Maths' )

SET @Total1 = dbo.AddFunction(@Sub1,@Sub2) 
SET @GrandTotal = dbo.AddFunction(@Total1,@Sub3) 

SELECT @GrandTotal 


SELECT * FROM EmpDetails_WithConstraints

--Basic + Allowances = Take home salary

SELECT 
*
,dbo.AddFunction([Basic],Allowances) AS TakehomeSalary
FROM 
(
	SELECT 1 AS EMPID , 'Narayan' AS EmpName ,18500.00 AS [Basic], 17568.12 AS Allowances UNION ALL
	SELECT 2 AS EMPID , 'Renuka'  ,19500.00 AS [Basic], 16568.12 AS Allowances UNION ALL
	SELECT 3 AS EMPID , 'Sarada'  ,20500.00 AS [Basic], 18568.12  UNION ALL
	SELECT 4 AS EMPID , 'Thrinath' AS EmpName ,17500.00 AS [Basic], 19568.12 
)Emp

SELECT 
*
,NULL AS TakeHomeSlary
INTO EMPSalary
FROM 
(
	SELECT 1 AS EMPID , 'Narayan' AS EmpName ,18500.00 AS [Basic], 17568.12 AS Allowances UNION ALL
	SELECT 2 AS EMPID , 'Renuka'  ,19500.00 AS [Basic], 16568.12 AS Allowances UNION ALL
	SELECT 3 AS EMPID , 'Sarada'  ,20500.00 AS [Basic], 18568.12  UNION ALL
	SELECT 4 AS EMPID , 'Thrinath' AS EmpName ,17500.00 AS [Basic], 19568.12 
)Emp

SELECT * FROM EMPSalary

	UPDATE EMPSalary
	SET TakeHomeSlary = dbo.AddFunction([Basic],Allowances)


	--SELECT * FROM EMPSalary

	--SELECT *  into  EmpDetails from EmpTab

	
	ALTER TABLE EmpDetails
	ADD Salary MONEY


	SELECT * FROM EmpDetails

	UPDATE EmpDetails
	SET Salary = 45000*(DeptID/10.00)

	--UPDATE EmpDetails
	SET Salary = 65000 WHERE Salary IS NULL
--Ex2, write a calc function which accepts three argumnts , namely: Arg1,Arg2,Operator
--and gives us the result
10,20,'+'
10,20,'-'
10,20,'/'

CREATE FUNCTION dbo.CalcFunction
(
	 @A FLOAT
	,@B FLOAT
	,@Operator CHAR(1)
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @C FLOAT

	SET @C = 
	(
		CASE 
			WHEN @Operator = '+' THEN @A+@B
			WHEN @Operator = '-' THEN @A-@B
			WHEN @Operator = '/' THEN @A/@B
			WHEN @Operator = '*' THEN @A*@B
			ELSE 0
		END
	)

	RETURN(@C)
END

SELECT dbo.CalcFunction(10,20,'+'),dbo.CalcFunction(10,20,'/'),dbo.CalcFunction(10,20,'-'),dbo.CalcFunction(10,20,'*')



select * into  EmpDetails from EmpDetails_WithConstraints
select * from EmpDetails
--Ex3: Write a sclar function to get the salary hike of an employee record. Give the salary hike 
--based on the below slabs
If the existing salary is 
B/W 0 AND 45000 THEN 20% hike
B/W 45001 AND 50000 THEN 15% hike
B/W 50000 AND Above THEN 5% hike

CREATE FUNCTION dbo.SalaryHike
(
	@EMPID INT
) 
RETURNS MONEY
AS
BEGIN
	DECLARE @OldSlary MONEY, @HikedSlary MONEY
	SET @OldSlary = 
	(
		SELECT Salary FROM EmpDetails WHERE EmpID = @EMPID
	)
	
	SET @HikedSlary = 
	(
		CASE 
			WHEN @OldSlary BETWEEN 0 AND 40000 THEN @OldSlary*1.20 
			WHEN @OldSlary BETWEEN 40001 AND 50000 THEN @OldSlary*1.15
			WHEN @OldSlary >= 50001 THEN @OldSlary*1.05
			ELSE @OldSlary 
		END
	)

	RETURN(@HikedSlary)
END


SELECT dbo.SalaryHike(1)

SELECT *,dbo.SalaryHike(EmpID) FROM EmpDetails
--Apply the hikes using the above function

SELECT * FROM EmpDetails

	UPDATE EmpDetails
	SET Salary = dbo.SalaryHike(EmpID)

SELECT * FROM EmpDetails

SP_HELPTEXT SalaryHike
---Encrypting the functions not to see the code inside the function

ALTER FUNCTION dbo.SalaryHike
(
	@EMPID INT
) 
RETURNS MONEY
--WITH ENCRYPTION
AS
BEGIN
	DECLARE @OldSlary MONEY, @HikedSlary MONEY
	SET @OldSlary = 
	(
		SELECT Salary FROM EmpDetails WHERE EmpID = @EMPID
	)
	
	SET @HikedSlary = 
	(
		CASE 
			WHEN @OldSlary BETWEEN 0 AND 40000 THEN @OldSlary*1.20 
			WHEN @OldSlary BETWEEN 40001 AND 50000 THEN @OldSlary*1.15
			WHEN @OldSlary >= 50001 THEN @OldSlary*1.05
			ELSE @OldSlary 
		END
	)

	RETURN(@HikedSlary)
END

SP_HELPTEXT SalaryHike

--Introduction Table type variables(Begins here)
--General syntax

	DECLARE @<TableVarName> 
	TABLE	
	(
		Table Structure	
	)

	INSERT INTO @<TableVarName>

	SELECT * FROM @<TableVarName>

--Example1

	DECLARE @Emp TABLE
	(
	 EMPID INT
	,EmpName VARCHAR(100)
	,[Basic] MONEY
	,Allowances MONEY
	,TakeHomeSlary MONEY
	)

	SELECT * FROM @Emp

	INSERT INTO @Emp
	SELECT * FROM EMPSalary 

	SELECT * FROM @Emp
		DELETE FROM @Emp
		WHERE EMPID= 3
	
	SELECT * FROM @Emp E1 
	INNER JOIN EMPSalary E2 
	ON E1.EMPID = E2.EMPID
--Introduction Table type variables(Ends here)

--b)Table valued return functions
	--i)Inline Table valued return functions(ILTVF)
--General syntax

CREATE FUNCTION <SchemaName>.<FunctionName>
(
	List of arguments with their data types(Comma seperated)
)
RETURNS TABLE
AS
RETURN(Return_Sub_Query)

--Ex1:Get all the emp details for a supplied DeptID
--Expected fields.
EmpID,EmpName,MgrID,MgrName,DeptID,DeptName


CREATE FUNCTION dbo.GetEmpDtails_DeptWise
(
	@DeptID INT
)
RETURNS TABLE
--WITH ENCRYPTION
RETURN
(
	SELECT 
	 E.EmpID
	,E.EmpFirstName+' '+E.EmpLastName AS EmpName
	,M.EmpID AS ManagerID
	,M.EmpFirstName+' '+M.EmpLastName  ManagerName
	,D.DeptID
	,D.DeptName
	--,E.Salary AS EmpSalary
	--,dbo.SalaryHike(E.EmpID) EmpHikedSalary
	--,M.Salary AS ManagerSalary
	--,dbo.SalaryHike(M.EmpID) ManagerHikedSalary
	FROM EmpTab  E
	LEFT OUTER JOIN EmpTab M
	ON E.ManagerID = M.EmpID
	LEFT OUTER JOIN DeptTab D
	ON D.DeptID = E.DeptID
	WHERE D.DeptID = @DeptID
)

SELECT * FROM dbo.GetEmpDtails_DeptWise(11)

SELECT * FROM dbo.GetEmpDtails_DeptWise(12)

--b)Table valued return functions
	--ii)Multi Statement Table valued return functions(MSTVF)
--Syntax
CREATE FUNCTION <SchemaName>.<FunctionName>
(
	List of arguments with their data types(Comma seperated)
)
RETURNS @<TabVarName> TABLE
(
	Table Structure here
)
AS
BEGIN
	MSTVF Functioning statemenbts to populate @<TabVarName>

	RETURN 
END

--Rewriting Ex1 of ILTVF with MSTVF

CREATE FUNCTION dbo.GetEmpDtails_DeptWise2
(
	@DeptID INT
)
RETURNS @Tab TABLE
(
 EmpID	INT
,EmpName  VARCHAR(100)	
,ManagerID	INT
,ManagerName	VARCHAR(100)	
,DeptID	INT
,DeptName VARCHAR(100)	
)
AS 
BEGIN
	INSERT INTO @Tab
	SELECT 
	 E.EmpID
	,E.EmpFirstName+' '+E.EmpLastName AS EmpName
	,M.EmpID AS ManagerID
	,M.EmpFirstName+' '+M.EmpLastName  ManagerName
	,D.DeptID
	,D.DeptName
	FROM EmpTab  E
	LEFT OUTER JOIN EmpTab M
	ON E.ManagerID = M.EmpID
	LEFT OUTER JOIN DeptTab D
	ON D.DeptID = E.DeptID
	
	WHERE D.DeptID = @DeptID
	
	RETURN
END


SELECT * FROM dbo.GetEmpDtails_DeptWise(12)
SELECT * FROM dbo.GetEmpDtails_DeptWise2(12)
--
SELECT * FROM dbo.GetEmpDtails_DeptWise(11)
SELECT * FROM dbo.GetEmpDtails_DeptWise(12)

SELECT * FROM dbo.GetEmpDtails_DeptWise2(11)
SELECT * FROM dbo.GetEmpDtails_DeptWise2(12)

DELETE  FROM dbo.GetEmpDtails_DeptWise(11)

DELETE  FROM dbo.GetEmpDtails_DeptWise2(11)
--
CREATE FUNCTION dbo.ILTVF_EX()
RETURNS TABLE
AS
RETURN(SELECT * FROM StdDetails)
--

CREATE FUNCTION dbo.MSTVF_EX()
RETURNS @Tab TABLE
(
 SNO INT
,StdName VARCHAR(100)
,Sub VARCHAR(100)
,Marks INT
)
AS
BEGIN
	INSERT INTO @Tab 
	SELECT * FROM StdDetails

	RETURN

END


SELECT * FROM dbo.ILTVF_EX() WHERE StdName = 'ASHWIN M'
SELECT * FROM dbo.MSTVF_EX() WHERE StdName = 'ASHWIN M'


SELECT * FROM StdDetails

	DELETE FROM dbo.ILTVF_EX() WHERE StdName = 'ASHWIN M'

SELECT * FROM StdDetails



SELECT * FROM StdDetails

	DELETE FROM dbo.MSTVF_EX() WHERE StdName = 'Chakradhar K'

SELECT * FROM StdDetails





DELETE FROM dbo.MSTVF_EX() WHERE StdName = 'ASHWIN M'



FROM dbo.ILTVF_EX()
SELECT * FROM dbo.MSTVF_EX()