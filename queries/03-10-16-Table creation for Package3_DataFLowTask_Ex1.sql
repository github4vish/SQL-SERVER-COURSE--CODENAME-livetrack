--Table creation for Package3_DataFLowTask_Ex1

CREATE TABLE Package3_DataFLowTask_Ex1
(
	 EmpID INT
	,EmpFirstName VARCHAR(50)
	,EmpLastName VARCHAR(50)
	,ManagerID INT
	,DOB DATETIME 
	,DeptID INT
	,Mobile BIGINT
	,Email  VARCHAR(50)
	,Emails  VARCHAR(50)
	,Salary MONEY
)

SELECT * FROM Package3_DataFLowTask_Ex1

TRUNCATE TABLE Package3_DataFLowTask_Ex1