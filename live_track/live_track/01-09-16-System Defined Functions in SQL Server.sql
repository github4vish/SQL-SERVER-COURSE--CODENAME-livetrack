--System Defined Functions in SQL Server
--Every UDF & SDF Must and should return a value. UDF Functions can perfrom  ONLY DQL(Select).
--Functions can accept zero or more input parameters(arguments)

--**String 
LOWER,UPPER

	SELECT LOWER('Bangalore')
	SELECT UPPER('Bangalore')

	SELECT LOWER('Bangalore') LowerString ,UPPER('Bangalore') UpperString 

	SELECT LOWER(Email)LowerStringEmailID ,* FROM EmpDetails

LEFT,RIGHT
	SELECT LEFT('Banagalore',2),RIGHT('Banagalore',2)
SUBSTRING
	SELECT SUBSTRING('Banagalore',2,3)
STUFF,REPLACE
	SELECT STUFF('Banagalore',1,7,'Mys'),REPLACE('Banagalore','Banagal','Mys')
REPLICATE
	DECLARE @ID INT = 10,@String VARCHAR(10)
	SELECT REPLICATE('0',4)+ CAST(@ID AS VARCHAR(10))
	SELECT REPLICATE('0',4)+ @ID 

	SELECT 
	EmpID
	,'Emp'+REPLICATE('0',4)+ CAST(EmpID AS  VARCHAR(100))INTReplicate
	FROM EmpDetails

CHARINDEX,PATINDEX

	SELECT CHARINDEX('a','Bangalore')

	SELECT PATINDEX('%ore%','Bangalore and Mysore Bangalore and Mysore Bangalore and Mysore')
	SELECT PATINDEX('ore%','Bangalore and Mysore Bangalore and Mysore Bangalore and Mysore')
	SELECT PATINDEX('%ore','Bangalore and Mysore')

REVERSE
	SELECT REVERSE('Bangalore')

ASCII,CHAR

	SELECT ASCII('A'),ASCII('B'), ASCII('a'),ASCII('b')
	SELECT CHAR(65),CHAR(66),CHAR(97),CHAR(98)


LEN 

	SELECT LEN('         Bangalore')
	SELECT LEN('         Bangalore          ')
	SELECT LEN('			Bangalore			')


LTRIM
	SELECT LTRIM(' Bangalore')

	SELECT LTRIM(' Bangalore    ')
	SELECT RTRIM(' Bangalore    ')
	SELECT RTRIM(LTRIM(' Bangalore    '))


	SELECT LTRIM('	Bangalore				')
	SELECT RTRIM('	Bangalore				')
	SELECT RTRIM(LTRIM('	Bangalore				'))


	SELECT '	Bangalore				'

	RTRIM
	Bangalore

	Bangalore    
	Bangalore

	Bangalore
 
--Math/Arithematic
LOG
LOG10
SIN
COS
TAN
RADIANS
PI
DEGREES
COT
ROUND
FLOOR
CEILING
ABS
SQRT
POWER
SQUARE

	SELECT LOG(10) ,LOG10(10),SIN(90) AS Sin90,COS(90),TAN(90),RADIANS(90) Radian90,PI(),DEGREES(RADIANS(90)),COT(90),ROUND(45.789,2),FLOOR(-2.5),CEILING(3.7),ABS(-45.787),SQRT(26),POWER(4.5,4),SQUARE(2.5)

--Statistical
VAR

x1,x2,x3,.......xn

VAR=((x1^2 +x2^2 +......+xn^2)/n - (x1+x2+......+xn)/n)^2
STDEV = SQRT(VAR)

STDEV

	SELECT VAR(Marks),STDEV(Marks) FROM 
	(
		SELECT  97 AS Marks UNION ALL
		SELECT  96 UNION ALL
		SELECT  98 UNION ALL
		SELECT  99 UNION ALL
		SELECT  35 UNION ALL
		SELECT  99
	)S1


	SELECT VAR(Marks),STDEV(Marks) FROM 
	(
		SELECT  91 AS Marks UNION ALL
		SELECT  94 UNION ALL
		SELECT  97 UNION ALL
		SELECT  98 UNION ALL
		SELECT  96 UNION ALL
		SELECT  100
	)S2

