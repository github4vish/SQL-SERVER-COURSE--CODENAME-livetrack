--GLOBAL Cursor in SQL Server

--GLOBAL/LOCAL

GO 
	DECLARE EmpTab_CURSOR CURSOR 
	GLOBAL
	FOR SELECT * FROM EmpTab 
GO
		OPEN EmpTab_CURSOR 
GO
			FETCH NEXT FROM EmpTab_CURSOR 
GO
		CLOSE EmpTab_CURSOR 
GO
	DEALLOCATE EmpTab_CURSOR 
GO
