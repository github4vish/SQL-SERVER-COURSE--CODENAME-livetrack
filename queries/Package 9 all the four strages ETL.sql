--Package 9 all the four strages ETL
--ETL Stage1
	Source Type: RDBMS
	Source address: Data Source=ADMIN-PC;Initial Catalog=OLTP_Practice;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;
	Destination Type: RDBMS
	Destination address: Data Source=ADMIN-PC;Initial Catalog=Src_Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;


	User::DestinationAddress
	User::DestinationType
	User::SourceAddress
	User::SourceType

--ETL Stage2
	
	Source Type: RDBMS
	Source address: Data Source=ADMIN-PC;Initial Catalog=Src_Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;
	Destination Type: Files
	Destination address:C:\Users\ADMIN\Desktop\MSBI\SSIS\Files\Flatfiles\Employees.txt


	User::DestinationAddress
	User::DestinationType
	User::SourceAddress
	User::SourceType

--ETL Stage3
	
	Source Type: Files
	Source address: C:\Users\ADMIN\Desktop\MSBI\SSIS\Files\Flatfiles\Employees.txt
	Destination Type: RDBMS
	Destination address:Data Source=ADMIN-PC;Initial Catalog=Dest_Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;


--ETL Stage3
	
	Source Type: Files
	Source address: C:\Users\ADMIN\Desktop\MSBI\SSIS\Files\Flatfiles\Employees.txt
	Destination Type: RDBMS
	Destination address:





EXECUTE InsertSSISTask2
 ? OUTPUT --@TaskID
,? --@BatchID
,? --@TaskStartTime
,NULL --@TaskEndTime
,NULL --@TaskElapsedTime
,'Started' --@ExecutionStatus
,? --@SourceType
,? --@DestinationType
,? --@SourceAddress
,? --@DestinationAddress
,? --@ExtractedRows
,? --@LoadedRows
,? --@RejectedRows


EmployeeDIm

