

--Batch and task open & close statements


EXEC InsertSSISBatch
 ? OUTPUT
,?--@MachineName
,?--@UserName
,?--@PackageName
,?--@BatchStartTime
,NULL --@BatchEndTime
,NULL --@ElapsedTime
,'Started'--  @ExecutionStatus

SELECT * FROM SSISBatch

TRUNCATE TABLE SSISBatch

DELETE FROM SSISBatch


SELECT * FROM SSISTask

SELECT * FROM SSIS





EXECUTE InsertSSISTask
 ?   OUTPUT
,?
,?
,NULL--@TaskEndTime
,NULL--@ElapsedTime
,'Started'--@ExecutionStatus
,'Flat file'--@SourceType
,'RDBMS'--@DestinationType
,?--@SourceAddress
,?--@DestinationAddress
,?--@ExtractedRows
,?--@LoadedRows
,?--@RejectedRows

