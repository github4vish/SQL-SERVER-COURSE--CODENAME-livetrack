--Transactions in SQL Server
	--SELECT @@SPID

	--SP_WHO2

	--DBCC INPUTBUFFER(60)

	--KILL 60
--Implicit(System defined) Transactions in SQL Server
--For DML commands(INSERT,UPDATE,DELETE, MERGE) we can see the presence of Implicit transactions.
--By chance, if cancel these commands in B/W, the entire operation(s) will be rolled back from the
--current session.

SELECT 
CAST(EmpID AS VARCHAR(10)) AS EmpID
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
INTO Bulk_EmpDetails_Ex
FROM EmpDetails_WithConstraints_Backup

/*
--Implicit(System defined) Transactions in SQL Server

	INSERT INTO Bulk_EmpDetails_Ex
	SELECT * FROM Bulk_EmpDetails_Ex

	SP_SPACEUSED Bulk_EmpDetails_Ex

	SELECT * INTO Bak_Bulk_EmpDetails_Ex FROM Bulk_EmpDetails_Ex --00:000:51 Seconds

	--SELECT 9608/1024.00

	DELETE FROM Bulk_EmpDetails_Ex--Rollback delete from 11th second 00:00:26 seconds

	UPDATE Bulk_EmpDetails_Ex
	SET EMPID = 100
	WHERE EMPID = 1

	UPDATE Bulk_EmpDetails_Ex
	SET EMPID = 1000


	--SELECT * FROM Bulk_EmpDetails_Ex WHERE EMPID = 1000

	---
	TRUNCATE TABLE Bak_Bulk_EmpDetails_Ex 

	SP_SPACEUSED Bak_Bulk_EmpDetails_Ex

	INSERT INTO Bak_Bulk_EmpDetails_Ex
	SELECT * FROM Bulk_EmpDetails_Ex

-- Explicit(User Defined) Transactions

--Ex1

	BEGIN TRANSACTION T1

		TRUNCATE TABLE Bak_Bulk_EmpDetails_Ex

	ROLLBACK TRANSACTION T1
	
--Ex2

	PRINT @@TRANCOUNT

	BEGIN TRANSACTION T1
		PRINT @@TRANCOUNT
		BEGIN TRANSACTION T2
			PRINT @@TRANCOUNT
			DELETE FROM Bulk_EmpDetails_Ex 
			WHERE EMPID = 12
		COMMIT TRANSACTION T2
		PRINT @@TRANCOUNT
	ROLLBACK TRANSACTION T1

	PRINT @@TRANCOUNT

	--SELECT * FROM Bulk_EmpDetails_Ex 		WHERE EMPID = 12
--Ex3

	BEGIN TRANSACTION T1
		BEGIN TRANSACTION T2

			TRUNCATE TABLE 	Bulk_EmpDetails_Ex 		
			SAVE TRANSACTION T2
	
		ROLLBACK TRANSACTION T2

	ROLLBACK TRANSACTION T1

	--SELECT * FROM Bulk_EmpDetails_Ex 		WHERE EMPID = 12
	--SP_SPACEUSED Bulk_EmpDetails_Ex

--Ex4: Crteate an ATM Money Withdrawl scenario with Explicit transactions, by conditionally 
--committing/Rolling back the transaction based on the available funds in the account.


CREATE TABLE AccountDetails
(
	 AccountNumber BIGINT
	,CustomerName VARCHAR(100)
	,Balance MONEY
)

INSERT INTO AccountDetails
SELECT 111111,'Manoj Kumar Reddy T',20000 UNION ALL
SELECT 222222,'Mouli. K',30000 UNION ALL
SELECT 333333,'John Babu G',35000 UNION ALL
SELECT 444444,'Gangaraju D',40000 UNION ALL
SELECT 555555,'Trinadh Babu B',25000

SELECT * FROM AccountDetails
---------------------------------




BEGIN TRANSACTION 
	DECLARE 
	 @AccountNumber BIGINT
	,@CustomerName VARCHAR(100)
	,@Balance MONEY
	,@WithdralAmout MONEY

	SET @AccountNumber = 222222
	SET @WithdralAmout = 5000

	SELECT 
	 @CustomerName  = CustomerName 
	,@Balance = Balance
	FROM AccountDetails
	WHERE AccountNumber = @AccountNumber

	PRINT 'Welcome Mr. '+@CustomerName+'!'
	PRINT 'Your available balance before transaction:'+CAST(@Balance AS VARCHAR(100))

		UPDATE AccountDetails
		SET Balance = Balance - @WithdralAmout
		WHERE AccountNumber = @AccountNumber

	SELECT 
	 @Balance = Balance
	FROM AccountDetails
	WHERE AccountNumber = @AccountNumber

	IF(@Balance <0)
	BEGIN
		ROLLBACK 
		PRINT 'Transaction failed due to insufficient balance, try a differant amount!'
	END
	ELSE IF(@Balance >=0)
	BEGIN
		COMMIT
		PRINT 'Transaction is successful!!'
	END

	SELECT 
	 @Balance = Balance
	FROM AccountDetails
	WHERE AccountNumber = @AccountNumber

	PRINT 'Your available balance after transaction:'+CAST(@Balance AS VARCHAR(100))

	*/
