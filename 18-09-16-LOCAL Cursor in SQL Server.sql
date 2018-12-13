--LOCAL Cursor in SQL Server

--GLOBAL/LOCAL


--This will not work
	GO 
		DECLARE EmpTab_CURSOR CURSOR 
		LOCAL
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
--This will work

	DECLARE EmpTab_CURSOR CURSOR 
	LOCAL
	FOR SELECT * FROM EmpTab 
		OPEN EmpTab_CURSOR 
			FETCH NEXT FROM EmpTab_CURSOR 
		CLOSE EmpTab_CURSOR 
	DEALLOCATE EmpTab_CURSOR 