--Introduction to T-SQL programming(Transact - SQL)
--SEQEL (Sequential Expression Language)
--SQL (Structured Query Language)
--T-SQL (Transact - SQL)

	--Variables
		--Local/User defined variables
		--Global/Sys defined variables
	--Control Statements
		--IF,IF-ELSE, & NESTED IF-ELSE
		--CASE & Nested CASE Statements
		--WHILE Loop
		--*IF & GOTO lables(Part of Exception Handling)
	--Dymanic SQL(D-SQL)
		--Writing the SQL code in a dynamic way
-------------------------------------------------------------------------------------------------------

--Introduction to T-SQL Programming
--Variables
--	Local Variables
--	GLobal Variables
--Control Statements
--	IF,IF-ELSE, Nested IF_ELSE
--	CASE Statements
--	While Loop
--	IF & GOTO Labels(Exceptoin Handling)
--Strored Progrmas (Ref. Point-9)
--Dynamic SQL 

--Variables
	--Local Variables
	--GLobal Variables
--Local Variables (Decleration,Assgining Value, Access the Variable)
--Variable Decleration (Syntax)
DECLARE @<VariableName> DataType[<Size>]
--Assiging value to Variable (Syntax)
SET @<VariableName> = AssigningValueHere


--------------------------Intorduction to T-SQL
--------------------------Variables
------------------------	--Local
------------------------	--Global
--------------------------Control Statements
--------------------------Stored Programs
--------------------------Dynamic SQL


--------------------------Local Variables
--------------------------Stages: Decleration,Assign/Caculate,Access
--------------------------General Syntax 
------------------------DECLARE @<VarNameHere> <DataType>[<Size>] --S1
------------------------SET @<VarNameHere> = <ValueHere> --S2
------------------------SELECT/PRINT  @<VarNameHere> --S3

--------------------------Exapmle1

------------------------	DECLARE @Message VARCHAR(100)
------------------------	SET @Message = 'Hi Good Morning!'
------------------------	SELECT @Message 
------------------------GO 
------------------------	DECLARE @Message2 VARCHAR(100)
------------------------	SET @Message2 = 'Hi How are you!'
------------------------	SELECT @Message2 

------------------------GO
--------------------------Exapmle2

------------------------	DECLARE 
------------------------	 @Message VARCHAR(100)
------------------------	,@Message2 VARCHAR(100)

------------------------	SELECT 
------------------------		@Message = 'Hi Good Morning!'
------------------------	   ,@Message2 = 'Hi How are you!'
	
------------------------	SELECT @Message,@Message2
	 


OR

SELECT @<VariableName> = AssigningValueHere
--Access the Variable(SYNTAX)
SELECT @<VariableName> 
OR 
PRINT @<VariableName> 

--Variable Decleration (Example)
	DECLARE @A INT
	--Assiging value to Variable (Example)
	SET @A = 11
	--Access the Variable(Example)
	SELECT @A

	SET @A = 12
	SELECT @A

	
--GLobal Variables
--Access the GLobal Variables(Syntax )
SELECT @@<GlobalVariableHere>
--Access the GLobal Variables(Example)
	SELECT @@SPID
	SELECT @@SERVERNAME
	SELECT @@IDENTITY

--IF,IF-ELSE, Nested IF ELSE
--General Syntax
	IF (<Condition(s)>)
	BEGIN--{
		T-SQL Staements
		:
		:
	END --}
	ELSE 
	BEGIN
		T-SQL Staements
		:
		:
	END 
----------Nesting the Control statements
IF (<Condition(s)>)
BEGIN
	T-SQL Staements
	:
	:
	IF (NestingCondition-1(s))
	BEGIN
		T-SQL Staements
		:
		:
	END
	ELSE 
	BEGIN
		T-SQL Staements
		:
		:
	END
END 
ELSE IF(Alternative Condition(s))
BEGIN
	T-SQL Staements
	:
	:
END 
ELSE IF(Alternative Condition(s))
BEGIN
	T-SQL Staements
	:
	:
END 
ELSE --Blindly execute this if none of the above conditions are satisfied
BEGIN
	T-SQL Staements
	:
	:
END 

--Example: Grreet with the following messages based on the present time 
--24 Hours format

0 - 6 Good Early Morning!
7 - 11 Good Morning!
12 - 15 Good Afternoon!
>15 Good Evening!

SELECT GETDATE()

2016-09-01 07:16:08.227
YYYY-MM-DD HH:MI:SS.MIS

SELECT DATEPART(HH,GETDATE())
--A1

IF (DATEPART(HH,GETDATE()) BETWEEN 0 AND 6)
BEGIN
	PRINT 'Good Early Morning!'
