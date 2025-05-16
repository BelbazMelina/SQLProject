SELECT *  
from parks_and_recreation.employee_demographics;

SELECT first_name , 
last_name, 
birth_date,
age,
(age  + 10) * 10 + 10
from parks_and_recreation.employee_demographics;
# PEMDAS 
select distinct first_name
from parks_and_recreation.employee_demographics;

select distinct first_name, gender 
from parks_and_recreation.employee_demographics;


