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
		--UK will allow ONE NULL value, wereas PK will not allow even a single NULL value.
		--When we create a UK it also creates a *Non Clustered Index(NCX), whereas incase of 
		--PK it is a CX.
NOT NULL--Will not allow any NULL values, shoul enter NON NULL values
CHECK--Will restrict the input values to be satisfying a range/list
--Ex1: person age should be B/W 20-35 Or DOB range Should be B/W '1975-01-01' AND '1995-12-31'
--Ex2: Emp Qualification should be on among 
--('BE','Btech','MCA','MBA','MTech','Bsc','BCA','BCom','MCom')
DEFAULT--Deafulting a column value, if the column is ignored from insertion.
--Ex: We can set the default LocationCity field as 'Bangalore'/'Pune'

IDENTITY--Will generate auto incremented numbers, having a SEED and ICREMENTOR; so that, we need not
--to enter values explicitly for this column. Only ONE Identity property can be defined per table.  
--Ex: EmpID, set 1 as SEED and 1 as INCREMENTOR, we will getting the EMPID Series
--as 1,2,3,4,5,6,7.....

--Practicles on Constraints
--COnstraints can be added to the tables in two ways. 
	--a)During the table defination
	--b)After table defination
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



