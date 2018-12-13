--Miscelanious concepts in SQL Server
--Merge command in SQL Server
SELECT * INTO EmpMergeSource FROM EmpTab

SELECT * INTO EmpMergeDestination  FROM EmpTab

--
SELECT * FROM EmpMergeSource 

DELETE FROM EmpMergeSource 
WHERE EMPID%2 = 0


SELECT * FROM EmpMergeSource 

	UPDATE EmpMergeSource 
	SET Mobile = 
	(
		CASE 
			WHEN EmpID = 1 THEN 9885098851
			WHEN EmpID = 3 THEN 9885098853
			WHEN EmpID = 5 THEN 9885098855
			WHEN EmpID = 7 THEN 9885098857
			WHEN EmpID = 11 THEN 9885098811
			WHEN EmpID = 13 THEN 9885098813
			WHEN EmpID = 19 THEN 9885098819
		END
	)

SELECT * FROM EmpMergeSource 



INSERT INTO EmpMergeSource 
SELECT '41','B suman3','D','7','1990-01-10 00:00:00.000','11','9845112641','jhjhj93@outlookcfcvb.com' UNION ALL
SELECT '42','Gangaraju2 E','X','8','1990-01-05 00:00:00.000','11','68423146789','lkjklj06@gmail.com'


SELECT * FROM EmpMergeSource 
SELECT * FROM EmpMergeDestination  

----Merging these two tables (table EmpMergeSource into Table "EmpMergeDestination")

GO
	SELECT * FROM EmpMergeSource 
	SELECT * FROM EmpMergeDestination  
GO
	MERGE INTO EmpMergeDestination D
	USING (SELECT * FROM EmpMergeSource )S
	ON D.EmpID = S.EmpID
	WHEN MATCHED 
	THEN
		UPDATE SET
		 D.Mobile = S.Mobile 
		,D.Email = S.Email 
	WHEN NOT MATCHED 
	THEN 
		INSERT(
		 EmpID
		,EmpFirstName
		,EmpLastName
		,ManagerID
		,DOB
		,DeptID
		,Mobile
		,Email
		)
		VALUES
		(
		 S.EmpID
		,S.EmpFirstName
		,S.EmpLastName
		,S.ManagerID
		,S.DOB
		,S.DeptID
		,S.Mobile
		,S.Email
		);
GO
	SELECT * FROM EmpMergeSource 
	SELECT * FROM EmpMergeDestination  
GO





