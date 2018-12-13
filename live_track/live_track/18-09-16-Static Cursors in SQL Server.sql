--Static Cursors in SQL Server
DECLARE EmpTab_CURSOR CURSOR 
STATIC
FOR SELECT * FROM EmpTab 

	OPEN EmpTab_CURSOR 

		FETCH NEXT FROM EmpTab_CURSOR 

	CLOSE EmpTab_CURSOR 

DEALLOCATE EmpTab_CURSOR 






	



