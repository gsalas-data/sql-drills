-- LEFT JOIN: returns every customer, including those with no orders
SELECT name, order_id, amount
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id;

-- INNER JOIN: returns only products that have a matching category
SELECT products.name, category_name
FROM products
INNER JOIN categories
    ON products.category_id = categories.category_id;

-- FULL JOIN: returns every product and every category, matched where possible
SELECT products.name, category_name
FROM products
FULL JOIN categories
    ON products.category_id = categories.category_id;

-- SELF JOIN: returns each employee alongside their manager's name
SELECT e.name AS employee_name, m.name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;
