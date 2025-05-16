-- winsows functions

select gender , avg(salary) as avg_salary
from employee_demographics dm
join employee_salary sal
	ON dm.employee_id = sal.employee_id
group by gender 
;

select dm.first_name,dm.last_name, gender , avg(salary) over(partition by gender)
from employee_demographics dm
join employee_salary sal
	ON dm.employee_id = sal.employee_id
;

select dm.first_name,dm.last_name, gender ,salary, sum(salary) over(partition by gender order by dm.employee_id) as rolling_sum
from employee_demographics dm
join employee_salary sal
	ON dm.employee_id = sal.employee_id
;

select dm.employee_id, dm.first_name,dm.last_name, gender ,salary, 
row_number() over(partition by gender  order by salary desc) as row_num,
rank() over(partition by gender  order by salary desc) as rank_num,
dense_rank() over(partition by gender  order by salary desc) as dens_rank_num
from employee_demographics dm
join employee_salary sal
	ON dm.employee_id = sal.employee_id
;





