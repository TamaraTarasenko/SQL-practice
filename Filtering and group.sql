-- Data filtering
 select *
   from salaries
   where year = 2023
limit 10;

 select *
   from salaries
   where year != 2023
limit 10;

 select *
   from salaries
where 
    exp_level = 'MI'
	and year not between 2020 and 2021
limit 30;

  select *
   from salaries
where 
    exp_level = 'MI'
	and year IN (2020, 2021)
-- or and year not IN (2020, 2021)
limit 30;
	
 select *
   from salaries
where 
    exp_level = 'MI'
	and year IN (2020, 2021)
-- or and year not IN (2020, 2021)
limit 30;

 select job_title
   from salaries
where 1=1
--and job_title like ('Data%')
-- or
-- and job_title like ('Data Sc%')
-- and job_title like ('Data_A%')
-- and job_title not like ('%Data%')
-- and job_title like ('_ata_A%')
    and job_title ilike ('data_A%')
-- and job_title like ('%Data%') 
limit 30;

 select *
   from salaries
where 
    exp_level is null
-- exp_level is not null
limit 30;


---------
 select distinct job_title
   from salaries
   
  select 
      job_title
	  , exp_level
      , count (*)            as job_nmb
	  , round (avg (salary_in_usd),2 ) as evg_salary
	  , min (salary_in_usd)  as min_salary
	  , max (salary_in_usd)  as max_salary
   from salaries 
   where year = 2023
   group by job_title, exp_level
   order by 1,2 desc;
----------------------------------------
-- find salary for job_title that occur only once or twise
select 
      job_title
      , count (*)            as job_nmb
	  , round (avg (salary_in_usd),2 ) as avg_salary
	  , min (salary_in_usd)  as min_salary
	  , max (salary_in_usd)  as max_salary
   from salaries 
   where year = 2023
   group by job_title
-- having count (*) = 1 having count (*) = 1
-- or
   having count (*) = 2
   order by 2;

-- find salary for job_title that occur only once or twise
select 
      job_title
      , count (*)            as job_nmb
	  , round (avg (salary_in_usd),2 ) as avg_salary
	  , min (salary_in_usd)  as min_salary
	  , max (salary_in_usd)  as max_salary
   from salaries 
   where year = 2023
   group by job_title
   having 
       count (*) = 2
      and round (avg (salary_in_usd),2 ) < 2000000
   order by 2;