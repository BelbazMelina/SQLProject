-- Data cleaning

select * 
from layoffs;

-- 1. Remove Duplicates 
-- 2. Standardize the Data 
-- 3. Null Values or blank values 
-- 4. Remove Any columns or rows  


create table layoffs_stagings 
like layoffs;

select * 
from layoffs_stagings;

insert layoffs_stagings
select *
from layoffs;

select *,
row_number() over(
partition by company , industry , total_laid_off , percentage_laid_off,`date`) as row_num 
from layoffs_stagings;

with duplicate_cte as(
select *,
row_number() over(
partition by company ,location,  industry , total_laid_off , percentage_laid_off,`date`,stage,country,
funds_raised_millions) as row_num 
from layoffs_stagings
)

select * 
from duplicate_cte 
where row_num > 1;

select * 
from layoffs_stagings
where company = 'casper';

with duplicate_cte as(
select *,
row_number() over(
partition by company ,location,  industry , total_laid_off , percentage_laid_off,`date`,stage,country,
funds_raised_millions) as row_num 
from layoffs_stagings
)
delete  
from duplicate_cte 
where row_num > 1;

CREATE TABLE `layoffs_stagings2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE layoffs_stagings2 ADD row_num INT;


select * 
from layoffs_stagings2 where row_num> 1 ;

insert into layoffs_stagings2
select *,
row_number() over(
partition by company ,location,  industry , total_laid_off , percentage_laid_off,`date`,stage,country,
funds_raised_millions) as row_num 
from layoffs_stagings;


delete 
from layoffs_stagings2 where row_num> 1 ;

select *
from layoffs_stagings2;

-- Standardizing data 

select company, trim(company)
from layoffs_stagings2;

update layoffs_stagings2
set company = trim(company);

select distinct industry
from layoffs_stagings2;

update layoffs_stagings2
set industry ='crypto'
where industry like 'crypto%';


select distinct country, trim(trailing '.' from country)
from layoffs_stagings2
order by 1;

update 
layoffs_stagings2 set country = trim(trailing '.' from country)
where country like 'united states%';

select 
  `date`
from layoffs_stagings2;

update layoffs_stagings2
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_stagings2
modify column `date` date;

select *
from layoffs_stagings2
where total_laid_off is null 
and percentage_laid_off is null ;

select *
from layoffs_stagings2
where industry is null 
or industry = '';

select *
from layoffs_stagings2
where company = 'Airbnb';

select *
from layoffs_stagings2 t1
join layoffs_stagings2 t2
	on t1.company = t2.company 
where t1.industry is null  
and t2.industry is not null
;

update layoffs_stagings2
set industry = null 
where industry = '';

update layoffs_stagings2 t1
join layoffs_stagings2 t2
	on t1.company = t2.company 
set t1.industry = t2.industry 
where t1.industry is null 
and t2.industry is not null;

select *
from layoffs_stagings2
where company like 'bally%';

select *
from layoffs_stagings2;



select * 
from layoffs_stagings2
where total_laid_off is null
and percentage_laid_off is null ;

delete 
from layoffs_stagings2
where total_laid_off is null
and percentage_laid_off is null ;

select *
from layoffs_stagings2;

alter table layoffs_stagings2 
drop column  row_num;

select *
from layoffs_stagings2;








