--SSIS Mini ETL Frame work tables
--DROP TABLE SSISBatch

CREATE TABLE SSISBatch							
(
 BatchID INT IDENTITY(1,1)	 PRIMARY KEY
,MachineName VARCHAR(100)	
,UserName VARCHAR(100)	
,PackageName VARCHAR(100)	
,BatchStartTime DATETIME	
,BatchEndTime DATETIME	
,ElapsedTime  VARCHAR(MAX)	
,ExecutionStatus  VARCHAR(100)
)

CREATE TABLE SSISTask											
(
	 TaskID	INT  IDENTITY(1,1) PRIMARY KEY
	,BatchID INT FOREIGN KEY REFERENCES  SSISBatch(BatchID)	
	,TaskStartTime	DATETIME
	,TaskEndTime	DATETIME	
	,ElapsedTime VARCHAR(MAX)	
	,ExecutionStatus VARCHAR(100)	 	
	,SourceType VARCHAR(2000)	 	
	,DestinationType VARCHAR(2000)	 		
	,SourceAddress VARCHAR(2000)	 		
	,DestinationAddress VARCHAR(2000)	 		
	,ExtractedRows BIGINT	
	,LoadedRows BIGINT	
	,RejectedRows BIGINT
)

CREATE PROCEDURE InsertSSISBatch
(
 @BatchID INT OUTPUT
,@MachineName VARCHAR(100)	
,@UserName VARCHAR(100)	
,@PackageName VARCHAR(100)	
,@BatchStartTime DATETIME	
,@BatchEndTime DATETIME	
,@ElapsedTime  VARCHAR(MAX)	
,@ExecutionStatus  VARCHAR(100)
)
AS 
BEGIN
		INSERT INTO SSISBatch
		(
		 MachineName
		,UserName
		,PackageName
		,BatchStartTime
		,BatchEndTime
		,ElapsedTime
		,ExecutionStatus
		)
	SELECT 
		 @MachineName
		,@UserName
		,@PackageName
		,@BatchStartTime
		,@BatchEndTime
		,@ElapsedTime
		,@ExecutionStatus

	SELECT @BatchID = @@IDENTITY

END


CREATE TABLE RejectedRecordsTable
(
	 BatchID INT 
	,ProcessID INT
	,ErrorRow VARCHAR(MAX) 
	,ErrorCode INT
	,ErrorColumn INT
)

--SELECT * FROM RejectedRecordsTable