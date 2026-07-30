-- Exercise 1: Find products with "Steel" anywhere in the name
SELECT * FROM products WHERE product_name LIKE '%Steel%';

-- Exercise 2: Find products whose name starts with "Pro"
SELECT * FROM products WHERE product_name LIKE 'Pro%';

-- Exercise 3: Customers with more than 3 non-cancelled orders
SELECT customer_id, COUNT(*)
FROM orders
WHERE status != 'cancelled'
GROUP BY customer_id
HAVING COUNT(*) > 3;

-- Exercise 4: Total amount per customer for completed orders, over $1000
SELECT customer_id, SUM(amount)
FROM orders
WHERE status LIKE 'complet%'
GROUP BY customer_id
HAVING SUM(amount) > 1000;

-- Exercise 5: Average price per category, over $25
SELECT category, AVG(price)
FROM products
GROUP BY category
HAVING AVG(price) > 25;

-- Exercise 6: Employees in Sales, Marketing, or Support
SELECT * FROM employees WHERE department IN ('Sales', 'Marketing', 'Support');

-- Exercise 7: Employees with salary between 40000 and 80000, highest first
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 80000 ORDER BY salary DESC;

-- Exercise 8: Electronics/Furniture products with "Deluxe" in the name
SELECT * FROM products
WHERE category IN ('Electronics', 'Furniture')
  AND product_name LIKE '%Deluxe%';

-- Exercise 9: Total amount per region (North/South/West), over $10,000
SELECT region, SUM(amount)
FROM orders
WHERE region IN ('North', 'South', 'West')
GROUP BY region
HAVING SUM(amount) > 10000;

-- Exercise 10: Orders in Q1 2026, id/date/amount only
SELECT id, order_date, amount
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY order_date ASC;

-- Exercise 11: Products with a 5-character code starting with "AB"
SELECT * FROM products WHERE product_code LIKE 'AB___';

-- Exercise 12: Customers NOT in USA, Canada, or Mexico
SELECT * FROM customers WHERE country NOT IN ('USA', 'Canada', 'Mexico');

-- Exercise 13: Avg amount per region for shipped orders between $20-$1000, over $150 avg
SELECT region, AVG(amount)
FROM orders
WHERE status LIKE 'ship%'
  AND amount BETWEEN 20 AND 1000
GROUP BY region
HAVING AVG(amount) > 150;
