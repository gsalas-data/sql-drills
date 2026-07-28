-- Employees in Sales with more than 3 years at the company
SELECT name, years_at_company
FROM employees
WHERE department = 'Sales' AND years_at_company > 3;

-- Employees in either Sales or Marketing
SELECT name
FROM employees
WHERE department = 'Sales' OR department = 'Marketing';

-- Employees in Sales or Marketing, using IN instead of OR
SELECT name
FROM employees
WHERE department IN ('Sales', 'Marketing');

-- Employees in Sales or Marketing earning between 40000 and 60000
SELECT name
FROM employees
WHERE department IN ('Sales', 'Marketing')
      AND salary BETWEEN 40000 AND 60000;

-- Verify: Sales/Marketing employees earning 50000-60000 (predicted Alice, Ella)
SELECT name, salary
FROM employees
WHERE department IN ('Sales', 'Marketing')
      AND salary BETWEEN 50000 AND 60000;
