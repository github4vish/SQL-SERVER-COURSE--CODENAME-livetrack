--Foreign Key Excercise
--Master table 
	CREATE TABLE DeptDetails		
	(
	 DeptID INT PRIMARY KEY
	,DeptName	VARCHAR(100) NOT NULL
	,DeptDesc VARCHAR(MAX) 
	)
	INSERT INTO DeptDetails		
	SELECT '10','IT Dept','IT Dept'UNION ALL 
	SELECT '11','HR Dept','HR Dept'UNION ALL 
	SELECT '12','Transport Dept','Transport Dept'UNION ALL 
	SELECT '13','Payroll Dept','Payroll Dept'UNION ALL 
	SELECT '14','Admin Dept','Admin Dept'UNION ALL 
	SELECT '15','Facilities Dept','Facilities Dept'
----------Child/Dependant table creation
CREATE TABLE EmpDetails							
(
 EmpID INT PRIMARY KEY
,EmpFirstName VARCHAR(100)	
,EmpLastName  VARCHAR(100)	
,ManagerID INT FOREIGN KEY REFERENCES EmpDetails(EmpID)--Self referential integrity
,DOB DATETIME	 
,DeptID INT FOREIGN KEY REFERENCES DeptDetails(DeptID)--Etn referential integrity
,Mobile	BIGINT 
,Email VARCHAR(100)
)

INSERT INTO EmpDetails
SELECT '1','Manoj Kumar Reddy T','B','8','1990-01-02','10','9845023456','manojreddy.thallapalli@gmail.com'UNION ALL 
SELECT '2','Mouli. K','C','5','1990-01-03','12','9845034567','kmouli99@gmail.com'UNION ALL 
SELECT '3','John Babu G','A','5','1990-01-04','14','9845045678','johnganta88@gmail.com'UNION ALL 
SELECT '4','Gangaraju D','B','8','1990-01-05','11','9845056789','gangarajud906@gmail.com'UNION ALL 
SELECT '5','Trinadh Babu B','C','7','1990-01-06','13','9845067900','b.trinadh258@gmail.com'UNION ALL 
SELECT '6','Renuka G','A','7','1990-01-07','15','9845079011','renukamcasvec@gmail.com'UNION ALL 
SELECT '7','Sarada M','B',NULL,'1990-01-08','12','9845090122','Sarada.nit005@gmail.com'UNION ALL 
SELECT '8','Saikeerthi','C','5','1990-01-09','14','9845101233','sai.keerthi32@gmail.com'UNION ALL 
SELECT '9','B suman','A','7','1990-01-10','11','9845112344','bsuman993@outlook.com'UNION ALL 
SELECT '10','NARAYANA REDDY M','B','7','1990-01-11',NULL,'9845123455','mnarayanardy@gmail. com'UNION ALL 
SELECT '11','Penchalareddy M','C','8','1990-01-12','11','9845134566','penchal483.up@gmail.com'UNION ALL 
SELECT '12','Viswanath M','A','7','1990-01-13','10','9845145677','viswanath549@gmail.com'
 
---
INSERT INTO EmpDetails
SELECT '13','Manoj Kumar Reddy T2','B2','8','1990-01-02',NULL,'9845023456','manojreddy.thallapalli@gmail.com'

UPDATE EmpDetails 
SET DeptID = 14
WHERE EmpID = 13

SELECT * FROM EmpDetails

INSERT INTO EmpDetails
SELECT '14','Manoj Kumar Reddy T3','B3','7','1990-01-02','14','9845023456','manojreddy.thallapalli@gmail.com'




