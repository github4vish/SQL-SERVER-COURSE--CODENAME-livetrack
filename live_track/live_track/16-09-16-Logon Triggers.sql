--Logon Triggers
--Ex1: Create a LOgon trigger, to restrict the logins during peak hours for "MSBI-PC" Instance.
--Restrict all the logins except Admin(MSBI-PC\JohnGanta) during 6:30 AM and 8:30 AM

CREATE TRIGGER Login_Prevent_MSBIPC
ON ALL SERVER
FOR Logon
AS
BEGIN 
	
	DECLARE  @LoginUser VARCHAR(100) = SYSTEM_USER
			,@Time  TIME = GETDATE()
	IF( @LoginUser<>'MSBI-PC\JohnGanta' AND  @Time BETWEEN '06:30:00.0000000' AND '08:29:59.9999999')
	BEGIN
		ROLLBACK
	END
	ELSE 
	BEGIN
		COMMIT
	END
END




  