-- Day 4: NULL handling and aggregate functions

-- Find customers with a missing signup_year
SELECT *
FROM customers
WHERE signup_year IS NULL;

-- Find customers with a recorded signup_year, showing name and year
SELECT name, signup_year
FROM customers
WHERE signup_year IS NOT NULL;

-- Count of all employees and their average salary
SELECT COUNT(*), AVG(salary)
FROM employees;

-- Highest salary per department
SELECT department, MAX(salary)
FROM employees
GROUP BY department;

-- Departments with average salary above 55000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;