--**Aggregate
SUM
MIN
MAX
AVG
COUNT
COUNT_BIG

	CREATE TABLE SalesDetails				
	(
	 SNO INT	
	,Country VARCHAR(100)	 
	,State	VARCHAR(100)
	,City	VARCHAR(100)
	,SalesAmount MONEY
	)

	INSERT INTO SalesDetails
	SELECT '1','India','Karnataka','Bangalore','4523.245' UNION ALL 
	SELECT '2','India','Karnataka','Mysore','4587.235' UNION ALL 
	SELECT '3','India','Karnataka','Mangalore','4651.225' UNION ALL 
	SELECT '4','India','Karnataka','Bangalore','4715.215' UNION ALL 
	SELECT '5','India','Karnataka','Mysore','4779.205' UNION ALL 
	SELECT '6','India','Karnataka','Mangalore','4843.195' UNION ALL 
	SELECT '7','India','Karnataka','Bangalore','4907.185' UNION ALL 
	SELECT '8','India','Karnataka','Mysore','4971.175' UNION ALL 
	SELECT '9','India','Karnataka','Mangalore','5035.165' UNION ALL 
	SELECT '10','India','Karnataka','Bangalore','5099.155' UNION ALL 
	SELECT '11','India','Karnataka','Bangalore','5163.145' UNION ALL 
	SELECT '12','India','Karnataka','Mysore','5227.135' UNION ALL 
	SELECT '13','India','Karnataka','Mangalore','5291.125' UNION ALL 
	SELECT '14','India','Karnataka','Bangalore','5355.115' UNION ALL 
	SELECT '15','India','Karnataka','Mysore','5419.105' UNION ALL 
	SELECT '16','India','Andhra Pradesh','Hyderabad','7856.23' UNION ALL 
	SELECT '17','India','Andhra Pradesh','Vizag','10293.355' UNION ALL 
	SELECT '18','India','Andhra Pradesh','Tirupathi','12730.48' UNION ALL 
	SELECT '19','India','Andhra Pradesh','Vijayawada','15167.605' UNION ALL 
	SELECT '20','India','Andhra Pradesh','Hyderabad','17604.73' UNION ALL 
	SELECT '21','India','Andhra Pradesh','Vizag','20041.855' UNION ALL 
	SELECT '22','India','Andhra Pradesh','Tirupathi','22478.98' UNION ALL 
	SELECT '23','India','Andhra Pradesh','Vijayawada','24916.105' UNION ALL 
	SELECT '24','India','Andhra Pradesh','Hyderabad','27353.23' UNION ALL 
	SELECT '25','India','Andhra Pradesh','Vizag','29790.355' UNION ALL 
	SELECT '26','India','Andhra Pradesh','Tirupathi','32227.48' UNION ALL 
	SELECT '27','India','Andhra Pradesh','Vijayawada','34664.605' UNION ALL 
	SELECT '28','India','Andhra Pradesh','Hyderabad','37101.73' UNION ALL 
	SELECT '29','India','Tamilanadu','Chennai','39538.855' UNION ALL 
	SELECT '30','India','Tamilanadu','Coimbattore','41975.98' UNION ALL 
	SELECT '31','India','Tamilanadu','Erode','44413.105' UNION ALL 
	SELECT '32','India','Tamilanadu','Chennai','46850.23' UNION ALL 
	SELECT '33','India','Tamilanadu','Coimbattore','49287.355' UNION ALL 
	SELECT '34','India','Tamilanadu','Erode','51724.48' UNION ALL 
	SELECT '35','India','Tamilanadu','Chennai','54161.605' UNION ALL 
	SELECT '36','India','Tamilanadu','Coimbattore','56598.73' UNION ALL 
	SELECT '37','India','Tamilanadu','Erode','59035.855' UNION ALL 
	SELECT '38','India','Tamilanadu','Chennai','61472.98'

	SELECT * FROM SalesDetails


	SELECT 
    Country
	,State
	,City
	,COUNT(*) AS CountTransactions
	,COUNT_BIG(*) AS CountTransactions_BIG
	,SUM(SalesAmount) AS  SumSalesAmount
	,AVG(SalesAmount) AS  AvgSalesAmount
	,MIN(SalesAmount) AS  MinSalesAmount
	,MAX(SalesAmount) AS  MaxSalesAmount
	FROM SalesDetails
	GROUP BY 
     Country
	,State
	,City
	HAVING AVG(SalesAmount)  >=25000.00

	ORDER BY 
     Country
	,State
	,City
	



	WHERE State = 'Karnataka'



	SELECT * FROM 
	(
		SELECT 
		 Country
		,State
		,City
		,COUNT(1) AS CountTransactions
		,SUM(SalesAmount) AS  SumSalesAmount
		,AVG(SalesAmount) AS  AvgSalesAmount
		,MIN(SalesAmount) AS  MinSalesAmount
		,MAX(SalesAmount) AS  MaxSalesAmount
		FROM SalesDetails
		GROUP BY 
		 Country
		,State
		,City
	) AS T
	WHERE T.AvgSalesAmount >=25000.00



	SELECT 
	 Country
	,State
	,City
	,COUNT(1) AS CountTransactions
	,SUM(SalesAmount) AS  SumSalesAmount
	,AVG(SalesAmount) AS  AvgSalesAmount
	,MIN(SalesAmount) AS  MinSalesAmount
	,MAX(SalesAmount) AS  MaxSalesAmount
	FROM SalesDetails
	GROUP BY 
	 Country
	,State
	,City
	HAVING  COUNT(1) >=4
