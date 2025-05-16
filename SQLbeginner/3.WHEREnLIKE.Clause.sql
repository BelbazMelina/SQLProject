-- Where Clause 

select * 
from employee_salary 
where salary >= 5000 ;

select * 
from employee_demographics
where gender != 'Female'
;
select * 
from employee_demographics
where birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical Operators 

select * 
from employee_demographics
where birth_date > '1985-01-01' or gender = 'male'
;

-- Like statement 
-- % and _
# means anything % , and _ specific value 
select * 
from employee_demographics
where first_name LIKE '%er%'
;

select * 
from employee_demographics
where first_name LIKE 'a__'
;

select * 
from employee_demographics
where first_name LIKE 'a___%'
;
