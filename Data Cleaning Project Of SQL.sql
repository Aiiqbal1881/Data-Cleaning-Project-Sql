-- PROJECT OF SQL

-- DATA CLEANING


SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values or Blank values
-- 4. Remove any columns


-- creating table like layoffs
CREATE TABLE layoffs_stagging
LIKE layoffs;


SELECT *
FROM layoffs_stagging ;

-- inserting 
INSERT layoffs_stagging
SELECT *
FROM layoffs ;


-- REMOVING DUPLICATE OR CHECKING UNIQUE VALUE


SELECT *,
ROW_NUMBER () OVER (
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date' ) AS row_num
FROM layoffs_stagging ;


-- using cte to identify duplicate if exists
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER () OVER (
PARTITION BY company, location,industry, total_laid_off, percentage_laid_off, 'date' ,stage, country, funds_raised_millions ) AS row_num
FROM layoffs_stagging 
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1 ;

-- checking its perform well
SELECT *
FROM layoffs_stagging
WHERE company = 'Casper';



WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER () OVER (
PARTITION BY company, location,industry, total_laid_off, percentage_laid_off, 'date' ,stage, country, funds_raised_millions ) AS row_num
FROM layoffs_stagging 
)
DELETE  
FROM duplicate_cte
WHERE row_num > 1 ;


CREATE TABLE `layoffs_stagging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_stagging2 ;

INSERT INTO layoffs_stagging2
SELECT *,
ROW_NUMBER () OVER (
PARTITION BY company, location,industry, total_laid_off, percentage_laid_off, 'date' ,stage, country, funds_raised_millions ) AS row_num
FROM layoffs_stagging ;

SELECT *
FROM layoffs_stagging2 
WHERE row_num > 1;


-- delete
DELETE
FROM layoffs_stagging2 
WHERE row_num > 1;

SELECT *
FROM layoffs_stagging2 
;


-- Standardizing the Data
SELECT company, TRIM(company)
FROM layoffs_stagging2;

UPDATE layoffs_stagging2
SET company = TRIM(company);  -- update in both company as well as trim(company) it's already updated by using update fun.

SELECT DISTINCT(industry)
FROM layoffs_stagging2
ORDER BY 1;


SELECT  *
FROM layoffs_stagging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT  DISTINCT industry
FROM layoffs_stagging2
ORDER BY 1;

SELECT  DISTINCT location
FROM layoffs_stagging2
ORDER BY 1;

SELECT  *
FROM layoffs_stagging2
ORDER BY 1;

SELECT *
FROM layoffs_stagging2
WHERE country LIKE 'United States%';

UPDATE layoffs_stagging2
SET country = 'United States'
WHERE country LIKE 'United States%';

-- ANOTHER WAY TO DO (ALREADY I HAVE DONE ABOVE SO I JUST DO PRACTICE)
-- SELECT DISTINCT country , TRIM(TRAILING '.' FROM country)
-- FROM layoffs_stagging2
-- ORDER BY 1;

-- UPDATE layoffs_stagging2
-- SET country = TRIM(TRAILING '.' FROM country)
-- WHERE country LIKE 'United States%';

 -- Changing the text date into Date number
 
 SELECT `date`,
 STR_TO_DATE(`date`,'%m/%d/%Y') 
 FROM layoffs_stagging2;


UPDATE layoffs_stagging2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y') ;

SELECT `date`
FROM layoffs_stagging2
ORDER BY 1;

-- TEXT DATA INTO ACTUAL DATE
ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE ;


--  NULL VALUES

SELECT *
FROM layoffs_stagging2 ;

SELECT *
FROM layoffs_stagging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

 
 SELECT DISTINCT(industry)
 FROM layoffs_stagging2 
 ORDER BY 1;
 
 SELECT *
 FROM layoffs_stagging2
 WHERE industry IS NULL 
 OR industry = ''
 ;
 
 SELECT *
 FROM layoffs_stagging2
 WHERE company = 'Airbnb' ;
 
 -- NOW update WITH JOIN INNULL
SELECT *
FROM layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL
; 

SELECT t1.industry , t2.industry
FROM layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL
; 

-- now update
UPDATE layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL
; 


-- no change becoz something miss in data
UPDATE layoffs_stagging2
SET industry = NULL
WHERE industry = '';


-- all value null so remove ''
UPDATE layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL
; 


-- another company industry
 SELECT *
 FROM layoffs_stagging2
 WHERE industry IS NULL 
 OR industry = ''
 ;
 
 SELECT *
 FROM layoffs_stagging2
 WHERE company LIKE 'Bally%';


-- REMOVE COLUMN NO.4 STEP
SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

DELETE
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

SELECT *
FROM layoffs_stagging2 ;


ALTER TABLE layoffs_stagging2
DROP COLUMN row_num;