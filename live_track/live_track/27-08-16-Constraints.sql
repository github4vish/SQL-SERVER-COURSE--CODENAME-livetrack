--Constraints in SQL Server
--Def: A Constraint is a condition, that improves the domain data quality in
--a table. We  have the following types of constraints in SQL Server

PRIMARY KEY --The column(s) value should not be NULL and should not have duplications. 
--If a PK is defined on multiple columns combination, is known as a COMPOSITE KEY. In case of 
--Composite key, the individual columns of the key should not have NULLs and also, the combination shlud
--not repeat. 
--Max No.of PK allowed per table is Only ONE.
--When we create a PK on a table, it also creates a *Clustered Index(CX) on the PK associated column(s)

FOREIGN KEY--Is also known as referential integity. Meaning, a child/dependant table(FK table) will be expeting 
--a parent/master table(PK table's) PRIMARY KEY value existency. 
--In another words, we can also say, the pre requisite for a FK should be a PK.
--*There can be more than one FK can exists per table.
UNIQUE KEY--It makes sure that, column(s) values are unique in combination. Will not allow the dupliates like PK, 
--but only the differance B/W the PK and UK is
','','--UK will allow ONE NULL value, wereas PK will not allow even a single NULL value.
','','--When we create a UK it also creates a *Non Clustered Index(NCX), whereas incase of 
','','--PK it is a CX.
NOT NULL--Will not allow any NULL values, shoul enter NON NULL values
CHECK--Will restrict the input values to be satisfying a range/list
--Ex1: person age should be B/W 20-35 Or DOB range Should be B/W '1975-01-01' AND '1995-12-31'
--Ex2: Emp Qualification should be one among 
--('BE','Btech','MCA','MBA','MTech','Bsc','BCA','BCom','MCom')
DEFAULT--Deafulting a column value, if the column is ignored from insertion.
--Ex: We can set the default LocationCity field as 'Bangalore'/'Pune'

IDENTITY--Will generate auto incremented numbers, having a SEED and ICREMENTOR; so that, we need not
--to enter values explicitly for this column. Only ONE Identity property can be defined per table.  
--Ex: EmpID, set 1 as SEED and 1 as INCREMENTOR, we will getting the EMPID Series
--as 1,2,3,4,5,6,7.....

--Practicles on Constraints
--COnstraints can be added to the tables in two ways. 
','--a)During the table defination
','--b)After table defination
--General syntax(During the table defination)
<CoulmnName> DataType[<Size>] [CONSTRAINT <ConstraintName>] Constraint_Type 
--OR 
<CoulmnName> DataType[<Size>] Constraint_Type  
--Ex:
CREATE TABLE EmpDetails_WithConstraints
(
 EMPID INT IDENTITY(1,1) PRIMARY KEY
,FirstName VARCHAR(100) CONSTRAINT EmpDetails_WithConstraints_FirstName_NOT_NULL NOT NULL
,LastName  VARCHAR(100) 
,DOB DATETIME CHECK(DOB BETWEEN '1975-01-01' AND '1995-12-31')
,Mobile BIGINT UNIQUE
,emailID VARCHAR(100) UNIQUE
,AddressLine1 VARCHAR(500) CONSTRAINT EmpDetails_WithConstraints_AddressLine1_Length CHECK(LEN(AddressLine1) BETWEEN 50 AND 500)
,AddressLine2  VARCHAR(500)  NOT NULL
,PANCard VARCHAR(10) CHECK(LEN(PANCard) = 10)
,LocationCity VARCHAR(100) DEFAULT 'Bangalore'
)

INSERT INTO EmpDetails_WithConstraints
(
 FirstName
,LastName
,DOB
,Mobile
,emailID
,AddressLine1
,AddressLine2
,PANCard
--,LocationCity
)
--SELECT 'Brahma','A','1990-01-01','9845012345','brahma365msbi@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1234A','Hyderabad' 

SELECT 'Manoj Kumar Reddy T','B','1990-01-02','9845023456','manojreddy.thallapalli@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1235A' UNION ALL
SELECT 'Mouli. K','C','1990-01-03','9845034567','kmouli99@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1236A'


SELECT * FROM EmpDetails_WithConstraints
-----------------------
INSERT INTO EmpDetails_WithConstraints
(
 FirstName
,LastName
,DOB
,Mobile
,emailID
,AddressLine1
,AddressLine2
,PANCard
--,LocationCity
)
--SELECT 'Brahma','A','1990-01-01','9845054321','brahma365slvdjklmsbi@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1234A','Hyderabad' 
SELECT 'Manoj Kumar Reddy T','B','1990-01-02','9845023000','manojreddy.thallxcbcvcbapalli@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1235A' UNION ALL
SELECT 'Mouli. K','C','1990-01-03','9845034111','kmoulicv cv 99@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1236A'


