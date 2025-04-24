CREATE DATABASE your_database_name;
USE your_database_name;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_value DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);
INSERT INTO customers (customer_id, customer_name, email, country) VALUES
(1, 'John Doe', 'john@example.com', 'USA'),
(2, 'Alice Smith', 'alice@example.com', 'UK'),
(3, 'Bob Johnson', 'bob@example.com', 'Canada'),
(4, 'Maria Garcia', 'maria@example.com', 'Spain');

INSERT INTO products (product_id, product_name, price) VALUES
(101, 'Laptop', 800),
(102, 'Phone', 500),
(103, 'Headphones', 150),
(104, 'Mouse', 25);

INSERT INTO orders (order_id, customer_id, product_id, order_value, order_date) VALUES
(1001, 1, 101, 800, '2025-01-15'),
(1002, 2, 102, 500, '2025-01-17'),
(1003, 3, 103, 150, '2025-01-18'),
(1004, 4, 104, 25, '2025-01-20'),
(1005, 1, 102, 500, '2025-02-01');

SELECT * FROM customers;
SELECT product_name, price 
FROM products 
WHERE price > 100;
SELECT product_name, price 
FROM products 
ORDER BY price DESC 
LIMIT 5;
SELECT product_name, price 
FROM products 
ORDER BY price DESC 
LIMIT 5;
SELECT customer_id, SUM(order_value) AS total_spent 
FROM orders 
GROUP BY customer_id;
SELECT customers.customer_name, SUM(orders.order_value) AS total_orders
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_name;
SELECT customers.customer_name, orders.order_id, orders.order_value
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
SELECT orders.order_id, customers.customer_name
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
SELECT customer_id, SUM(order_value) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > (SELECT AVG(order_value) FROM orders);
SELECT product_name, SUM(order_value) AS total_sales
FROM orders
INNER JOIN products ON orders.product_id = products.product_id
GROUP BY product_name;
SELECT customer_id, AVG(order_value) AS average_order_value
FROM orders
GROUP BY customer_id;
CREATE VIEW top_customers AS
SELECT customer_id, SUM(order_value) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 500;

CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_order_date ON orders(order_date);












