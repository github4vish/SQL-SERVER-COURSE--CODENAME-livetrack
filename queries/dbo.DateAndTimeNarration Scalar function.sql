--dbo.DateAndTimeNarration Scalar function
create FUNCTION dbo.DateAndTimeNarration
(
	@starttime datetime,@endtime datetime
)
RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @temp datetime,@years int,
	@months int,@days int,@hours int, @minutes int,@seconds int, @milliseconds int,
	@RESULT VARCHAR(500)

	--select @starttime='1991-10-16 12:36:19.177',@endtime=getdate()

	 select @temp=@starttime
	 select @years=datediff(year,@temp,@endtime)-
			 case
				when month(@temp)>month(@endtime)
				or month(@temp)=month(@endtime)and day(@temp)>day(@endtime)
				or (month(@temp)=month(@endtime)and day(@temp)=day(@endtime)
					and Datepart(hour,@temp)> Datepart(hour,@endtime))
				or(month(@temp)=month(@endtime)
					and day(@temp)=day(@endtime)
					and Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)>Datepart(minute,@endtime)) 
				 or(month(@temp)=month(@endtime)
					and day(@temp)=day(@endtime) 
					and Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)=Datepart(minute,@endtime)
					and datepart(second,@temp)>datepart(second,@endtime))
				 or(month(@temp)=month(@endtime)
					and day(@temp)=day(@endtime)
					and Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)=Datepart(minute,@endtime) 
					and datepart(second,@temp)=datepart(second,@endtime)
					and datepart(millisecond,@temp)>datepart(millisecond,@temp))

			then 1 else 0
			end
	select @temp=dateadd(year,@years,@temp)
	select @months=datediff(month,@temp,@endtime)-
			 case
				when  day(@temp)>day(@endtime)
				or ( day(@temp)=day(@endtime)
					and Datepart(hour,@temp)> Datepart(hour,@endtime))
				or( day(@temp)=day(@endtime)
					and Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)>Datepart(minute,@endtime)) 
				 or( day(@temp)=day(@endtime) 
					and Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)=Datepart(minute,@endtime)
					and datepart(second,@temp)>datepart(second,@endtime))
				 or(day(@temp)=day(@endtime)
					and Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)=Datepart(minute,@endtime) 
					and datepart(second,@temp)=datepart(second,@endtime)
					and datepart(millisecond,@temp)>datepart(millisecond,@temp))
			then 1 else 0
			end
	select @temp=dateadd(month,@months,@temp)
	select @days=datediff(day,@temp,@endtime)-
			case
				when Datepart(hour,@temp)> Datepart(hour,@endtime) 
				 or  (Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)>Datepart(minute,@endtime))
				 or(Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)=Datepart(minute,@endtime)
					and datepart(second,@temp)>datepart(second,@endtime))
				 or(Datepart(hour,@temp)= Datepart(hour,@endtime)
					and Datepart(minute,@temp)=Datepart(minute,@endtime) 
					and datepart(second,@temp)=datepart(second,@endtime)
					and datepart(millisecond,@temp)>datepart(millisecond,@temp))
				then 1 else 0
				end
	select @temp=dateadd(day,@days,@temp)
	select @hours=datediff(hour,@temp,@endtime)-
			case
				 when Datepart(minute,@temp)> Datepart(minute,@endtime)
				  or ( Datepart(minute,@temp)=Datepart(minute,@endtime) 
						and datepart(second,@temp)>datepart(second,@endtime))
				  or( Datepart(minute,@temp)=Datepart(minute,@endtime) 
						and datepart(second,@temp)=datepart(second,@endtime)
						and datepart(millisecond,@temp)>datepart(millisecond,@temp))
				then 1 else 0
			end

	select @temp=dateadd(hour,@hours,@temp)
	select @minutes=datediff(minute,@temp,@endtime)-
			case
				when  datepart(second,@temp)> datepart(second,@endtime)
					 or (datepart(second,@temp)=datepart(second,@endtime)
						and datepart(millisecond,@temp)>datepart(millisecond,@temp))
				then 1 else 0
			end
	select @temp=dateadd(minute,@minutes,@temp)
	select @seconds=datediff(second,@temp,@endtime)-
			case
				when 
					  datepart(second,@temp)>datepart(second,@endtime)
						or (datepart(second,@temp)=datepart(second,@endtime) 
							and datepart(millisecond,@temp)>datepart(millisecond,@temp))
				then 1 else 0
			end
	select @temp=dateadd(second,@seconds,@temp)
	select @milliseconds=datediff(millisecond,@temp,@endtime)
	SET @RESULT = 
	      CASE WHEN @years = 0 THEN '' ELSE CAST(@years AS VARCHAR(10))+' YEARS	' END
		 +CASE WHEN @months = 0 THEN '' ELSE CAST(@months AS VARCHAR(10))+' MONTHS	' END
		 +CASE WHEN @days = 0 THEN '' ELSE CAST(@days AS VARCHAR(10))+' DAYS	' END
		 +CASE WHEN @hours = 0 THEN '' ELSE CAST(@hours AS VARCHAR(10))+' HOURS	' END
		 +CASE WHEN @minutes = 0 THEN '' ELSE CAST(@minutes AS VARCHAR(10))+' MINUTES	' END
		 +CASE WHEN @seconds = 0 THEN '' ELSE CAST(@seconds AS VARCHAR(10))+' SECONDS	' END
		 +CASE WHEN @milliseconds = 0 THEN '' ELSE CAST(@milliseconds AS VARCHAR(10))+' MILLISECONDS' END

	RETURN(@RESULT)

END
