--DDL Triggers
--Ex: Create a DDL trigger to avoid DB level DROP table statements.

CREATE TRIGGER DROP_Prevent_Trigger_SQL_Practice
ON DATABASE 
FOR DROP_TABLE
AS 
BEGIN
	ROLLBACK
END 


--DROP TABLE EMPSalary

--SELECT * FROM EMPSalary

