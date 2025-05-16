-- Stored Procedures 

select *
from employee_salary
where salary >= 50000;

DELIMITER $$
create procedure large_salaries3()
begin
	select *
	from employee_salary
	where salary >= 50000 ;
	select *
	from employee_salary
	where salary >= 10000;
end $$ 
DELIMITER ;

call large_salaries3();


call larg_salaries();

DELIMITER $$
create procedure large_salaries4(employee_id int)
begin
	select salary 
	from employee_salary
    where employee_id = employee_id;
end $$ 
DELIMITER ;
 call  large_salaries4(1);