-- working with null values

-- updating the industry in tablle where the inudstry has null/empty values


SELECT t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where ( t1.industry is null ) and t2.industry is not null;


update layoffs_staging2
set industry = null
where industry = '';


update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where ( t1.industry is null or t1.industry = '') and t2.industry is not null;


select *
from layoffs_staging2;

-- droping row_num


alter table layoffs_staging2
drop column row_num;


