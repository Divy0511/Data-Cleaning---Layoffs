-- data cleaning project

SELECT *
FROM layoffs;

-- goals: 
-- 1. remove duplicates.
-- 2. standerdize the data.
-- 3. handling null/blank/ empty values.
-- 4. remove any cloumnsif not needed.


-- creating a staging table, i.e cpy of raw data to make changes.

CREATE TABLE layoffs_staging
LIKE layoffs;




-- inserting data in it.

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;




-- removing duplicates

-- created a row number specfifc to each comany using partion by , so if there is any duplicates it will be numbered as 2,3 or more. 


SELECT *, 
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging;


-- create a cte and slect all the duplicate data by which has row number greater than 2;

WITH duplicate_cte as
(
SELECT *, 
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT * 
from duplicate_cte
where row_num > 1;


-- to delete the duplicates, will create a new table and then delete the row number >1; but we will create it and add row_num cloumn in it.


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- inserting int o the table 

insert into layoffs_staging2
SELECT *, 
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging;

-- deleteing the dupicates.

delete 
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2;









