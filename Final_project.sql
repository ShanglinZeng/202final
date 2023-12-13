-- DSC202 Final Project Group9
-- Create Table for our data
-- Salary table
CREATE Table IF NOT EXISTS salaries (
    work_year INTEGER,
    experience_level VARCHAR(20),
    employment_type VARCHAR(20),
    job_title VARCHAR(50),
    salary INTEGER,
    salary_currency VARCHAR(20),
    salary_in_usd INTEGER,
    employee_residence VARCHAR(20),
    remote_ratio INTEGER,
    company_location VARCHAR(20),
    company_size VARCHAR(1)
);
-- Job description table
CREATE Table IF NOT EXISTS original_Cleaned_DS_Jobs (
    job_title VARCHAR(255),
    salary_estimate VARCHAR(255),
    job_description TEXT,
    rating NUMERIC(10,1),
    company_name VARCHAR(255),
    location VARCHAR(255),
    headquarters VARCHAR(255),
    size VARCHAR(255),
    ownership_type VARCHAR(50),
    industry VARCHAR(50),
    sector VARCHAR(50),
    revenue VARCHAR(50),
    min_salary INT,
    max_salary INT,
    avg_salary INT,
    job_state VARCHAR(20),
    same_state BOOLEAN,
    company_age INT,
    python BOOLEAN,
    excel BOOLEAN,
    hadloop BOOLEAN,
    spark BOOLEAN,
    aws BOOLEAN,
    tableau BOOLEAN,
    big_data BOOLEAN,
    job_simp VARCHAR(20),
    seniority BOOLEAN
);

-- DROP description column
ALTER TABLE original_Cleaned_DS_Jobs
DROP COLUMN job_description;

-- Q1 Query
SELECT job_title, AVG(salary) AS avg_salary
FROM salaries
WHERE experience_level = 'EN' AND company_location = 'US' AND work_year = 2023
GROUP BY job_title;

-- Q2 Query
SELECT company_name, company_age, AVG(avg_salary) as avg_salary, job_title
FROM "original_cleaned_ds_jobs"
WHERE LOWER(job_title) = 'data scientist' AND company_age != -1
GROUP BY company_name, job_title, company_age
ORDER BY avg_salary DESC
LIMIT 10;


--Q4 Data Cleaning
SELECT
    company_name,
    AVG(avg_salary) AS average_salary,
    job_simp,
    python,
    excel,
    hadoop,
    spark,
    aws,
    tableau
FROM original_cleaned_ds_jobs
WHERE job_simp <> 'na'
GROUP BY company_name, job_simp, python, excel, hadoop, spark, aws, tableau;

