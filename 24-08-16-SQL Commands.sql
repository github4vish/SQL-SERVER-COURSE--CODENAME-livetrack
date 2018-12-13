--Types of SQL Commands
--DDL	:Creations,alterations, Droppings, Truncations of the DB objects
--		:
	CREATE
	ALTER
	DROP 
	TRUNCATE
--DML	:Modify, Insert(Load),Remove(Delete) records
	INSERT
	UPDATE
	DELETE
	MERGE(INSERT + UPDATE/DELETE)	 
--DQL	: Selecting to results and printing the mesages of a T-SQL/SP/Function
	SELECT 
	PRINT
--TCL	:In order to implement the *user defined transactions in SQL Server 
	COMMIT
	ROLLBACK
	SAVE
--DCL	: To give and take back the permisions to the roles(WA Roles + SA Roles) of an SQL Server Instance
	GRANT
	REVOKE
	DENY
--------------------
--DDL	:Creations,alterations, Droppings, Truncations of the DB objects
--		:
	CREATE
	ALTER
	DROP 
	TRUNCATE

CREATE(Table): 
Syntax: 

CREATE TABLE <TableName>
(
	 Column1 Datatype[<Size>]
	,Column2 Datatype[<Size>]
	,Column3 Datatype[<Size>]
	:
	:
	:
)

--Ex1: 
CREATE TABLE SQL_Practice.dbo.PersonDetails
(
 SNO INT	 
,FullName VARCHAR(50)	 
,Qualification	VARCHAR(25)
,Stream	VARCHAR(25)
,PassedOutYear INT	
,University	 VARCHAR(50)
,EmailID VARCHAR(100)
)

----INSERT(Table)
--General Syntax 
--A1:(Single row insertion at a time) 
	 INSERT INTO <TableName>
	 VALUES (Value1,Value2,Value3,......)
	 --(Multiple rows insertion at a time) 
	 INSERT INTO <TableName>
	 VALUES  (Value1,Value2,Value3,......) --Row1
			,(Value1,Value2,Value3,......) --Row2
			,(Value1,Value2,Value3,......) --Row3
			:
			:
			:
--A2:(Single row insertion at a time) 
	INSERT INTO <TableName>(Column1,Column2,Column3,.......)
	VALUES (Value1,Value2,Value3,......)
	--(Multiple rows insertion at a time) 
	INSERT INTO <TableName>(Column1,Column2,Column3,.......)
	VALUES   (Value1,Value2,Value3,......) --Row1
			,(Value1,Value2,Value3,......) --Row2
			,(Value1,Value2,Value3,......) --Row3
			:
			:
			:
--****A3:(Single row insertion at a time) 
--(*** SET OPERATOR "UNION ALL")
	INSERT INTO <TableName>
	SELECT Value1,Value2,Value3,......--Row1

	--(Multiple rows insertion at a time) 
	INSERT INTO <TableName>
	SELECT Value1,Value2,Value3,......)   UNION ALL --Row1
	SELECT Value1,Value2,Value3,......)   UNION ALL --Row2
	SELECT Value1,Value2,Value3,......)   UNION ALL --Row3
	:
	:
	:
	SELECT Value1,Value2,Value3,......)   --Row N

SELECT * FROM PersonDetails

	INSERT INTO PersonDetails
	VALUES('1','Brahma','MCA','Computer Science','2010','SRM University','brahma365msbi@gmail.com')
	PRINT 'Row is inserted successfully'

SELECT * FROM PersonDetails

--TRUNCATE 
--Syntax : TRUNCATE TABLE <TableName>
TRUNCATE TABLE PersonDetails

--A1, Insert multiple records
SELECT * FROM PersonDetails

	INSERT INTO PersonDetails
	VALUES   ('2','Manoj Kumar Reddy T','B.Tech','CSE','2014','JNTUA','manojreddy.thallapalli@gmail.com')
			,('3','Mouli. K','B.Tech','EEE','2010','JNTUA','kmouli99@gmail.com')

SELECT * FROM PersonDetails
--A2, Insert single record
INSERT INTO PersonDetails(FullName,SNO,Qualification,Stream,PassedOutYear,EmailID,University)
VALUES('John Babu G',4,'B.Tech','Mech','2011','johnganta88@gmail.com','JNTUK')
--A3, Insert Single & Multiple records at a time

SELECT * FROM PersonDetails

	INSERT INTO PersonDetails
	SELECT '5','Gangaraju D','MCA','Computers','2015','SVU','gangarajud906@gmail.com'

SELECT * FROM PersonDetails


SELECT * FROM PersonDetails

	INSERT INTO PersonDetails
	SELECT '6','Trinadh Babu B','B.Tech','EEE','2011','JNTUK','b.trinadh258@gmail.com' UNION ALL 
	SELECT '7','Renuka G','MCA','','2015','JNTUA','renukamcasvec@gmail.com' UNION ALL 
	SELECT '8','Sarada M','B.Tech','IT','2014','JNTUK','Sarada.nit005@gmail.com' UNION ALL 
	SELECT '9','Saikeerthi','B.Tech','EEE','2015','JNTUA','sai.keerthi32@gmail.com' UNION ALL 
	SELECT '10','B suman','B.Tech','CSE','2012','JNTUA','bsuman993@outlook.com' UNION ALL 
	SELECT '11','NARAYANA REDDY M','MCA','','2015','JNTUA','mnarayanardy@gmail. com' UNION ALL 
	SELECT '12','Penchalareddy M','B.Tech','ECE','2014','JNTUA','penchal483.up@gmail.com' 

