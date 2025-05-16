-- joins 
select * 
from employee_demographics;

select *
from employee_salary;

select dem.employee_id,age,occupation
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;
#si la colonne est dans les deux colonne alors 
#il faut preciser de quelle table on parle (sinon erreur)

-- OUTER JOIN 

select *
from employee_demographics as dem
right  join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

#ca fait un match avec tout les elements de la table droite ave la gauche 

-- SELF JOIN 
select emp1.employee_id as imp_santa ,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name ,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id +1 = emp2.employee_id 
;

-- joining multiple tables together 

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
    inner join parks_departments as pd 
		on sal.dept_id = pd.department_id
;

select * 
from parks_departments;


