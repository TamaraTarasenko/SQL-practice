-- show all spesialists with salary is  > avg in table

 select 
	* 
 from salaries 
where 
    salary_in_usd >
	(select 
	round (avg (salary_in_usd),2 ) 
 from salaries
	 where year = 2023
	)
	and year = 2023;
  
 --show all spesialist in country where avg salary is > then other 
 
  select
    company_location
	,round (avg (salary_in_usd), 2 )
from salaries
group by company_location
having avg (salary_in_usd) >  
(
select 
	round (avg (salary_in_usd),2 ) 
from salaries
where year = 2023
)
--------------------------------------------------

select *
from salaries
where residence IN
(
 select
    company_location
--,round (avg (salary_in_usd), 2 )
from salaries
where year = 2023
group by company_location
having avg (salary_in_usd) >  
(
select 
	round (avg (salary_in_usd),2 ) 
from salaries
where year = 2023
)
)

--------------------------------------------------------

--find min salary among the highest salaries by country

select *
from salaries
where year =2023
-----------------------

select
     company_location
    ,max (salary_in_usd)
from salaries
where year =2023
group by company_location
order by (max (salary_in_usd))

--------------------------------------------
select
min (salary_in_usd)
from 
(
select
     company_location
    ,max (salary_in_usd)
from salaries
where year =2023
group by company_location
order by (max (salary_in_usd))
)

-------------------------------------------
--in each  job_title output difference between avg salary and max salary 
select 
    round(max (salary_in_usd),2)  as max_salary
from salaries

-----------------
select
    job_title
    ,round(avg (salary_in_usd),2)
	-
	(
	select 
    round(max (salary_in_usd),2)  as max_salary
from salaries
	) as difference
from salaries
group by job_title


-----------------------

show all data about employ who have second place in tab

select *    
from 
(
	select *    
from salaries
order by salary_in_usd desc
limit 2
) as q
order by salary_in_usd
limit 1

------------------------

select *    
from salaries
order by salary_in_usd desc
limit 1 offset 1

-----------------------

select 
    trunc(salary_in_usd, -1)
    , count (*)
from salaries
group by 1
order by 2 desc

-------------------------
select 
    case 
	when salary_in_usd <= 10000 then 'A'
	when salary_in_usd <= 50000 then 'B'
	when salary_in_usd <= 100000 then 'C'
	when salary_in_usd <= 150000 then 'D'
	else 'E' end as salary_category
    , count (*)
from salaries
group by 1
order by 1

-------------------
select 
corr (remote_ratio, salary_in_usd)
from salaries

