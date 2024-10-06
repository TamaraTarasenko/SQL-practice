Select * 
from salaries
limit 12;

select 
year
, exp_level AS level
, salary
from salaries
limit 12;

select 
year
, exp_level AS level
, salary
from salaries
WHERE 
    year !=2022
    AND exp_level = 'SE'
order by year 
limit 20;

--top 5 Data Science in 2023

select 
    year
	, job_title
	, salary
from salaries 
where
    year = 2023
	and job_title = 'Data Scientist'
order by salary_in_usd Desc
limit 5;