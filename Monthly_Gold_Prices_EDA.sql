--Exploratory Data Analysis of Monthly Gold_Prices of 18 Countries/Nations over the period 1979-2021


--Retrieves all the columns on the Gold_Prices table
SELECT * 
FROM Gold_Prices
ORDER BY Date 


--Gets the Data Type and information about the table
EXEC sp_help Gold_Prices 


--Creates a Temporary Table which will be used for Data Exploration on the Gold_Prices table
CREATE TABLE #temp_Gold_Prices (
Date nvarchar(100),
[United States(USD)] float, 
[Europe(EUR)] float, 
[Japan(JPY)] float, 
[United Kingdom(GBP)] float, 
[Canada(CAD)] float, 
[Switzerland(CHF)] float, 
[India(INR)] float, 
[China(CNY)] float, 
[Turkey(TRY)] float, 
[Saudi Arabia(SAR)] float, 
[Indonesia(IDR)] float, 
[United Arab Emirates(AED)] float, 
[Thailand(THB)] float, 
[Vietnam(VND)] float, 
[Egypt(EGP)] float, 
[South Korean(KRW)] float, 
[Australia(AUD)] float, 
[South Africa(ZAR)] float 
)


INSERT INTO #temp_Gold_Prices
SELECT * 
FROM Gold_Prices


 
--Replacing all values which were automatically populated with '0' to NULL in the Temporary Table. This will help avoid dividing by Zero
--Only four(4) Countries/Nations had rows with '0' values
UPDATE #temp_Gold_Prices
SET [China(CNY)] = NULL
WHERE [China(CNY)] = '0'

UPDATE #temp_Gold_Prices
SET [Turkey(TRY)] = NULL
WHERE [Turkey(TRY)] = '0' 

UPDATE #temp_Gold_Prices
SET [Vietnam(VND)] = NULL
WHERE [Vietnam(VND)] = '0' 

UPDATE #temp_Gold_Prices
SET [Egypt(EGP)] = NULL
WHERE [Egypt(EGP)] = '0'


--Retrieves the updated Gold_Prices Temporary table which is now populated with NULL where values equalled 0 
SELECT * 
FROM #temp_Gold_Prices


--Count of Monthly Gold Prices for each Country/Nation
SELECT COUNT([United States(USD)]) as 'USD', COUNT([Europe(EUR)]) as 'EUR', COUNT([Japan(JPY)]) as 'JPY', COUNT([United Kingdom(GBP)]) as 'GBP',
COUNT([Canada(CAD)]) as 'CAD', COUNT([Switzerland(CHF)]) as 'CHF', COUNT([India(INR)]) as 'INR', COUNT([China(CNY)]) as 'CNY', COUNT([Turkey(TRY)]) as 'TRY',
COUNT([Saudi Arabia(SAR)]) as 'SAR', COUNT([Indonesia(IDR)]) as 'IDR', COUNT([United Arab Emirates(AED)]) as 'AED', COUNT([Thailand(THB)]) as 'THB', 
COUNT([Vietnam(VND)]) as 'VND', COUNT([Egypt(EGP)]) as 'EGP', COUNT([South Korean(KRW)]) as 'KRW', COUNT([Australia(AUD)]) as 'AUD', COUNT([South Africa(ZAR)]) as 'ZAR'
FROM #temp_Gold_Prices


--Monthly Mean/Average Price for each Country/Nation over the period 1979-2021
SELECT AVG([United States(USD)]) as 'USD', AVG([Europe(EUR)]) as 'EUR', AVG([Japan(JPY)]) as 'JPY', 
AVG([United Kingdom(GBP)]) as 'GBP', AVG([Canada(CAD)]) as 'CAD', AVG([Switzerland(CHF)]) as 'CHF',
AVG([India(INR)]) as 'INR', AVG([China(CNY)]) as 'CNY', AVG([Turkey(TRY)]) as 'TRY',
AVG([Saudi Arabia(SAR)]) as 'SAR', AVG([Indonesia(IDR)]) as 'IDR', AVG([United Arab Emirates(AED)]) as 'AED',
AVG([Thailand(THB)]) as 'THB', AVG([Vietnam(VND)]) as 'VND', AVG([Egypt(EGP)]) as 'EGP', AVG([South Korean(KRW)]) as 'KRW', 
AVG([Australia(AUD)]) as 'AUD', AVG([South Africa(ZAR)]) as 'ZAR'
FROM #temp_Gold_Prices


