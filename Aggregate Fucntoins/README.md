# 📊 SQL Aggregate Functions - A Complete Guide

## 🚀 Introduction
SQL Aggregate Functions are powerful tools used to perform calculations on multiple rows of data, returning a single summarized value. These functions are widely used in reporting, data analysis, and database management.

---

## 📌 List of SQL Aggregate Functions
| Function  | Description |
|-----------|------------|
| **COUNT()** | Counts the number of rows |
| **SUM()**   | Returns the total sum of a numeric column |
| **AVG()**   | Returns the average value of a numeric column |
| **MIN()**   | Returns the minimum value in a column |
| **MAX()**   | Returns the maximum value in a column |
| **GROUP BY** | Groups rows with similar values |
| **HAVING**   | Filters groups based on conditions |

---

## 🏢 Real-World Scenario: E-Commerce Sales Analysis
Let's consider an **e-commerce** database where we track orders and customers. We will create a table to store order details and analyze sales using aggregate functions.

### **Creating the Orders Table**
```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_date DATE
);
```

### **Inserting Sample Data**
```sql
INSERT INTO orders (customer_id, product_category, order_amount, order_date) VALUES
(1, 'Electronics', 1200.50, '2024-03-01'),
(2, 'Clothing', 250.00, '2024-03-02'),
(3, 'Electronics', 800.00, '2024-03-05'),
(4, 'Home & Kitchen', 450.75, '2024-03-10'),
(1, 'Electronics', 1350.00, '2024-03-12'),
(2, 'Clothing', 175.50, '2024-03-15'),
(3, 'Home & Kitchen', 500.25, '2024-03-18');
```

---

## 📈 Detailed Examples
### 1️⃣ **COUNT() - Counting Orders**
Find the total number of orders placed.
```sql
SELECT COUNT(*) AS total_orders FROM orders;
```
🔹 *Returns the total number of orders in the system.*

### 2️⃣ **SUM() - Total Revenue by Category**
Calculate total sales revenue for each product category.
```sql
SELECT product_category, SUM(order_amount) AS total_sales
FROM orders
GROUP BY product_category;
```
🔹 *Returns total sales for each product category.*

### 3️⃣ **AVG() - Average Order Amount per Customer**
Find the average amount spent by each customer.
```sql
SELECT customer_id, AVG(order_amount) AS avg_spent
FROM orders
GROUP BY customer_id;
```
🔹 *Shows the average order value per customer.*

### 4️⃣ **MIN() & MAX() - Finding Minimum & Maximum Orders**
```sql
SELECT MIN(order_amount) AS smallest_order, MAX(order_amount) AS largest_order FROM orders;
```
🔹 *Finds the smallest and largest order values.*

---

## 🔄 Using `GROUP BY` with Aggregate Functions
### Finding Total Orders & Revenue Per Customer
```sql
SELECT customer_id, COUNT(order_id) AS total_orders, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id;
```
🔹 *Shows the number of orders and total amount spent per customer.*

### Filtering Groups with `HAVING`
Find customers who have spent more than $1000.
```sql
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) > 1000;
```
🔹 *Filters customers with total spending above $1000.*

---

## 🔥 Complex Query: Monthly Revenue & Customer Analysis
Find the total revenue, number of orders, and average order value per month for each product category.
```sql
SELECT 
    product_category, 
    DATE_TRUNC('month', order_date) AS month, 
    COUNT(order_id) AS total_orders, 
    SUM(order_amount) AS total_revenue, 
    AVG(order_amount) AS avg_order_value
FROM orders
GROUP BY product_category, DATE_TRUNC('month', order_date)
ORDER BY month, product_category;
```
🔹 *Generates a monthly sales summary for each product category.*

---

## 🔥 Best Practices for Using Aggregate Functions
✅ Use `WHERE` to filter data before aggregation for better performance.  
✅ Use `HAVING` only when filtering aggregated data.  
✅ Index columns used in `GROUP BY` for optimized queries.  
✅ Be mindful of `NULL` values in calculations. Use `COALESCE()` or `IFNULL()` when necessary.

---

## 🎯 Real-World Use Cases
📌 **E-commerce**: Calculate total sales per category.  
📌 **HR Analytics**: Find the average salary per job role.  
📌 **Finance**: Calculate the total expenses per month.  
📌 **Inventory Management**: Find the most stocked and least stocked products.

---

## 🔗 Additional Resources
- [Official MySQL Documentation](https://dev.mysql.com/doc/)
- [PostgreSQL Aggregate Functions](https://www.postgresql.org/docs/current/functions-aggregate.html)
- [SQL Server Aggregate Functions](https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql)

---

## 🎉 Conclusion
Mastering SQL Aggregate Functions is essential for data manipulation and reporting. With these functions, you can extract meaningful insights from large datasets efficiently. Keep practicing and experiment with real-world data to enhance your SQL skills! 🚀