SELECT * FROM PersonDetails 

--
INSERT PersonDetails(SNO,FullName,PassedOutYear,University,EmailID)
SELECT '13','Viswanath M','2013','JNTUK','viswanath549@gmail.com'

--UPDATE(Table)
--Syntax:
UPDATE <TableName>
SET 
 Column1 = Value1
,Column2 = Value2
:
:
:
WHERE Condition(s)--
AND/OR Condition(s)
AND/OR COndition(s)
:
:
--Ex1: Update all the MCA qualification records stream value as 'Computer Science'

--A1

SELECT * FROM PersonDetails 
WHERE Qualification = 'MCA'

	UPDATE PersonDetails 
	SET Stream = 'Computer Science'
	WHERE Qualification = 'MCA'

SELECT * FROM PersonDetails 
WHERE Qualification = 'MCA'



--A2
SELECT * FROM PersonDetails 
WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE  Qualification = 'MCA')


	UPDATE PersonDetails 
	SET Stream = 'Computer Science'
	WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE  Qualification = 'MCA')


SELECT * FROM PersonDetails 
WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE  Qualification = 'MCA')

--***Ex2: 
--ALTER (Add a new column to the Table )
--Syntax:
ALTER TABLE <TableName>
ADD  NewColumn1 DataType[<Size>]
	,NewColumn2 DataType[<Size>]
	:
	:
--Ex1: Define a new column to the PersonDetails table titling as "LocationCity"
--All B.Techs set tp Location 'Bangalore' and MCA's set to 'Hyderabad'

SELECT * FROM PersonDetails

	ALTER TABLE PersonDetails
	ADD LocationCity VARCHAR(100)

SELECT * FROM PersonDetails
---
SELECT * FROM PersonDetails 

	UPDATE PersonDetails 
	SET LocationCity = 'Hyderabad'
	WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE  Qualification = 'MCA')

SELECT * FROM PersonDetails 

	UPDATE PersonDetails 
	SET LocationCity = 'Bangalore'
	WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE  Qualification = 'B.Tech')

SELECT * FROM PersonDetails 

--Ex2: Identifiy the left over records for location city and set all of them to 'LocationCity'
--'NA' 'N/A'

SELECT * FROM PersonDetails
WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE LocationCity IS NULL)

	UPDATE PersonDetails
	SET LocationCity = 'Unknown'
	WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE LocationCity IS NULL)

SELECT * FROM PersonDetails
WHERE SNO IN (SELECT SNO FROM PersonDetails WHERE LocationCity IS NULL)
 
 SELECT * INTO <BackupTable> FROM <BaseTable>

--SP_HELP PersonDetails
 
SP_HELP PersonDetails_Copy -- (OR) SELECT * FROM PersonDetails_Copy
GO
	SELECT * INTO PersonDetails_Copy FROM PersonDetails -- At a time table creation and Data insertion
GO
SP_HELP PersonDetails_Copy -- (OR) SELECT * FROM PersonDetails_Copy


SELECT * FROM PersonDetails_Copy

TRUNCATE TABLE PersonDetails

---
SELECT * FROM PersonDetails

	INSERT INTO PersonDetails 
	SELECT * FROM PersonDetails_Copy --Data only will be inserted

SELECT * FROM PersonDetails

--DROP (Dropping a Complte Table)
--Syntax 
DROP TABLE <TableName>

--Ex:
SELECT * FROM PersonDetails
GO 
	DROP TABLE PersonDetails
GO
SELECT * FROM PersonDetails

SELECT * INTO PersonDetails FROM PersonDetails_Copy 

--DROP (Dropping a specific column)
--Syntax
ALTER TABLE <TableName>
DROP COLUMN <ColumnName>

--Ex1: Remove the Qualification COlumn from Persondetails table

SP_HELP PersonDetails
GO
	ALTER TABLE PersonDetails
	DROP COLUMN Qualification
GO
SP_HELP PersonDetails

SELECT * FROM PersonDetails
SELECT * FROM PersonDetails_Copy

--Ex2, add the recently removed column Qualification and reproduce the data we had lost

SELECT * FROM PersonDetails
GO
	ALTER TABLE PersonDetails
	ADD Qualification VARCHAR(100)
GO
	UPDATE PersonDetails
	SET Qualification = 'B.Tech'
	WHERE SNO IN (SELECT SNO FROM PersonDetails_Copy WHERE Qualification = 'B.Tech')
GO
	UPDATE PersonDetails
	SET Qualification = 'MCA'
	WHERE SNO IN (SELECT SNO FROM PersonDetails_Copy WHERE Qualification = 'MCA')
GO
SELECT * FROM PersonDetails


SELECT 
SNO
,FullName
,Qualification
,Stream
,PassedOutYear
,University
,EmailID
,LocationCity
INTO PersonDetails_Copy2
FROM PersonDetails

SELECT * FROM PersonDetails_Copy2 