--***Ranking
ROW_NUMBER
RANK
DENSE_RANK

NTILE




	CREATE TABLE StdDetails			
	(
	 SNO	INT
	,StdName VARCHAR(200)	
	,Sub VARCHAR(200)		
	,Marks INT
	)
	--drop table stddetails

	INSERT INTO StdDetails			
	SELECT '1','ASHWIN M','Eng','98' UNION ALL 
	SELECT '2','ASHWIN M','Phy','95' UNION ALL 
	SELECT '3','ASHWIN M','Maths','54' UNION ALL 
	SELECT '4','Chaitanya M','Eng','97' UNION ALL 
	SELECT '5','Chaitanya M','Phy','58' UNION ALL 
	SELECT '6','Chaitanya M','Maths','95' UNION ALL 
	SELECT '7','Chakradhar K','Eng','75' UNION ALL 
	SELECT '8','Chakradhar K','Phy','97' UNION ALL 
	SELECT '9','Chakradhar K','Maths','58' UNION ALL 
	SELECT '10','Dileep M','Eng','75' UNION ALL 
	SELECT '11','Dileep M','Phy','97' UNION ALL 
	SELECT '12','Dileep M','Maths','58' UNION ALL 
	SELECT '13','HARI SUDHA','Eng','54' UNION ALL 
	SELECT '14','HARI SUDHA','Phy','97' UNION ALL 
	SELECT '15','HARI SUDHA','Maths','58' 

	--Syntax for ranking functions

	SELECT * FROM StdDetails

	RANK/DENSE_RANK/ROW_NUMBER()
	OVER
	(
	[PARTITION BY  PARTITION BY Filed(s)]
	ORDER BY ORder by Field(s)
	)


	select * from StdDetails order by StdName
	--Example

	SELECT 
	 StdName
	,Sub 
	,Marks
	,ROW_NUMBER()
	OVER
	(
	PARTITION BY Sub
	ORDER BY Marks DESC
	) AS ROW_NUMBER_Value
		FROM StdDetails


	SELECT 
	 StdName
	,Sub 
	,Marks
	,RANK()
	OVER
	(
	PARTITION BY Sub
	ORDER BY Marks DESC
	) AS RANK_Value

	from StdDetails

		SELECT 
	 StdName
	,Sub 
	,Marks
	,DENSE_RANK()
	OVER
	(
	PARTITION BY Sub
	ORDER BY Marks DESC
	) AS DENSE_RANK_Value

	FROM StdDetails
---------------------------------


	SELECT 
	* 
	,ROW_NUMBER()
	OVER
	(
	PARTITION BY Country,State,City
	ORDER BY SalesAmount DESC
	) AS ROW_NUMBER_Value

	,RANK()
	OVER
	(
	PARTITION BY Country,State,City
	ORDER BY SalesAmount DESC
	) AS RANK_Value

	,DENSE_RANK()
	OVER
	(
	PARTITION BY Country,State,City
	ORDER BY SalesAmount DESC
	) AS DENSE_RANK_Value
	FROM SalesDetails
