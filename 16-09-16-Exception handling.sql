--Exception handling 
SELECT * FROM ABC

  Msg 208 --1 - 50000(10463 Messages for englosh laguage)
, Level 16 -- 1- 25 (1-10 low(warnings) 11-16 medium 17-25 High)
, State 1 --0,1,2,3
, Line 2
Invalid object name 'ABC'.

SELECT * FROM sys.messages 
WHERE language_id = 1033
AND message_id = 208

--Ex1, coverting the system defined run time errors to warnings

BEGIN TRY
	DECLARE @A INT,@B INT , @C INT

	SET @A = 40
	SET @B = 0

	SET  @C = @A/@B

	SELECT @C
END TRY
BEGIN CATCH
	PRINT 'Check the denominator value, it must be no-zero!'
	PRINT 'ERROR_MESSAGE:'+ERROR_MESSAGE()
	PRINT 'ERROR_NUMBER:'+CAST(ERROR_NUMBER() AS VARCHAR(10))
	PRINT 'ERROR_PROCEDURE:'+ISNULL(ERROR_PROCEDURE(),'')
	PRINT 'ERROR_STATE:'+CAST(ERROR_STATE() AS VARCHAR(10))
	PRINT 'ERROR_SEVERITY:'+CAST(ERROR_SEVERITY()AS VARCHAR(10))
	PRINT 'ERROR_LINE:'+CAST(ERROR_LINE()AS VARCHAR(10))
END CATCH

--Ex2, Regestering a user defined error message and forcing the system to throw this error message

--Step1(Add the user defined message to the sys.messages)
EXEC SP_ADDMESSAGE 50001,16,'Check the denominator value, it must be no-zero!'
  
--Step2 Call RAISERROR method supplying the user defined error number inside the CATCH Block


BEGIN TRY
	DECLARE @A INT,@B INT , @C INT

	SET @A = 40
	SET @B = 0

	SET  @C = @A/@B

	SELECT @C
END TRY
BEGIN CATCH
	RAISERROR(50001,16,1)--RAISERROR('<Custom messsage here>',16,1)
END CATCH




