-- Exploratory Data Analysis 

select *
from layoffs_stagings2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_stagings2;

select *
from layoffs_stagings2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company , sum(total_laid_off)
from layoffs_stagings2
group by company 
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_stagings2;
 
select industry , sum(total_laid_off)
from layoffs_stagings2
group by industry
order by 2 desc;

select *
from layoffs_stagings2;

select company , avg(total_laid_off)
from layoffs_stagings2
group by company
order by 2 desc;




select *
from layoffs_stagings2;

with rolling_total as (
select substring(`date`,1,7) as month , sum(total_laid_off) as total_off
from layoffs_stagings2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`,  total_off,
sum(total_off) over(order by `month`) as rolling_Total
from rolling_total;


select company ,year(`date`), sum(total_laid_off)
from layoffs_stagings2
group by company,year(`date`)
order by 3 desc;

WITH company_year (company, years, total_laid_off) AS (
  SELECT company, YEAR(`date`), SUM(total_laid_off)
  FROM layoffs_stagings2
  GROUP BY company, YEAR(`date`)
), 
company_year_rank AS (
  SELECT *, 
         DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM company_year
  WHERE years IS NOT NULL
)
select *
from company_year_rank
where ranking <= 5 ;



