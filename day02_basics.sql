-- Select the name and city of every customer
SELECT name, city
FROM customers;

-- Show name and signup_year for customers who signed up in 2024
SELECT name, signup_year
FROM customers
WHERE signup_year = 2024;

-- Customers in Orlando or Miami, sorted alphabetically by name
SELECT name, city
FROM customers
WHERE city = 'Orlando' OR city = 'Miami'
ORDER BY name ASC;

-- Distinct signup years across all customers
SELECT DISTINCT signup_year
FROM customers;

-- Name and year for the 2 oldest signups
SELECT name, signup_year
FROM customers
ORDER BY signup_year ASC
LIMIT 2;
