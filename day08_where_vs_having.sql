-- Q1: Total order amount per customer in the West region, over $1000
SELECT customer_id, SUM(amount)
FROM orders
WHERE region = 'West'
GROUP BY customer_id
HAVING SUM(amount) > 1000;

-- Q2: Order id, customer name, order date for orders with a matching customer (INNER JOIN)
SELECT o.order_id, c.name, o.order_date
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Q3: Every customer's name and order id, including customers with no orders (LEFT JOIN)
SELECT o.order_id, c.name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- Q4: Total quantity sold per product, highest to lowest
SELECT product_id, SUM(quantity)
FROM order_items
GROUP BY product_id
ORDER BY SUM(quantity) DESC;

-- Q5: Product name and total revenue (quantity * price), including unsold products
SELECT p.product_id, p.name, SUM(o.quantity * p.price) AS total_revenue
FROM products AS p
LEFT JOIN order_items AS o
    ON p.product_id = o.product_id
GROUP BY p.product_id, p.name;

-- Q6: Pairs of customers who signed up on the same date, no duplicate pairs
SELECT c.name, p.name
FROM customers AS c
INNER JOIN customers AS p
    ON c.signup_date = p.signup_date
    AND c.customer_id < p.customer_id;

-- Q7: Customer name and average order amount, rounded, only customers with more than 2 orders
SELECT c.customer_id, c.name, ROUND(AVG(o.amount), 2)
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 2;

-- Q8: Every order_item with its product name, including order_items with no matching product (RIGHT JOIN)
SELECT o.order_item_id, o.product_id, p.name
FROM products AS p
RIGHT JOIN order_items AS o
    ON o.product_id = p.product_id;

-- Q9: Order id, order date, customer name for orders from customers who signed up in 2024
SELECT o.order_id, o.order_date, c.name
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE YEAR(c.signup_date) = 2024;

-- Q10: Customer name and count of distinct products ordered
SELECT c.name, COUNT(DISTINCT oi.product_id)
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.name;
