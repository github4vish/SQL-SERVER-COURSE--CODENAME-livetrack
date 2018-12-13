--Time differance narration function
--SELECT DATEDIFF(MS,GETDATE(),GETDATE()+1)

--01:10:20 Seconds

--1990-01-01

--25 years, 3 months 2 days

CREATE FUNCTION dbo.TimeDifferance
(
	 @FromTime DATETIME
	,@ToTime DATETIME
)
RETURNS VARCHAR(500)
AS
BEGIN
	
	DECLARE 
	SELECT CAST(@EndTime - @StartTime  AS TIME)





	RETURN( @ElapsedTime)
 END

 