---Fitting the above approach to an SP
go

create PROCEDURE ATM_USP
(
	 @AccountNumber BIGINT
	,@WithdralAmout MONEY

	,@message varchar(max) output
)
AS 
BEGIN
	BEGIN TRANSACTION 
		DECLARE 
		 @CustomerName VARCHAR(100)
		,@Balance MONEY

		SELECT 
		 @CustomerName  = CustomerName 
		,@Balance = Balance
		FROM AccountDetails
		WHERE AccountNumber = @AccountNumber

		PRINT 'Welcome Mr. '+@CustomerName+'!'
		PRINT 'Your available balance before transaction:'+CAST(@Balance AS VARCHAR(100))

			UPDATE AccountDetails
			SET Balance = Balance - @WithdralAmout
			WHERE AccountNumber = @AccountNumber

		SELECT 
		 @Balance = Balance
		FROM AccountDetails
		WHERE AccountNumber = @AccountNumber

		IF(@Balance <0)
		BEGIN
			ROLLBACK 
			PRINT 'Transaction failed due to insufficient balance, try a differant amount!'
		END
		ELSE IF(@Balance >=0)
		BEGIN
			COMMIT
			PRINT 'Transaction is successful!!'
		END

		SELECT 
		 @Balance = Balance
		FROM AccountDetails
		WHERE AccountNumber = @AccountNumber

		PRINT 'Your available balance after transaction:'+CAST(@Balance AS VARCHAR(100))

END
--EXEC ATM_USP 333333,5000


create PROCEDURE ATM_USP1
(
	 @AccountNumber BIGINT
	,@WithdralAmout MONEY

	,@message varchar(max) output
)
AS 
BEGIN
	BEGIN TRANSACTION 
		DECLARE 
		 @CustomerName VARCHAR(100)
		,@Balance MONEY

		SELECT 
		 @CustomerName  = CustomerName 
		,@Balance = Balance
		FROM AccountDetails
		WHERE AccountNumber = @AccountNumber

		set @message= ' \n  Welcome Mr. '+@CustomerName+'! \n Your available balance before transaction:'+CAST(@Balance AS VARCHAR(100))

			UPDATE AccountDetails
			SET Balance = Balance - @WithdralAmout
			WHERE AccountNumber = @AccountNumber

		SELECT 
		 @Balance = Balance
		FROM AccountDetails
		WHERE AccountNumber = @AccountNumber

		IF(@Balance <0)
		BEGIN
			ROLLBACK 
			set @message= @message +' \n Transaction failed due to insufficient balance, try a differant amount!'
		END
		ELSE IF(@Balance >=0)
		BEGIN
			COMMIT
			set @message= @message+ '\n Transaction is successful!!'
		END

		SELECT 
		 @Balance = Balance
		FROM AccountDetails
		WHERE AccountNumber = @AccountNumber

		set @message=@message+ '\n Your available balance after transaction:'+CAST(@Balance AS VARCHAR(100))

END

--Transaction islocation levels in SQL Server

--SPID 56
	BEGIN TRANSACTION 
		UPDATE EmpTab
		SET EmpLastName = 'AA' 
		WHERE EmpID = 10

	--WAITFOR DELAY '00:00:10'

	ROLLBACK
	--COMMIT

--SPID 57

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

		SELECT * FROM EmpTab WHERE EmpID = 10

	SET TRANSACTION ISOLATION LEVEL READ COMMITTED

--SPID 58

	SELECT * FROM EmpTab WITH (NOLOCK)  WHERE EmpID = 10

	--------------

	
		SELECT 
		 E.EmpFirstName +' '+E.EmpLastName AS EmpFullName
		,ISNULL(M1.EmpFirstName +' '+ M1.EmpLastName,'N/A') AS LevelOneManagerFullName
		,ISNULL(M2.EmpFirstName +' '+ M2.EmpLastName,'N/A') AS LevelTwoManagerFullName
		,ISNULL(M3.EmpFirstName +' '+ M3.EmpLastName,'N/A') AS LevelThreeManagerFullName
		,ISNULL(M4.EmpFirstName +' '+ M4.EmpLastName,'N/A') AS LevelFourManagerFullName
		FROM EmpDetails E (NOLOCK)
		LEFT OUTER JOIN EmpDetails M1 (NOLOCK)
		ON E.ManagerID = M1.EmpID 
		LEFT OUTER JOIN EmpDetails M2 (NOLOCK)
		ON M1.ManagerID = M2.EmpID 
		LEFT OUTER JOIN EmpDetails M3 (NOLOCK)
		ON M2.ManagerID = M3.EmpID
		LEFT OUTER JOIN EmpDetails M4 (NOLOCK)
		ON M3.ManagerID = M4.EmpID
