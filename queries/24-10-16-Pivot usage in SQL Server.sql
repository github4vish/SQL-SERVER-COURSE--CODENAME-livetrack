
--Pivot usage in SQL Server
SELECT 
       [CalendarYear]
      ,[EnglishCountryRegionName]      
      ,[SalesAmount]
      
  FROM [AdventureWorksDW2012].[dbo].[SalesVw]

------------------
SELECT  *
FROM 
(
       SELECT      
	   [CalendarYear]
      ,[EnglishCountryRegionName]
      ,[SalesAmount] FROM [AdventureWorksDW2012].[dbo].[SalesVw]

) as s
PIVOT
(
    SUM([SalesAmount])
    FOR [CalendarYear] IN ([2005], [2006],[2007],[2008])
)AS pvt