END
IF (DATEPART(HH,GETDATE()) BETWEEN 7 AND 11)
BEGIN
	PRINT 'Good Morning!'
END
IF (DATEPART(HH,GETDATE()) BETWEEN 12 AND 15)
BEGIN
	PRINT 'Good Afternoon!'
END
IF (DATEPART(HH,GETDATE()) >15)
BEGIN
	PRINT 'Good Evening!'
END

--------

--A2
IF (DATEPART(HH,GETDATE()) BETWEEN 0 AND 6)
BEGIN
	PRINT 'Good Early Morning!'
END
ELSE IF (DATEPART(HH,GETDATE()) BETWEEN 7 AND 11)
BEGIN
	PRINT 'Good Morning!'
END
ELSE IF (DATEPART(HH,GETDATE()) BETWEEN 12 AND 15)
BEGIN
	PRINT 'Good Afternoon!'
END
ELSE --IF (DATEPART(HH,GETDATE()) >15)
BEGIN
	PRINT 'Good Evening!'
END
--------

--A3
IF (DATEPART(HH,GETDATE()) BETWEEN 0 AND 11)
BEGIN
	IF (DATEPART(HH,GETDATE()) BETWEEN 0 AND 6)
	BEGIN
		PRINT 'Good Early Morning!'
	END
	ELSE 
	BEGIN
		PRINT 'Good Morning!'
	END
END
ELSE 
BEGIN
	IF (DATEPART(HH,GETDATE()) BETWEEN 12 AND 15)
	BEGIN
		PRINT 'Good Afternoon!'
	END
	ELSE 
	BEGIN
		PRINT 'Good Evening!'
	END
END

--A4

DECLARE 
	 @NowTime DATETIME
	,@HourPart INT

--SET @NowTime = GETDATE()
--SET @HourPart = DATEPART(HH,@NowTime)

SELECT  @NowTime = GETDATE(),@HourPart = DATEPART(HH,@NowTime)

--SELECT  @NowTime ,@HourPart
 
 
 
--SELECT  @NowTime, @HourPart 
IF (@HourPart BETWEEN 0 AND 11)
BEGIN
	IF (@HourPart BETWEEN 0 AND 6)
	BEGIN
		PRINT 'Good Early Morning!'
	END
	ELSE 
	BEGIN
		PRINT 'Good Morning!'
	END
END
ELSE 
BEGIN
	IF (@HourPart BETWEEN 12 AND 15)
	BEGIN
		PRINT 'Good Morning!'
	END
	ELSE 
	BEGIN
		PRINT 'Good Evening!'
	END
END
--
--Case Statements
--General Syntax

CASE 
	WHEN Condition(s) THEN EvalueatedVale-1
	WHEN Condition(s) THEN EvalueatedVale-2
	WHEN Condition(s) THEN EvalueatedVale-3
	:
	:
	ELSE Alt-EavluatedValue
END	
	
--Example1(A1)
DECLARE @GreetingMessage VARCHAR(100)

SET @GreetingMessage 
=
(
	CASE 
		WHEN DATEPART(HH,GETDATE()) BETWEEN 0 AND 6 THEN 'Good Early Morning!'
		WHEN DATEPART(HH,GETDATE()) BETWEEN 7 AND 11 THEN 'Good Morning!'
		WHEN DATEPART(HH,GETDATE()) BETWEEN 12 AND 15 THEN 'Good Afternoon!'
		ELSE 'Good Evening!'
	END	
)	

PRINT @GreetingMessage 

GO 
--Example1(A2)
DECLARE @GreetingMessage VARCHAR(100)
	   ,@NowTime DATETIME
	   ,@HourPart INT

SELECT  @NowTime = GETDATE(),@HourPart = DATEPART(HH,@NowTime)


SET @GreetingMessage 
=
(
	CASE 
		WHEN @HourPart BETWEEN 0 AND 6 THEN 'Good Early Morning!'
		WHEN @HourPart BETWEEN 7 AND 11 THEN 'Good Morning!'
		WHEN @HourPart BETWEEN 12 AND 15 THEN 'Good Afternoon!'
		ELSE 'Good Evening!'
	END	
)	

SELECT @GreetingMessage 


GO

--Example1(A3)
DECLARE @GreetingMessage VARCHAR(100)
	   ,@NowTime DATETIME
	   ,@HourPart INT

SELECT  @NowTime = GETDATE(),@HourPart = DATEPART(HH,@NowTime)


SET @GreetingMessage 
=
(
	CASE 
		WHEN @HourPart BETWEEN 0 AND 11
		THEN 
			CASE 
				 WHEN @HourPart BETWEEN 0 AND 6 THEN 'Good Early Morning!'
				 ELSE 'Good Morning!'
			END
		ELSE -- @HourPart BETWEEN 11 AND 23	
		--THEN 
			CASE 
				 WHEN @HourPart BETWEEN 12 AND 15 THEN 'Good Afternoon!'
				 ELSE 'Good Evening!'
			END
	 END			
)	

