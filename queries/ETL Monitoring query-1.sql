
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



--SELECT * FROM SSISTask