INSERT INTO EmpDetails_WithConstraints
(
 FirstName
,LastName
,DOB
,Mobile
,emailID
,AddressLine1
,AddressLine2
,PANCard
,LocationCity
)
SELECT 'John Babu G','A','1990-01-04','9845045678','johnganta88@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1237A','Bangalore' UNION ALL 
SELECT 'Gangaraju D','B','1990-01-05','9845056789','gangarajud906@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1238A','Hyderabad' UNION ALL 
SELECT 'Trinadh Babu B','C','1990-01-06','9845067900','b.trinadh258@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1239A','Bangalore' UNION ALL 
SELECT 'Renuka G','A','1990-01-07','9845079011','renukamcasvec@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1240A','Hyderabad' UNION ALL 
SELECT 'Sarada M','B','1990-01-08','9845090122','Sarada.nit005@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1241A','Bangalore' UNION ALL 
SELECT 'Saikeerthi','C','1990-01-09','9845101233','sai.keerthi32@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1242A','Bangalore' UNION ALL 
SELECT 'B suman','A','1990-01-10','9845112344','bsuman993@outlook.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1243A','Bangalore' UNION ALL 
SELECT 'NARAYANA REDDY M','B','1990-01-11','9845123455','mnarayanardy@gmail. com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1244A','Hyderabad' UNION ALL 
SELECT 'Penchalareddy M','C','1990-01-12','9845134566','penchal483.up@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1245A','Bangalore' UNION ALL 
SELECT 'Viswanath M','A','1990-01-13','9845145677','viswanath549@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB1246A','Unknown' 
 
----------
INSERT INTO EmpDetails_WithConstraints
(
FirstName
,LastName
,DOB
,Mobile
,emailID
,AddressLine1
,AddressLine2
,PANCard
,LocationCity
)
SELECT 'kajdshvkjhadvjkh',NULL,'1990-01-04','9845045444','johngdffbxcvxcanta88@gmail.com','jhjhjedrfbadfbdfbdcfbsdfbsrttefrtnbrtbhrtgbretberbvedwrgverge','Bangalore,KA','AAABB1237A','Bangalore' 

EmpDetails_WithConstraints_AddressLine1_Length

SELECT * FROM sys.sysconstraints

SELECT * FROM sys.key_constraints

SP_HELPCONSTRAINT EmpDetails_WithConstraints
---------------

--TRUNCATE TABLE EmpDetails_WithConstraints

ALTER TABLE EmpDetails_WithConstraints
ADD Qualification VARCHAR(100) CONSTRAINT CHECK_Qualification CHECK(Qualification IN ('BE','Btech','MCA','MBA','MTech','Bsc','BCA','BCom','MCom'))


ALTER TABLE EmpDetails_WithConstraints
DROP COLUMN Qualification 



SELECT * FROM EmpDetails_WithConstraints


UPDATE EmpDetails_WithConstraints
SET Qualification = 'BE'
WHERE EMPID = 1

UPDATE EmpDetails_WithConstraints
SET Qualification = 'BTech'
WHERE EMPID = 2

ALTER  EmpDetails_WithConstraints
SET Qualification = 'BE'
WHERE EMPID = 1

ALTER TABLE EmpDetails_WithConstraints
ALTER COLUMN PANCard CHAR(10) --CONSTRAINT UNIQUE_PAN UNIQUE

ALTER TABLE EmpDetails_WithConstraints
ADD AADHARCard CHAR(10) CONSTRAINT UNIQUE_Aashart UNIQUE


--How to add constraints post the table structure, post the data entry

ALTER TABLE EmpDetails_WithConstraints
ADD Qualification VARCHAR(100) CONSTRAINT CHECK_Qualification CHECK(Qualification IN ('BE','Btech','MCA','MBA','MTech','Bsc','BCA','BCom','MCom'))

ALTER TABLE [dbo].[EmpDetails_WithConstraints] 
ADD CONSTRAINT UNIQUE_PAN UNIQUE (PANCard)

SELECT * FROM EmpDetails_WithConstraints

--DELETE FROM EmpDetails_WithConstraints
--WHERE EMPID IN(6,11,26,10)


