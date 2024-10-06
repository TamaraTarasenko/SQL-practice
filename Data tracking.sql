select
    job_title
	, count (*)
from salaries
group by 1
order by 2 desc
limit 10

----
select
    job_title
	, exp_level
	, round (min(salary_in_usd),2)
	, round (max(salary_in_usd),2)
	, round (avg (salary_in_usd),2)
	, round (stddev(salary_in_usd),2)
from salaries
group by 1,2
	