--The Standard Deviation for the Monthly_Gold_Prices over the period 1979-2021
SELECT STDEV([United States(USD)]) as 'USD', STDEV([Europe(EUR)]) as 'EUR', STDEV([Japan(JPY)]) as 'JPY', 
STDEV([United Kingdom(GBP)]) as 'GBP', STDEV([Canada(CAD)]) as 'CAD', STDEV([Switzerland(CHF)]) as 'CHF',
STDEV([India(INR)]) as 'INR', STDEV([China(CNY)]) as 'CNY', STDEV([Turkey(TRY)]) as 'TRY',
STDEV([Saudi Arabia(SAR)]) as 'SAR', STDEV([Indonesia(IDR)]) as 'IDR', STDEV([United Arab Emirates(AED)]) as 'AED',
STDEV([Thailand(THB)]) as 'THB', STDEV([Vietnam(VND)]) as 'VND', STDEV([Egypt(EGP)]) as 'EGP', STDEV([South Korean(KRW)]) as 'KRW', 
STDEV([Australia(AUD)]) as 'AUD', STDEV([South Africa(ZAR)]) as 'ZAR'
FROM #temp_Gold_Prices


--The Minimum Gold Price for each Country/Nation over the Period 1979-2021
SELECT MIN([United States(USD)]) as 'USD', MIN([Europe(EUR)]) as 'EUR', MIN([Japan(JPY)]) as 'JPY', 
MIN([United Kingdom(GBP)]) as 'GBP', MIN([Canada(CAD)]) as 'CAD', MIN([Switzerland(CHF)]) as 'CHF',
MIN([India(INR)]) as 'INR', MIN([China(CNY)]) as 'CNY', MIN([Turkey(TRY)]) as 'TRY',
MIN([Saudi Arabia(SAR)]) as 'SAR', MIN([Indonesia(IDR)]) as 'IDR', MIN([United Arab Emirates(AED)]) as 'AED',
MIN([Thailand(THB)]) as 'THB', MIN([Vietnam(VND)]) as 'VND', MIN([Egypt(EGP)]) as 'EGP', MIN([South Korean(KRW)]) as 'KRW', 
MIN([Australia(AUD)]) as 'AUD', MIN([South Africa(ZAR)]) as 'ZAR' 
FROM #temp_Gold_Prices

--The LOWER QUARTILE(25%) Gold_Price of each Country/Nation from 1979-2021
SELECT TOP 1 
       percentile_cont(0.75) within group(order by [United States(USD)] desc) over( ) as 'USA 25%', 
       percentile_cont(0.75) within group(order by [Europe(EUR)] desc) over( ) as 'EUR 25%', 
	   percentile_cont(0.75) within group(order by [Japan(JPY)] desc) over( ) as 'JPY 25%', 
	   percentile_cont(0.75) within group(order by [United Kingdom(GBP)] desc) over( ) as 'GBP 25%', 
	   percentile_cont(0.75) within group(order by [Canada(CAD)] desc) over( ) as 'CAD 25%', 
	   percentile_cont(0.75) within group(order by [Switzerland(CHF)] desc) over( ) as 'CHF 25%',
	   percentile_cont(0.75) within group(order by [India(INR)] desc) over( ) as 'INR 25%', 
	   percentile_cont(0.75) within group(order by[China(CNY)]  desc) over( ) as 'CNY 25%', 
	   percentile_cont(0.75) within group(order by [Turkey(TRY)] desc) over( ) as 'TRY 25%', 
	   percentile_cont(0.75) within group(order by [Saudi Arabia(SAR)] desc) over( ) as 'SAR 25%', 
	   percentile_cont(0.75) within group(order by [Indonesia(IDR)] desc) over( ) as 'IDR 25%', 
	   percentile_cont(0.75) within group(order by [United Arab Emirates(AED)] desc) over( ) as 'AED 25%', 
	   percentile_cont(0.75) within group(order by [Thailand(THB)] desc) over( ) as 'THB 25%', 
	   percentile_cont(0.75) within group(order by [Vietnam(VND)] desc) over( ) as 'VND 25%', 
	   percentile_cont(0.75) within group(order by [Egypt(EGP)] desc) over( ) as 'EGP 25%', 
	   percentile_cont(0.75) within group(order by [South Korean(KRW)] desc) over( ) as 'KRW 25%', 
	   percentile_cont(0.75) within group(order by [Australia(AUD)] desc) over( ) as 'AUD 25%',
	   percentile_cont(0.75) within group(order by [South Africa(ZAR)] desc) over( ) as 'ZAR 25%'
FROM #temp_Gold_Prices   



