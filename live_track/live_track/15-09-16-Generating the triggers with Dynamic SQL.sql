--Generating the triggers with Dynamic SQL statements

DECLARE @TablesList TABLE
(
	 TableID INT IDENTITY(1,1)
	,TableName VARCHAR(100)
)

INSERT INTO @TablesList (TableName)
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES 

--SELECT * FROM @TablesList

DECLARE  @CurrentTable VARCHAR(100)
        ,@MinCount INT = 1
		,@MaxCount INT = (SELECT MAX(TableID) FROM @TablesList)
		,@SQLString VARCHAR(MAX) = ''


WHILE(@MinCount<=@MaxCount)
BEGIN
		SELECT @CurrentTable = TableName FROM @TablesList
		WHERE TableID = @MinCount

		SET @SQLString = @SQLString+

		'

		GO

		CREATE TRIGGER DML_TRIGGER_'+@CurrentTable
		+
		'
		ON '+@CurrentTable
		+'
		FOR
		INSERT,UPDATE,DELETE
		AS
		BEGIN

			 DECLARE 
			 @SPID	INT
			,@UserName	VARCHAR(100)
			,@MachineName	VARCHAR(100)
			,@InstanceName	VARCHAR(100)
			,@DatabaseName	VARCHAR(100)
			,@DBObjectName	VARCHAR(100)
			,@DateAudited	DATETIME
			,@ActionType	VARCHAR(100)
			,@ActionSubType	VARCHAR(100)
			,@ActionStatus	VARCHAR(100)
			,@InsertedVolume	XML
			,@DeletedVolume	XML
			,@RowsInserted	BIGINT
			,@RowsDeleted	BIGINT
			,@RowsUpdated	BIGINT

			SELECT 
			 @SPID = @@SPID
			,@UserName	= SYSTEM_USER
			,@MachineName = CAST(SERVERPROPERTY(''ServerName'') AS VARCHAR(100))
			,@InstanceName	= CAST(SERVERPROPERTY(''ServerName'') AS VARCHAR(100))
			,@DatabaseName = DB_NAME()
			,@DBObjectName	= '''+@CurrentTable+'''
			,@DateAudited = GETDATE()
			,@ActionType = ''DML''
			,@ActionSubType = NULL
			,@ActionStatus = ''Success''
			,@RowsInserted = 0	
			,@RowsDeleted = 0	
			,@RowsUpdated = 0	

			--SELECT @@SPID
			--SELECT SYSTEM_USER
			--SELECT SERVERPROPERTY(''ServerName'')
			--SELECT DB_NAME()

			SET @RowsInserted = 
			(
				CASE 
					WHEN ((SELECT COUNT(*) FROM INSERTED) >0) AND ((SELECT COUNT(*) FROM DELETED) = 0) THEN ((SELECT COUNT(*) FROM INSERTED) )
					ELSE 0
				END
			)

			SET @RowsDeleted = 
			(
				CASE 
					WHEN ((SELECT COUNT(*) FROM INSERTED) = 0) AND ((SELECT COUNT(*) FROM DELETED) > 0) THEN ((SELECT COUNT(*) FROM DELETED) )
					ELSE 0
				END
			)

			SET @RowsUpdated = 
			(
				CASE 
					WHEN ((SELECT COUNT(*) FROM INSERTED) > 0) AND ((SELECT COUNT(*) FROM DELETED) > 0) THEN ((SELECT COUNT(*) FROM DELETED) )
					ELSE 0
				END
			)

			SET @ActionSubType = 
			(
				CASE 
					WHEN @RowsInserted > 0 THEN ''INSERT''
					WHEN @RowsUpdated > 0 THEN ''UPDATE''
					WHEN @RowsDeleted > 0 THEN ''DELETE''
					ELSE ''N/A''
				END
			)

			SET @InsertedVolume = 
			(
				SELECT * FROM INSERTED FOR XML PATH
			)

			SET @DeletedVolume= 
			(
				SELECT * FROM DELETED FOR XML PATH
			)


			INSERT INTO TriggerAudits
			(
			 SPID
			,UserName
			,MachineName
			,InstanceName
			,DatabaseName
			,DBObjectName
			,DateAudited
			,ActionType
			,ActionSubType
			,ActionStatus
			,InsertedVolume
			,DeletedVolume
			,RowsInserted
			,RowsDeleted
			,RowsUpdated
			)
			SELECT  
			@SPID
			,@UserName
			,@MachineName
			,@InstanceName
			,@DatabaseName
			,@DBObjectName
			,@DateAudited
			,@ActionType
			,@ActionSubType
			,@ActionStatus
			,@InsertedVolume
			,@DeletedVolume
			,@RowsInserted
			,@RowsDeleted
			,@RowsUpdated

			COMMIT

		END
'		

		--PRINT @CurrentTable 
	SET @MinCount = @MinCount + 1
	--EXEC (@SQLString)
	PRINT @SQLString

		SET @SQLString = ''

END

--PRINT @SQLString



