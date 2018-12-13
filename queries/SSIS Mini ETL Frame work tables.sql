--SSIS Mini ETL Frame work tables
DROP TABLE SSISBatch

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

go


ALTER PROCEDURE InsertSSISBatch
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



go
ALTER PROCEDURE UpdateSSISBatch
(
	 @BatchID INT
	,@ExecutionStatus VARCHAR(100)
	,@BatchEndTime DATETIME
)
AS
BEGIN
	
	DECLARE @BatchStartTime DATETIME
	SELECT @BatchStartTime = BatchStartTime FROM SSISBatch 
	WHERE BatchID = @BatchID
	
	UPDATE SSISBatch
	SET 
	  ExecutionStatus = @ExecutionStatus
	 ,BatchEndTime = @BatchEndTime
	 ,ElapsedTime = dbo.DateAndTimeNarration(@BatchStartTime,@BatchEndTime)
	WHERE BatchID = @BatchID

END


go


CREATE TABLE RejectedRecordsTable
(
	 BatchID INT 
	,TaskID INT
	,ErrorRow VARCHAR(MAX) 
	,ErrorCode INT
	,ErrorColumn INT
)



CREATE TABLE SSISTask
(
	 TaskID	INT  IDENTITY(1,1) PRIMARY KEY
	,BatchID INT FOREIGN KEY REFERENCES  SSISBatch(BatchID)	
	,TaskStartTime	DATETIME
	,TaskEndTime	DATETIME	
	,TaskElapsedTime VARCHAR(MAX)	
	,ExecutionStatus VARCHAR(100)	 	
	,SourceType VARCHAR(2000)	 	
	,DestinationType VARCHAR(2000)	 		
	,SourceAddress VARCHAR(2000)	 		
	,DestinationAddress VARCHAR(2000)	 		
	,ExtractedRows BIGINT	
	,LoadedRows BIGINT	
	,RejectedRows BIGINT
)
GO

CREATE PROCEDURE InsertSSISTask
(
 @TaskID INT OUTPUT
,@BatchID INT
,@TaskStartTime DATETIME
,@TaskEndTime DATETIME
,@TaskElapsedTime VARCHAR(MAX)
,@ExecutionStatus VARCHAR(100)
,@SourceType VARCHAR(100)
,@DestinationType VARCHAR(100)
,@SourceAddress  VARCHAR(MAX)
,@DestinationAddress VARCHAR(MAX)
,@ExtractedRows BIGINT
,@LoadedRows BIGINT
,@RejectedRows BIGINT
)
AS 
BEGIN

	INSERT INTO SSISTask
	(
	 BatchID
	,TaskStartTime
	,TaskEndTime
	,TaskElapsedTime
	,ExecutionStatus
	,SourceType
	,DestinationType
	,SourceAddress
	,DestinationAddress
	,ExtractedRows
	,LoadedRows
	,RejectedRows
	)

	SELECT 
	 @BatchID
	,@TaskStartTime
	,@TaskEndTime
	,@TaskElapsedTime
	,@ExecutionStatus
	,@SourceType
	,@DestinationType
	,@SourceAddress
	,@DestinationAddress
	,@ExtractedRows
	,@LoadedRows
	,@RejectedRows

		SELECT @TaskID = @@IDENTITY

END

GO

CREATE PROCEDURE UpdateSSISTask
(
	 @TaskID INT
	,@BatchID INT
	,@TaskEndTime DATETIME
	,@ExtractedRows BIGINT
	,@LoadedRows BIGINT 
	,@RejectedRows BIGINT
	,@ExecutionStatus VARCHAR(MAX)
)
AS 
BEGIN
	
	DECLARE @TaskStartTime VARCHAR(MAX)
	SELECT  @TaskStartTime  = TaskStartTime FROM SSISTask 
	WHERE BatchID = @BatchID
	AND TaskID = @TaskID

	UPDATE SSISTask
	SET 
	 TaskEndTime = @TaskEndTime 
	,TaskElapsedTime = dbo.DateAndTimeNarration(@TaskStartTime,@TaskEndTime)
	,ExtractedRows = @ExtractedRows 
	,LoadedRows = @LoadedRows 
	,RejectedRows = @RejectedRows 
	,ExecutionStatus = @ExecutionStatus 
	WHERE BatchID = @BatchID
	AND TaskID = @TaskID
END

go

--EXECUTE UpdateSSISTask
-- ?--@TaskID
--,?--@BatchID
--,?--@TaskEndTime
--,?--@ExtractedRows
--,?--@LoadedRows
--,?--@RejectedRows
--,'Success'--@ExecutionStatus


--SELECT * FROM RejectedRecordsTable