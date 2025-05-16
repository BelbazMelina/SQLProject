-- CTEs

with CTE_EXAMPLE as
(
select gender , avg(salary) as avg_sal , max(salary) as max_sal,
count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender)
select avg(avg_sal)
from CTE_Example
 ;
 
 select avg(avg_sal)
 from
( select gender , avg(salary) as avg_sal , max(salary) as max_sal,
count(salary) as count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender) as example_subuery
 ;
 
 
with CTE_EXAMPLE as
(
select employee_id , gender , birth_date
from employee_demographics 
where birth_date > '1985-01-01'
),
CTE_Example2 as 
(
select employee_id, salary 
from employee_salary
where salary > 50000
)
select * 
from CTE_Example
join CTE_Example2
	on CTE_Example.employee_id = CTE_Example2.employee_id
;


 
 
 