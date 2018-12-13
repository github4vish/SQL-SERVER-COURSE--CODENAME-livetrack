--Types of temporary storage media
--Subqueries and Correlated sub queries
--Views
--Ex1 (Simple View)

	CREATE VIEW VW_EmpDetails
	--WITH ENCRYPTION
	AS
	SELECT 
	 EmpFirstName
	,EmpLastName
	,DeptID
	,Email
	FROM EmpDetails
----------------------------------


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

--Matarialized view
