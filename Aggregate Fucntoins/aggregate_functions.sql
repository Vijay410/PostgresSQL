-- Creating the Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_date DATE
);

-- Inserting Sample Data
INSERT INTO orders (customer_id, product_category, order_amount, order_date) VALUES
(1, 'Electronics', 1200.50, '2024-03-01'),
(2, 'Clothing', 250.00, '2024-03-02'),
(3, 'Electronics', 800.00, '2024-03-05'),
(4, 'Home & Kitchen', 450.75, '2024-03-10'),
(1, 'Electronics', 1350.00, '2024-03-12'),
(2, 'Clothing', 175.50, '2024-03-15'),
(3, 'Home & Kitchen', 500.25, '2024-03-18');

-- Counting Orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Total Revenue by Category
SELECT product_category, SUM(order_amount) AS total_sales
FROM orders
GROUP BY product_category;

-- Average Order Amount per Customer
SELECT customer_id, AVG(order_amount) AS avg_spent
FROM orders
GROUP BY customer_id;

-- Finding Minimum & Maximum Orders
SELECT MIN(order_amount) AS smallest_order, MAX(order_amount) AS largest_order FROM orders;

-- Total Orders & Revenue Per Customer
SELECT customer_id, COUNT(order_id) AS total_orders, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- Filtering Customers Who Spent More Than $1000
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) > 1000;

-- Monthly Revenue & Customer Analysis
SELECT 
    product_category, 
    DATE_TRUNC('month', order_date) AS month, 
    COUNT(order_id) AS total_orders, 
    SUM(order_amount) AS total_revenue, 
    AVG(order_amount) AS avg_order_value
FROM orders
GROUP BY product_category, DATE_TRUNC('month', order_date)
ORDER BY month, product_category;
