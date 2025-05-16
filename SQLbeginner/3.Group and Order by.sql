-- GROUP BY 

SELECT * 
from employee_demographics;

SELECT gender , avg(AGE)
from employee_demographics
group by gender 
;

SELECT occupation, salary
from employee_salary
group by occupation,salary
;

SELECT gender , avg(AGE), max(age),min(age),count(age)
from employee_demographics
group by gender 
;

-- ORDER BY 

SELECT *
from employee_demographics
order by GENDER , age DESC
;

# QUAND ON ORDER BY GENDER IL COMMENCE PAR FEMALE ,
#  et le ASC (du plus petit au plus grand) 
# est l'ordre par defaut pour les integer 

select *
from employee_demographics
order by 5,4 #la position des colonnes 
;

