---create table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

--- Insert the data
INSERT INTO employees (name, department) VALUES
('Alice Johnson', 'Engineering'),
('Bob Smith', 'Marketing'),
('Charlie Brown', 'Finance'),
('David Lee', 'Engineering');

--- Apply the string functions to manipulate the data
