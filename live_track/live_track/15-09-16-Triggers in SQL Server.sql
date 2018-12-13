--Triggers in SQL Server

--Introduction to XML datatypes

	DECLARE @ExXML XML
	SET @ExXML = '<XML>Hi Welcome to XML!</XML>'
	SELECT @ExXML 


	SELECT * FROM EmpDetails

	--Example XML data representation in elements

		<EmpTab>
		<row>
			<EmpID>1</EmpID>
			<FirstName>John</FirstName>
			:
			:
			:
		</row>
		<row>
			<EmpID>2</EmpID>
			<FirstName>THrinadth</FirstName>
			:
			:
			:
		</row>




		</EmpTab>
		<DeptTab>
	
		</DeptTab>

	---
	--Example XML data representation in XML Attributes

		<EmpTab>
			<row EmpID = "1",FIrstName = "John"............=""/>
			<row EmpID = "2",FIrstName = "Xyz............/>"
		</EmpTab>
--Generating XML data in attributes


	DECLARE @ExXML XML
	SET @ExXML = 

	(
	 
	 SELECT * FROM EmpDetails FOR XML AUTO
	 	
	)

	SELECT @ExXML 
--Generating XML data in XML elements

	DECLARE @ExXML XML
	SET @ExXML = 

	(
	 
	 SELECT * FROM EmpDetails FOR XML PATH
	 	
	)

	SELECT @ExXML 

---General syntax

CREATE TRIGGER <TriggerName>
ON <TableName/DATABASE/SERVER>
FOR/AFTER/INSTEAD OF
<DML/DDL>
AS
BEGIN
	Triggering & Auditing statements here


END
--Ex1: Create a Delete trigger against the table EMPDetails. Prevent all the deletions.

;

GO 

DROP TRIGGER Del_Prevent_Trigger

create TRIGGER Del_Prevent_Trigger_EmpDetails 
ON EmpDetails
FOR
DELETE 
AS 
BEGIN
	
	
	SELECT * FROM DELETED FOR XML PATH

	COMMIT
	
END

SP_HELPTRIGGER EmpDetails

SP_HELPTEXT Del_Prevent_Trigger_EmpDetails


SELECT * FROM EmpDetails

DELETE FROM EmpDetails
WHERE EmpID = 6

----------------
CREATE TABLE TriggerAudits
(
	 ID INT IDENTITY(1,1)
	,SPID INT
	,UserName VARCHAR(100)
	,MachineName VARCHAR(100)
	,InstanceName VARCHAR(100)
	,DatabaseName VARCHAR(100)
	,DBObjectName VARCHAR(100)
	,DateAudited DATETIME
	,ActionType VARCHAR(100)
	,ActionSubType VARCHAR(100)
	,ActionStatus VARCHAR(100)
	,InsertedVolume XML
	,DeletedVolume XML
	,RowsInserted BIGINT
	,RowsDeleted BIGINT
	,RowsUpdated BIGINT
)

