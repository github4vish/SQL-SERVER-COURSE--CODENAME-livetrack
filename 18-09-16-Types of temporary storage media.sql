--Types of temporary storage media
--Subqueries and Correlated sub queries
--Views
--Ex1 (Simple View)

		ALTER VIEW VW_EmpDetails
		--WITH ENCRYPTION
		AS
		SELECT 
		 EmpFirstName
		,EmpLastName
		,DeptID
		,Email
		FROM EmpDetails

		SELECT * FROM EmpDetails
		SELECT * FROM VW_EmpDetails
		SELECT * FROM 
		( SELECT * FROM EmpDetails ) A

	DELETE FROM VW_EmpDetails WHERE EmpFIrstName = 'B suman'

	--Ex2 Complex View

	CREATE VIEW VW_EMP_AND_Manager
	AS
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

	--SELECT * FROM VW_EMP_AND_Manager

	--DELETE FROM VW_EMP_AND_Manager
	--WHERE EmpID = 13
--Materialized view(View with schema binding OR Inddexed views)
--Ex1: Convert the above Ex2 complex view as materialized view.

	CREATE VIEW VW_EMP_AND_Manager_Materialized
	WITH SCHEMABINDING
	AS
	SELECT 
	 E1.EmpID 
	,E1.EmpFirstName +' '+E1.EmpLastName AS EmpFullName
	,ISNULL(D1.DeptID,'-1') AS EmpDeptId
	,ISNULL(D1.DeptName,'N/A') AS EmpDeptName

	,ISNULL(E2.EmpID,'-1') AS ManagerID
	,ISNULL(E2.EmpFirstName +' '+ E2.EmpLastName,'N/A') AS ManagerFullName
	,ISNULL(D2.DeptID,'-1') AS ManagerDeptId
	,ISNULL(D2.DeptName,'N/A') AS ManagerDeptName

	FROM dbo.EmpDetails E1
	LEFT OUTER JOIN dbo.EmpDetails E2
	ON E1.ManagerID = E2.EmpID
	LEFT OUTER JOIN dbo.DeptDetails D1
	ON E1.DeptID = D1.DeptID
	LEFT OUTER JOIN dbo.DeptDetails D2
	ON E2.DeptID = D2.DeptID

--VW_EMP_AND_Manager
--VW_EMP_AND_Manager_Materialized
--Temporary tables:
	--Local Temporary tables
	--GloablTemporary tables
--General syntax
CREATE TABLE #/##<TempTableName>
(
	Table structure
)

SELECT * INTO #EmpDetails FROM EmpDetails

SELECT * FROM #EmpDetails

IF EXISTS (SELECT * FROM tempdb.dbo.#EmpDetails)
PRINT 'A'
ELSE PRINT 'B'


SELECT * FROM ##DeptDetails
--CTE

INSERT INTO EmpTab
SELECT * FROM EmpTab WHERE DeptID = 14 

SELECT DISTINCT * FROM EmpTab 

SELECT * FROM EmpTab ORDER BY 1

SELECT * FROM TriggerAudits

--Removing the duplicated rows using Sub query

DELETE 
A
FROM 
(
	SELECT 
	 * 
	,ROW_NUMBER()
	OVER (
		PARTITION BY 
		 EmpID
		,EmpFirstName
		,EmpLastName
		,ManagerID
		,DOB
		,DeptID
		,Mobile
		,Email
		ORDER BY 
		 EmpID
		,EmpFirstName
		,EmpLastName
		,ManagerID
		,DOB
		,DeptID
		,Mobile
		,Email
	) ROwNum
	FROM EmpTab 
) A
WHERE A.ROwNum > 1

--Removing the duplicated rows using CTE
WITH Dup_EMP_CTE
AS
(
	SELECT 
	 * 
	,ROW_NUMBER()
	OVER (
		PARTITION BY 
		 EmpID
		,EmpFirstName
		,EmpLastName
		,ManagerID
		,DOB
		,DeptID
		,Mobile
		,Email
		ORDER BY 
		 EmpID
		,EmpFirstName
		,EmpLastName
		,ManagerID
		,DOB
		,DeptID
		,Mobile
		,Email
	) ROwNum
	FROM EmpTab 
)
DELETE FROM Dup_EMP_CTE WHERE ROwNum >1 

SELECT * FROM Dup_EMP_CTE WHERE ROwNum >1 

--CURSORS in SQL Serer
--Ex1: Create a cursor to read EMPTab ecords one-by-one

DECLARE EMPTab_CURSOR CURSOR FOR SELECT * FROM EmpTab
	OPEN EMPTab_CURSOR 
		
		WHILE(@@FETCH_STATUS  = 0)
		BEGIN
			FETCH NEXT FROM EMPTab_CURSOR 
			SELECT @@FETCH_STATUS --0,-1-2,
		END

	CLOSE EMPTab_CURSOR 
DEALLOCATE EMPTab_CURSOR 

--Ex2: Update the salaries of all the departments based on the salry slabs mentioned earlier
--But, update one empID Salary at a time.

DECLARE EmpSalaryCursor CURSOR FOR SELECT EmpID,EmpFirstName,EmpLastName FROM EmpDetails

	OPEN EmpSalaryCursor 

	DECLARE 
	 @EmpID INT 
	,@EmpFirstName VARCHAR(100)
	,@EmpLastName VARCHAR(100)
	,@OldSlary MONEY
	,@HikedSalary MONEY
	,@ExecutionMessage VARCHAR(MAX)=''

		WHILE (@@FETCH_STATUS = 0)
		BEGIN

			FETCH NEXT FROM EmpSalaryCursor
			INTO @EmpID ,@EmpFirstName ,@EmpLastName 
	
			EXEC ApplySalaryHike_EMPIDWise_USP  @EmpID,@OldSlary OUTPUT,@HikedSalary OUTPUT

			SET @ExecutionMessage = 'Dear '+@EmpFirstName+@EmpLastName+'!'
			SET @ExecutionMessage = @ExecutionMessage + 'Your Old salary was:'+CAST(@OldSlary AS VARCHAR(100))
			SET @ExecutionMessage = @ExecutionMessage + 'Hiked salary is:'+CAST(@HikedSalary AS VARCHAR(100))

			PRINT @ExecutionMessage

		END

	CLOSE EmpSalaryCursor

DEALLOCATE EmpSalaryCursor

