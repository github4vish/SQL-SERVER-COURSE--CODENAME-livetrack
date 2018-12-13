--Import and Export column transaformations
Files to DB(Binary code) --Import
DB(Binary code) to Files --Export column
-----------

CREATE TABLE ImportAndExportSSIS
(
	 [PhotoID] INT
	,[PhotoSource] VARCHAR(100)
	,[Photo] IMAGE
)

SELECT * FROM ImportAndExportSSIS

SP_SPACEUSED ImportAndExportSSIS