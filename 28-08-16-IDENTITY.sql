--IDENTITY Property Exclusive notes

SELECT * FROM EmpDetails_WithConstraints

DELETE  FROM EmpDetails_WithConstraints WHERE EMPID=4

SET IDENTITY_INSERT  EmpDetails_WithConstraints ON

	INSERT INTO EmpDetails_WithConstraints 
	(
	 EMPID
	,FirstName
	,LastName
	,DOB
	,Mobile
	,emailID
	,AddressLine1
	,AddressLine2
	,PANCard
	,LocationCity
	,Qualification
	)
	SELECT '4','Sarada2 M','B2','1990-01-18 00:00:00.000','9845091234','Saradadfbdcdb.nit005@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB0001A','Bangalore','BTech'

SET IDENTITY_INSERT  EmpDetails_WithConstraints OFF


SELECT * FROM EmpDetails_WithConstraints

-------------------------------------------
SET IDENTITY_INSERT  EmpDetails_WithConstraints ON

	UPDATE EmpDetails_WithConstraints 
	SET EMPID = 140
	WHERE EMPID = 5

SET IDENTITY_INSERT  EmpDetails_WithConstraints OFF

--To track the recently added identity value

SELECT @@IDENTITY
------------------------------------------------------------
SET IDENTITY_INSERT  EmpDetails_WithConstraints ON

	INSERT INTO EmpDetails_WithConstraints 
	(
	 EMPID
	,FirstName
	,LastName
	,DOB
	,Mobile
	,emailID
	,AddressLine1
	,AddressLine2
	,PANCard
	,LocationCity
	,Qualification
	)
	SELECT '5','Sarada3 M','B3','1990-01-18 00:00:00.000','9845099999','Saradaddasfddffbdcdb.nit005@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB7771A','Bangalore','BTech'

	SELECT @@IDENTITY
	SELECT SCOPE_IDENTITY()
	SELECT IDENT_CURRENT('EmpDetails_WithConstraints')

SET IDENTITY_INSERT  EmpDetails_WithConstraints OFF
------------------------------
--SET IDENTITY_INSERT  EmpDetails_WithConstraints ON

	INSERT INTO EmpDetails_WithConstraints 
	(
	 --EMPID
	FirstName
	,LastName
	,DOB
	,Mobile
	,emailID
	,AddressLine1
	,AddressLine2
	,PANCard
	,LocationCity
	,Qualification
	)
	SELECT 'Sarada5 M','B5','1990-01-18 00:00:00.000','7845099999','Shjkhjsfddffbdcdb.nit005@gmail.com','Bangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, BangaloreBangalore, Bangalore','Bangalore,KA','AAABB5551A','Bangalore','BTech'

	SELECT @@IDENTITY
	SELECT SCOPE_IDENTITY()
	SELECT IDENT_CURRENT('EmpDetails_WithConstraints')
	SELECT MAX(EMPID) FROM EmpDetails_WithConstraints
GO 
	SELECT SCOPE_IDENTITY()
GO

--SET IDENTITY_INSERT  EmpDetails_WithConstraints OFF

SELECT * FROM EmpDetails_WithConstraints

-------Notes
--Each time you make a failure INSERT attempt on a IDENTITY existance table,
--it Identity value will be reserved for that specific failure attempt record(s).
--As a result, there will be gaps in the continuty of IDENTITY column
--Further, we can plan to overcome this discontinuty(filling gaps) we need to 
--insert the Identity values explicitly, by flipping the default IDENTITY_INSERT 
--property from OFF to ON, Example:

SET IDENTITY_INSERT <IdentityTableNameHere> ON

	--Do exlicit inserton of Identity here

SET IDENTITY_INSERT <IdentityTableNameHere> OFF

--Tracking the recently Appended Identity value is also very very important. We do have
--the following rechniques to track the recent Idntities.

--1)***@@IDENTITY Global varaible--SELECT/PRINT @@IDENTITY  
	This global variable is capable of maintaining the recently appended Identty 
	value, throught the current session(query window), across all the Blocks

--2)*SCOPE_IDENTITY() System defined function--SELECT /PRINT SCOPE_IDENTITY() 
	This System defined function is capable of maintaining the recently appended Identty 
	value, of a current session(query window), within the prsent Block scope.

--3)**IDENT_CURRENT()  System defined function--SELECT /PRINT IDENT_CURRENT()  
	Irrespective of Sessions and blocks, always this System defined function will 
	return the maximum Identity value that you have acheived in forward diretion.

SELECT * INTO EmpDetails_WithConstraints_Backup FROM EmpDetails_WithConstraints

SELECT * FROM EmpDetails_WithConstraints_Backup

ALTER TABLE EmpDetails_WithConstraints_Backup
DROP COLUMN EmpID

ALTER TABLE EmpDetails_WithConstraints_Backup
ADD EmpID INT IDENTITY(1,1) PRIMARY KEY

