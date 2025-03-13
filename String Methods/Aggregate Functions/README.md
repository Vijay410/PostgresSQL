# Lets Learn Aggregate Fucntion in the SQL.
# This I am going to explain in practical way by taking one scenario. 
# Lets Create Table
# Will Insert the data in table
# Will apply all the Aggregate Fucntions of SQL using PostgreSQL


---CREATE EMPLOYEE TABLE

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

--- Step 2: Insert Sample Data

INSERT INTO employees (name, department, salary, joining_date) VALUES
('Alice', 'IT', 70000, '2020-01-15'),
('Bob', 'HR', 50000, '2019-06-23'),
('Charlie', 'Finance', 60000, '2018-07-30'),
('David', 'IT', 80000, '2021-03-11'),
('Emma', 'Finance', 75000, '2020-11-25'),
('Frank', 'HR', 55000, '2019-09-14'),
('Grace', 'IT', 72000, '2022-05-01');


--- Step 3: Aggregate Functions in PostgreSQL
-- SUM()
SELECT SUM(salary) AS total_salary FROM employees;
--- AVG()
SELECT AVG(salary) AS average_salary FROM employees;
--- MIN()
SELECT MIN(salary) AS average_salary FROM employees;
--- MAX()
SELECT MAX(salary) AS average_salary FROM employees;
---COUNT()
SELECT COUNT(*) AS total_employees FROM employees;
--GROUP BY - Salary Per Department
SELECT department, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

--- HAVING - Departments Where Avg Salary > 60K

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- ARRAY_AGG: Use to Store Employee Names in an Array by department
SELECT department, ARRAY_AGG(name) AS employees_array
FROM employees
GROUP BY department;

--- STRING_AGG() - Combine Names of Employees in Each Department
SELECT department, STRING_AGG(name, ', ') AS employees_list
FROM employees
GROUP BY department;









