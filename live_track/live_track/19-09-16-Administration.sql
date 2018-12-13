--Administration concepts in SQL Server
--MERGE

--Types of authentications to conect to SQL Server insance
--Windows authentication(Recognize the windows N/W users and and map the credentials )
--CReating a Windows login using command
	USE [master]
	GO

	DROP LOGIN [MSBI-PC\Guest]
	GO

	CREATE LOGIN [MSBI-PC\Guest] FROM WINDOWS 

--SQL authentication(Name the SA user, specify an initial password,and map the credentials)
--Creating an SA user using command
	USE [master]
	GO

	DROP LOGIN [sa1]
	GO

	CREATE LOGIN [sa1] 
	WITH 
	PASSWORD = N'sa1'

