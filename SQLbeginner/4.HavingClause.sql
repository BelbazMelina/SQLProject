-- Having vs Where 

Select gender , avg(age)
from employee_demographics
where AVG(age) > 40
Group by gender ; 
# ca  marche pas car AVG  NE SE CR2E QU'apres le group by , donc la , on essaie de filter avec le where 
#avant que ca ne se crée 

#probleme resolue avec having 
Select gender , avg(age)
from employee_demographics
Group by gender 
having AVG(age) > 40
;


Select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary)  >75000
;


# Having is compilated after the group by and the where before 