SELECT @GreetingMessage 

--Ex Req-2 For case statements
--Read the qualification  and short forms as per the 
--below desc.

--B.TECH	Bachelor of Technology
--MCA	Master of Computer Applications
--BTECH	Bachelor of Technology
--B.E	Bachelor Of Engineering
--M.Tech	Master of Technology
--MTECH	Master of Technology
--MBA	Master of Business Administraion

--Exapected fileds(Candidate FullName, Qualification ShortForm & FullForm)

SELECT * FROM sys.sysobjects WHERE type = 'U'


SELECT * FROM EmpDetails

ALTER TABLE EmpDetails
ADD QualificationShort VARCHAR(10)

SELECT * FROM EmpDetails

UPDATE EmpDetails
SET QualificationShort = 'B.Tech'
WHERE EmpID IN (2,4,6)

UPDATE EmpDetails
SET QualificationShort = 'M.Tech'
WHERE EmpID IN (3,5,7)

UPDATE EmpDetails
SET QualificationShort = 'SSC'
WHERE EmpID IN (5)


UPDATE EmpDetails
SET QualificationShort = 'MCA'
WHERE EmpID IN (8,10,11)

UPDATE EmpDetails
SET QualificationShort = 'B.E'
WHERE EmpID IN (9,13,14)

UPDATE EmpDetails
SET QualificationShort = 'BE'
WHERE EmpID IN (9,14)



SELECT 
-- EmpID
--,EmpFirstName
--,EmpLastName
--,ManagerID
--,DOB
--,DeptID
--,Mobile
--,Email
--,QualificationShort 
*
,CASE 
	WHEN QualificationShort IN ('BE','B.E') THEN 'Bachelor of Engineering'
	WHEN QualificationShort IN ('B.Tech','BTech') THEN 'Bachelor of Technology'
	WHEN QualificationShort IN ('M.Tech','MTech') THEN 'Master of Technology'
	WHEN QualificationShort IN ('M.C.A','MCA') THEN 'Master of Computer Applications'
	ELSE 'Unknown Qulaification'
END AS QualificationFull
FROM EmpDetails


--Update the QualificationFull column value based on the above case evaluations permanently


SELECT * FROM EmpDetails

	UPDATE EmpDetails 
	SET QualificationFull =
	(
		CASE 
			WHEN QualificationShort IN ('BE','B.E') THEN 'Bachelor of Engineering'
			WHEN QualificationShort IN ('B.Tech','BTech') THEN 'Bachelor of Technology'
			WHEN QualificationShort IN ('M.Tech','MTech') THEN 'Master of Technology'
			WHEN QualificationShort IN ('M.C.A','MCA') THEN 'Master of Computer Applications'
			WHEN QualificationShort IN ('SSC','S.S.C') THEN 'SSC'
			ELSE 'Unknown Qulaification'
		END
	)


SELECT * FROM EmpDetails

--While Loop(Syntax)

Varaiable(s) Decleration & Assiging Section

WHILE(Condition Relating to the varaiabble(s) )
BEGIN
	T-SQL Programming
	:
	:
	
	Varibale Increment/Decrement
END

--Ex1 (To display the first N, Natural Numbers)

DECLARE @A INT = 1 --Defaulting the variable value
--SELECT @A
WHILE(@A <= 20)
BEGIN
	SELECT @A
	SET @A = @A + 1
END

--Ex2 (To display the first N Even Numbers)

DECLARE @A INT = 1 --Defaulting the variable value
--SELECT @A
WHILE(@A <= 20)
BEGIN
	IF(@A % 2 = 0)
	BEGIN
		PRINT @A
	END
	SET @A = @A + 1
END


--A2

DECLARE @A INT = 0 --Defaulting the variable value
--SELECT @A
WHILE(@A <= 20)
BEGIN
	IF(@A % 2 = 0)
	BEGIN
		PRINT CAST(@A AS VARCHAR(100)) + ':is an even number'
	END
	ELSE 
	BEGIN
		PRINT CAST(@A AS VARCHAR(100)) + ':is an odd number'
	END
	SET @A = @A + 1
END


EXEC('SELECT * FROM EmpDetails')


--Introduction to Dynamic SQL 
DECLARE @SQL NVARCHAR(MAX)
DECLARE @TableName NVARCHAR(100)

SELECT @SQL = ' SELECT * FROM ',@TableName = 'EmpDetails'

SET @SQL = @SQL +@TableName 

--PRINT @SQL 

--EXEC(@SQL)

EXEC SP_EXECUTESQL @SQL








