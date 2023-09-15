  
  
			-- IN THIS PROJECT WE WILL BE ANALYSING EFFECT OF INFLACTION ON DEVELOPMENT INDICATORS ( DI )  ( EMPLOYMENT, UNEMPLOYMENT, GDP, POPULATION ) IN UK ECONOMY BETWEEN 1970 - 2023 YEARS




select year, avg(rate) as avg_inflation_rate
into dbo.yearly_inflation_rate -- creating table with yearly inflation
from [Inflation Rate SQL]
group by year


select year, avg(rate)  as avg_employment_rate
into dbo.yearly_employment_rate -- creating table with yearly employment
from [Employment Rate SQL]
where year between 1989 and 2023
group by year


select year, avg(rate) as avg_gdp_rate
into dbo.yearly_gdp_rate -- creating table with yearly gdp
from [GDP Rate SQL]
where year between 1989 and 2023
group by year


select year, avg(rate) as avg_unemployment_rate
into dbo.yearly_unemployment_rate -- creating table with yearly unemployment
from [Unemployment rate SQL] 
where year between 1989 and 2023
group by year

select year, population 
into dbo.yearly_population -- creating table with yearly population
from [Population SQL_]
where year between 1989 and 2023
group by year, population
-------------------------------------------------

-----------------------------------------------------------JOINING TABLES 

select yi.year,
yi.avg_inflation_rate,
ye.avg_employment_rate,
ygdp.avg_gdp_rate,
yu.avg_unemployment_rate,
yp.population
into dbo.yearly_development_indicators -- creating table with yearly development indicators
from yearly_inflation_rate as yi
left join yearly_employment_rate as ye on yi.year = ye.year
left join yearly_gdp_rate as ygdp on yi.year = ygdp.year
left join yearly_unemployment_rate as yu on yi.year = yu.year 
left join yearly_population as yp on yi.year = yp.year
----------------------------------------------------------------------------------------------------


select *
from yearly_development_indicators

-----------------------------------------------------------------------------------------------------
--which quater tend to have highest and lowest rate between years of records ? 
select quarter, avg(rate)as avg_inflation_rate
into dbo.avg_inflation_quarter
from [Inflation Rate SQL]
group by quarter

select quarter, avg(rate) as _avg_employment_rate
into dbo.avg_employment_quarter
from [Employment Rate SQL]
group by quarter

select quarter, avg(rate) as avg_unemployment_rate
into dbo.avg_unemployment_quarter
from [Unemployment rate SQL]
group by quarter

select quarter, avg(rate) as avg_gdp_rate
into dbo.avg_gdp_quarter
FROM [GDP Rate SQL]
group by quarter


select aiq.quarter,
aiq.avg_inflation_rate,
 aeq._avg_employment_rate,
 auq.avg_unemployment_rate,
  agq.avg_gdp_rate
  into dbo.development_indicators_quater -- creating table with avg development indicators by quater between years of records
from avg_inflation_quarter as aiq
left join avg_employment_quarter as aeq on aiq.quarter = aeq.quarter
left join avg_unemployment_quarter as auq on aiq.quarter = auq.quarter
left join avg_gdp_quarter as agq on aiq.quarter = agq.quarter
----------------------------------------------------------------------------------------------------------------------

select *
  from development_indicators_quater

-----------------------------------------------------------------------------------------------------------------













