-- Day 4: Practice exercises (customers + employees)

-- 1. Name and city of customers who signed up before 2023
SELECT name, city
FROM customers
WHERE signup_year < 2023;

-- 2. All distinct cities customers are located in
SELECT DISTINCT city
FROM customers;

-- 3. Name and signup_year for customers who signed up in 2022 or 2023, oldest to newest
SELECT name, signup_year
FROM customers
WHERE signup_year IN (2022, 2023)
ORDER BY signup_year ASC;

-- 4. Count of customers per city
SELECT city, COUNT(*)
FROM customers
GROUP BY city;

-- 5. Customers whose city starts with 'M'
SELECT name
FROM customers
WHERE city LIKE 'M%';

-- 6. Employees earning between 45000 and 65000
SELECT name, salary
FROM employees
WHERE salary BETWEEN 45000 AND 65000;

-- 7. Total salary cost per department
SELECT department, SUM(salary)
FROM employees
GROUP BY department;

-- 8. Departments with more than 2 employees
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 9. Employees with 5+ years at the company, most tenured first
SELECT name, department, years_at_company
FROM employees
WHERE years_at_company >= 5
ORDER BY years_at_company DESC;

-- 10. Company-wide minimum and maximum salary
SELECT MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary
FROM employees;