-------------------------------------------

	SELECT 
	 S.Country
	,S.State
	,S.City
	,S.SalesAmount 
	,NTILE(3)
	OVER
	(
	 PARTITION BY State	
	 ORDER BY SalesAmount DESC
	) AS ThreeTile_Value
	FROM 
	(
		SELECT 
		 Country 
		,State
		,City
		,SUM(SalesAmount) AS SalesAmount
		FROM  SalesDetails
		GROUP BY
		 Country
		,State
		,City
	)S

	------------------------------

	SELECT * 
	,NTILE(4)
	OVER
	(
	 PARTITION BY State	
	 ORDER BY SalesAmount DESC
	) AS Quartile_Value

	FROM SalesDetails
	ORDER BY 6








--***Date and Time
	GETDATE
	DATEPART
	DATEDIFF
	DATENAME
	DATEADD
	DAY
	MONTH
	YEAR

	SELECT 
	 GETDATE() AS NowDate
	,DATEPART(HH,GETDATE()) AS HourPart
	,DATEDIFF(YY,'1990-01-01',GETDATE()) AgeinYears
	,DATEDIFF(MM,'1990-01-01',GETDATE()) AgeinMonths
	,DATENAME(DW,'1990-01-01') AS BirthDayName
	,DATENAME(MM,'1990-01-01') AS BirthMonthName
	,DATEADD(DD,5,GETDATE()) AS FiveDayesAfterToday
	,DAY(GETDATE()) AS DateNumberToday
	,MONTH(GETDATE()) AS MonthNumberToday
	,YEAR(GETDATE()) AS YearNumberToday

	'2016-04-12 10:18:58.677'

	YYYY-MM-DD HH:MI:SS.MIS

	SELECT FirstName,LastName,DOB,DATEDIFF(YY,DOB,GETDATE()) AgeinYears FROM PersonDetails2

--**Type Castening function
CAST
--Syntax for Cast

CAST(SourceValue AS DestiinationDataType[<Size>])

SELECT 1 + '01'
SELECT CAST(1 AS VARCHAR(10)) + '01'
SELECT '1' + '01'

SELECT CAST(GETDATE() AS VARCHAR(100))

Apr 12 2016 10:43AM
Mon	DD YYYY HH:MIAM/PM


SELECT CAST('Jan 1 2016 10:50PM' AS DATETIME)

CONVERT

Syntax for CONVERT

CONVERT(DestinationDataType[<Size>],SourceValue[, StyleNumber])

Style Numbers range 

0/100
1/101
2/102
3/103



13/113





	SELECT CONVERT(VARCHAR(100),GETDATE(),0)
	SELECT CONVERT(VARCHAR(100),GETDATE(),101)
	SELECT CONVERT(VARCHAR(100),GETDATE(),102)
	SELECT CONVERT(VARCHAR(100),GETDATE(),103)
	SELECT CONVERT(VARCHAR(100),GETDATE(),104)
	SELECT CONVERT(VARCHAR(100),GETDATE(),105)
	SELECT CONVERT(VARCHAR(100),GETDATE(),106)
	SELECT CONVERT(VARCHAR(100),GETDATE(),107)
	SELECT CONVERT(VARCHAR(100),GETDATE(),108)
	SELECT CONVERT(VARCHAR(100),GETDATE(),109)
	SELECT CONVERT(VARCHAR(100),GETDATE(),110)
	SELECT CONVERT(VARCHAR(100),GETDATE(),111)
	SELECT CONVERT(VARCHAR(100),GETDATE(),112)


	SELECT CAST('12-04-2016' AS DATETIME)


--**Error Handling 

ERROR_NUMBER
ERROR_LINE
ERROR_MESSAGE
ERROR_PROCEDURE
ERROR_SEVERITY
ERROR_STATE

--*Miscelanious
IDENT_CURRENT
SCOPE_IDENTITY
SERVERPROPERTY
USER
USER_ID
USER_NAME
SCHEMA_ID
SCHEMA_NAME







