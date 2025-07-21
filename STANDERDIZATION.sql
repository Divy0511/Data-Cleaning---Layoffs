-- 2.STANDARDIZING DATA


-- triming the company name into single format.


SELECT company,trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);


-- standersing the industry column.

SELECT distinct industry
from layoffs_staging2
order by 1;

SELECT *
from layoffs_staging2
where industry like 'Crypto%';



update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';


-- checking location

SELECT distinct location
from layoffs_staging2
order by 1;


-- checking country 

SELECT distinct country
from layoffs_staging2
order by 1;


update layoffs_staging2
set country = 'United States'
where country like 'United States%';

-- updating date format


update layoffs_staging2
set `date` = str_to_date(`date` ,'%m/%d/%Y');


SELECT `date`
from layoffs_staging2;


alter table layoffs_staging2
modify column `date` date;

SELECT distinct stage
from layoffs_staging2
order by 1;




