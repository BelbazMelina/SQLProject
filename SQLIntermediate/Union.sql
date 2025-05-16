-- Unions

#we use Unions to combine rows as we use select clauses 

select age,gender
from employee_demographics
Union all
select  first_name,last_name
from employee_salary;




select  first_name,last_name, 'Old men' as label
from employee_demographics
where age > 40 and gender ='male'
Union 
select  first_name,last_name, 'Old lady' as label
from employee_demographics
where age > 40 and gender ='female'
union 
select  first_name,last_name, 'highly paid employee' as label
from employee_salary
where salary > 70000
order by first_name, last_name
;