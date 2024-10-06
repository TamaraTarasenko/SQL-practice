-- Data Science Salaries 2023 
-- https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023

select 
    count (*)            as cnt_all
	, count ( exp_level)  as cnt_level
	, count (distinct exp_level)  as cnt_level
from salaries
limit 10;

select 
    AVG (salary_in_usd)    as salary_avg
	, min (salary_in_usd)  as salary_min
	, max (salary_in_usd)  as salary_max
from salaries
where year = '2023'
limit 10;

select 
    year
	, salary_in_usd
	, salary_in_usd *38 as salary_in_uah
	--'SE' - Senior
	--'MI' - Middle
	--'Other'
	, CASE
	    when exp_level = 'SE'
		then 'Senior'
		when exp_level = 'MI'
		then 'Middle'
		Else 'Other' end as full_level
		-- name of collunm write after 'end'
from salaries
limit 30;


--1 task find salaries ML engineer in 2023 year
 

select 
    salary_in_usd
	, job_title
	, year
from salaries
where 
     year = 2023
	and job_title = 'ML Engineer'
	order by salary_in_usd
	
-- 2. task
--which country has the worth salary in 2023 year as Data Scientist
-- company_location is IN

SELECT *
from salaries
where
    job_title = 'Data Scientist'
	and year = 2023
order by salary_in_usd 
limit 1;

-- 3. task
--find top 5 salary where remote_ratio = 100

SELECT *
from salaries
where
    remote_ratio = 100	
order by salary_in_usd DESC
limit 5;

--4. task
-- display unique values of a column

SELECT DISTINCT company_location
from salaries

-- 5 task
---- display amount unique values of a column

SELECT count (DISTINCT company_location)
from salaries

-- 6 task
-- find AVG, Min, Max salaries for 2023 year

SELECT 
    AVG (salary_in_usd)     as avg_salary 
	, min (salary_in_usd)   as min_salary
	, max (salary_in_usd)   as max_salary
from salaries
where 
    year = 2023
    
-- 7 task
-- top 5 salaries in 2023 for 'ML Engineer' change in hrn

SELECT 
      *
from salaries
where 
    year = 2023
	and job_title = 'ML Engineer'
order by salary_in_usd DESC
limit 5;

-- 8 task 
-- display unique values of a column 'remote_ratio' with 
--two numbers  after koma

SELECT 
    DISTINCT Round((remote_ratio / 100.0), 2)
from salaries	

-- 9 task 
-- add column 'exp_level_full'

SELECT *
    , CASE
    when exp_level= 'MI' then 'Mid-level'
    when exp_level ='EN' then 'Entry_level'
	when exp_level= 'SE' then 'Senior_level'
    when exp_level= 'EX' then 'Executive_level' END  AS exp_level_full	
from salaries
limit 10;

SELECT *
    , CASE
    when salary_in_usd < 50000 then 'Category 1'
    when salary_in_usd < 100000 then 'Category 2'
    when salary_in_usd < 150000 then 'Category 3'
	ELSE  'Category 4' END     AS Category
from salaries
order by Category DESC
limit 10;

   -- 10 task 
   -- Count Nul
   
   select count (*)
   from salaries
   
    select count (salary_in_usd)
   from salaries
   
   select count (*) -  count (salary_in_usd)
   from salaries
   
   