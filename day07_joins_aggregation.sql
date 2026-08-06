-- Self-join: pair each employee with their manager's name (LEFT JOIN keeps employees with no manager)
SELECT e.emp_name AS employee_name, m.emp_name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.emp_id;

-- LEFT JOIN + aggregation: total amount spent per customer, including customers with zero orders
SELECT customers.customer_id, customer_name, SUM(order_amount) AS total_amount
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name;

-- Same query, but COALESCE converts NULL totals to 0.00 for customers with no orders
SELECT customers.customer_id, customer_name, COALESCE(SUM(order_amount), 0) AS total_amount
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name;
