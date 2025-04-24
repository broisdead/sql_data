# sql_data
✅ Objective
Learn to manipulate and analyze structured data using SQL — covering filtering, joining, aggregation, views, and performance optimization.

📦 Step 1: Dataset Setup
We created three core tables for an Ecommerce scenario:

1. customers
Stores customer info like name, email, country.

2. products
Stores product details like name and price.

3. orders
Tracks customer orders with order value and date.

🔄 Step 2: Data Insertion
We inserted a few rows into each table to simulate real-world Ecommerce data.

🔍 Step 3: SQL Operations
✅ a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT * FROM customers; → view all customers

SELECT * FROM orders WHERE order_value > 500;

ORDER BY order_value DESC

GROUP BY customer_id → total spent per customer

🔗 b. JOINS (INNER, LEFT, RIGHT)
SELECT orders.order_id, customers.customer_name, orders.order_value
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
📌 c. Subqueries
Used subqueries to get customers with max orders, or total orders by specific criteria.

📊 d. Aggregate Functions (SUM, AVG, COUNT)
SUM(order_value) to get total spending

AVG(price) to get average product price

