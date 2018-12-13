
--ETL Monitoring query
SELECT 
 B.BatchID
,B.BatchStartTime
,B.BatchEndTime
,B.ElapsedTime AS BatchElapsedTime 
,B.MachineName
,B.PackageName
,B.UserName
,T.TaskID
,T.TaskStartTime
,T.SourceAddress
,T.DestinationAddress
,T.TaskEndTime
,T.TaskElapsedTime AS TaskElapsedTime
,T.ExtractedRows
,T.LoadedRows
,T.RejectedRows
FROM SSISBatch B
INNER JOIN SSISTask T
ON B.BatchID = T.BatchID
WHERE B.BatchID = (SELECT MAX(BatchID) FROM SSISBatch)


SELECT * FROM Src_Staging.dbo.Employees

select * from [dbo].[Package3_DataFLowTask_Ex1]

--SELECT * FROM SSISTask

SELECT * FROM EmployeeDim


SELECT * FROM EmployeeDim WHERE  LoadedDate BETWEEN '2016-10-08 00:00:00.000' AND '2016-10-08 23:59:59.997'


SELECT * FROM  Dest_Staging.dbo.EmployeeDim 