--The MEDIAN(50%) Gold_Price of each Country/Nation from 1979-2021
SELECT TOP 1 
       percentile_cont(0.5) within group(order by [United States(USD)] desc) over( ) as 'USA 50%', 
       percentile_cont(0.5) within group(order by [Europe(EUR)] desc) over( ) as 'EUR 50%', 
	   percentile_cont(0.5) within group(order by [Japan(JPY)] desc) over( ) as 'JPY 50%', 
	   percentile_cont(0.5) within group(order by [United Kingdom(GBP)] desc) over( ) as 'GBP 50%', 
	   percentile_cont(0.5) within group(order by [Canada(CAD)] desc) over( ) as 'CAD 50%', 
	   percentile_cont(0.5) within group(order by [Switzerland(CHF)] desc) over( ) as 'CHF 50%',
	   percentile_cont(0.5) within group(order by [India(INR)] desc) over( ) as 'INR 50%', 
	   percentile_cont(0.5) within group(order by [China(CNY)]  desc) over( ) as 'CNY 50%', 
	   percentile_cont(0.5) within group(order by [Turkey(TRY)] desc) over( ) as 'TRY 50%', 
	   percentile_cont(0.5) within group(order by [Saudi Arabia(SAR)] desc) over( ) as 'SAR 50%', 
	   percentile_cont(0.5) within group(order by [Indonesia(IDR)] desc) over( ) as 'IDR 50%', 
	   percentile_cont(0.5) within group(order by [United Arab Emirates(AED)] desc) over( ) as 'AED 50%', 
	   percentile_cont(0.5) within group(order by [Thailand(THB)] desc) over( ) as 'THB 50%', 
	   percentile_cont(0.5) within group(order by [Vietnam(VND)] desc) over( ) as 'VND 50%', 
	   percentile_cont(0.5) within group(order by [Egypt(EGP)] desc) over( ) as 'EGP 50%', 
	   percentile_cont(0.5) within group(order by [South Korean(KRW)] desc) over( ) as 'KRW 50%', 
	   percentile_cont(0.5) within group(order by [Australia(AUD)] desc) over( ) as 'AUD 50%',
	   percentile_cont(0.5) within group(order by [South Africa(ZAR)] desc) over( ) as 'ZAR 50%'
FROM #temp_Gold_Prices 


--The UPPER QUARTILE(75%) Gold_Price of each Country/Nation from 1979-2021
SELECT TOP 1 
       percentile_cont(0.25) within group(order by [United States(USD)] desc) over( ) as 'USA 75%', 
       percentile_cont(0.25) within group(order by [Europe(EUR)] desc) over( ) as 'EUR 75%', 
	   percentile_cont(0.25) within group(order by [Japan(JPY)] desc) over( ) as 'JPY 75%', 
	   percentile_cont(0.25) within group(order by [United Kingdom(GBP)] desc) over( ) as 'GBP 75%', 
	   percentile_cont(0.25) within group(order by [Canada(CAD)] desc) over( ) as 'CAD 75%', 
	   percentile_cont(0.25) within group(order by [Switzerland(CHF)] desc) over( ) as 'CHF 75%',
	   percentile_cont(0.25) within group(order by [India(INR)] desc) over( ) as 'INR 75%', 
	   percentile_cont(0.25) within group(order by[China(CNY)]  desc) over( ) as 'CNY 75%', 
	   percentile_cont(0.25) within group(order by [Turkey(TRY)] desc) over( ) as 'TRY 75%', 
	   percentile_cont(0.25) within group(order by [Saudi Arabia(SAR)] desc) over( ) as 'SAR 75%', 
	   percentile_cont(0.25) within group(order by [Indonesia(IDR)] desc) over( ) as 'IDR 75%', 
	   percentile_cont(0.25) within group(order by [United Arab Emirates(AED)] desc) over( ) as 'AED 75%', 
	   percentile_cont(0.25) within group(order by [Thailand(THB)] desc) over( ) as 'THB 75%', 
	   percentile_cont(0.25) within group(order by [Vietnam(VND)] desc) over( ) as 'VND 75%', 
	   percentile_cont(0.25) within group(order by [Egypt(EGP)] desc) over( ) as 'EGP 75%', 
	   percentile_cont(0.25) within group(order by [South Korean(KRW)] desc) over( ) as 'KRW 75%', 
	   percentile_cont(0.25) within group(order by [Australia(AUD)] desc) over( ) as 'AUD 75%',
	   percentile_cont(0.25) within group(order by [South Africa(ZAR)] desc) over( ) as 'ZAR 75%'
FROM #temp_Gold_Prices 


--The Maximum/Outlier Gold_Price for each Country/Nation over the Period 1979-2021
SELECT MAX([United States(USD)]) as 'USD', MAX([Europe(EUR)]) as 'EUR', MAX([Japan(JPY)]) as 'JPY', 
MAX([United Kingdom(GBP)]) as 'GBP', MAX([Canada(CAD)]) as 'CAD', MAX([Switzerland(CHF)]) as 'CHF',
MAX([India(INR)]) as 'INR', MAX([China(CNY)]) as 'CNY', MAX([Turkey(TRY)]) as 'TRY',
MAX([Saudi Arabia(SAR)]) as 'SAR', MAX([Indonesia(IDR)]) as 'IDR', MAX([United Arab Emirates(AED)]) as 'AED',
MAX([Thailand(THB)]) as 'THB', MAX([Vietnam(VND)]) as 'VND', MAX([Egypt(EGP)]) as 'EGP', MAX([South Korean(KRW)]) as 'KRW', 
MAX([Australia(AUD)]) as 'AUD', MAX([South Africa(ZAR)]) as 'ZAR' 
FROM #temp_Gold_Prices


DROP TABLE #temp_Gold_Prices






