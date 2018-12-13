--Sys defined procedures
SP_
-------

	SP_HELP
	SP_HELPTEXT
	SP_WHO
	SP_WHO2
	--SP_HELPTEXT SP_HELP
	SP_HELPTRIGGER 
	SP_DEPENDS EmpDetails
	SP_DEPENDS ApplySalaryHike_EMPIDWise_USP
	SP_EXECUTE
	SP_EXECUTESQL

XP_
------------
	XP_CMDSHELL
	XP_SENDMAIL 
EXEC xp_logininfo





--User defined procedures in SQL Server
--A procedure is a set of T-SQL statements, which is capable of performing ANY TYPE of
--command in side it's body. Unlike a function, a procedure NEED NOT to return any value(s), untill 
--the procedure is having any OUTPUT Parameter(s).

--Types of procedures

--SP without any parameters
--SP with INPUT & OUTPUT parameters
--SP with DEFAULT parameters

--General syntax

CREATE PROC/PROCEDURE <ProcedureName>
(
	List of parameters with their data types(Comma seperated)	
)
AS
BEGIN
	Procedural statements 
	:
	:
	:

END

--Calling a procredure

[EXEC/EXECUTE] <ProcedureName> List of parameters here(Comma seperated)

-Ex1

GO

	CREATE PROCEDURE Add_SP
	(
		 @A INT
		,@B INT
	)
	AS
	BEGIN
		DECLARE @C INT
		SET @C  = @A+@B

		SELECT @C
	END


	SP_HELPTEXT Add_SP

	EXEC Add_SP 10,20
	GO
	EXECUTE Add_SP 10,20
	GO
	Add_SP 10,20
--Ex2
	CREATE PROCEDURE GetEmpDtails_DeptWise_USP
	(
		@DeptID INT
	)
	AS
	BEGIN
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
END

GetEmpDtails_DeptWise_USP 11

--Ex3: Write a procedure to apply the salary hikes for a specific EmpID supplied

CREATE PROCEDURE ApplySalaryHike_EMPIDWise_USP
(
	@EMPID INT
)
AS
BEGIN
	UPDATE EmpDetails
	SET Salary = dbo.SalaryHike(EmpID)
	WHERE EmpID = @EMPID
END

SELECT * FROM EmpDetails
WHERE EmpID = 4
GO
	EXECUTE ApplySalaryHike_EMPIDWise_USP 4
GO
SELECT * FROM EmpDetails
WHERE EmpID = 4
---Ex4, adding extra OUTPUT parameters to capture old and hiked salaries of a given employee
 
ALTER PROCEDURE ApplySalaryHike_EMPIDWise_USP
(
	 @EMPID INT
	,@OldSalary MONEY OUTPUT
	,@HikedSalary MONEY OUTPUT
)
AS
BEGIN

	SET @OldSalary = (SELECT Salary FROM EmpDetails WHERE EmpID = @EMPID)

		UPDATE EmpDetails
		SET Salary = dbo.SalaryHike(EmpID)
		WHERE EmpID = @EMPID

	SET @HikedSalary = (SELECT Salary FROM EmpDetails WHERE EmpID = @EMPID)

END

GO 

DECLARE @OldSalary MONEY
	   ,@HikedSalary MONEY

EXEC ApplySalaryHike_EMPIDWise_USP 1,@OldSalary OUTPUT,@HikedSalary OUTPUT

SELECT  @OldSalary,@HikedSalary 

--Ex5: Write a procedure to insert data into EmpDetails_WithConstraints, by accepting all the column values 
--as input parameters.
SELECT * FROM EmpDetails_WithConstraints

CREATE PROCEDURE Insert_EmpDetails_WithConstraints_USP
(
	 @EMPID INT OUTPUT 
	,@FirstName VARCHAR(100)
	,@LastName VARCHAR(100)
	,@DOB DATETIME
	,@Mobile BIGINT
	,@emailID  VARCHAR(100)
	,@AddressLine1  VARCHAR(1000)
	,@AddressLine2  VARCHAR(1000)
	,@PANCard  VARCHAR(10)
	,@LocationCity  VARCHAR(100) = 'Hyderabad'
	,@Qualification  VARCHAR(100)
)
AS
BEGIN
	INSERT INTO [dbo].[EmpDetails_WithConstraints]
			   (
				[FirstName]
			   ,[LastName]
			   ,[DOB]
			   ,[Mobile]
			   ,[emailID]
			   ,[AddressLine1]
			   ,[AddressLine2]
			   ,[PANCard]
			   ,[LocationCity]
			   ,[Qualification]
			   )
		 SELECT  
				@FirstName
			   ,@LastName
			   ,@DOB
			   ,@Mobile
			   ,@emailID
			   ,@AddressLine1
			   ,@AddressLine2
			   ,@PANCard
			   ,@LocationCity
			   ,@Qualification

	SET @EMPID = @@IDENTITY

END


GO

DECLARE @EMPID INT

EXECUTE [dbo].[Insert_EmpDetails_WithConstraints_USP] 
   @EMPID OUTPUT
  ,'Viswanath'
  ,'A'
  ,'1990-02-02'
  ,9845098450
  ,'Viswanath.A@gmail.com'
  ,'aidhfrjkadhfjhadjh [odgjlksdxjcvkjdfklg as;dlkfjvlkajdsfgkljaskldgjasd rr;kalsjdfvklasjdg '
  ,'fpiuhjuadhfjkhxihjlkasdhvljhsadv '
  ,'hjhjhjhjhjj'
  , DEFAULT
  ,'BTech'

SELECT @EMPID 