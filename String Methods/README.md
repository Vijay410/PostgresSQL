# PostgreSQL String Functions

This repository contains a list of useful PostgreSQL string functions along with examples for easy reference.

## 📌 Common String Functions

### 🗄️ Creating a Sample Table and Inserting Data
Before performing string operations, let's create a table and insert some sample data.

```sql
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees (name, department) VALUES
('Alice Johnson', 'Engineering'),
('Bob Smith', 'Marketing'),
('Charlie Brown', 'Finance'),
('David Lee', 'Engineering');
```

## 📌 String Functions and Their Usage

### 1️⃣ **LENGTH(string)**
**How it works:** Returns the number of characters in a given string.
```sql
SELECT name, LENGTH(name) FROM employees;
```

### 2️⃣ **UPPER(string) / LOWER(string)**
**How it works:** Converts a string to uppercase or lowercase.
```sql
SELECT name, UPPER(name), LOWER(name) FROM employees;
```

### 3️⃣ **CONCAT(string1, string2, ...)**
**How it works:** Joins multiple strings into one.
```sql
SELECT CONCAT(name, ' - ', department) FROM employees;
```

### 4️⃣ **CONCAT_WS(separator, string1, string2, ...)**
**How it works:** Joins multiple strings using a specified separator.
```sql
SELECT CONCAT_WS(' | ', name, department) FROM employees;
```

### 5️⃣ **LEFT(string, n) / RIGHT(string, n)**
**How it works:** Extracts the first `n` characters (LEFT) or last `n` characters (RIGHT) from a string.
```sql
SELECT name, LEFT(name, 4), RIGHT(name, 3) FROM employees;
```

### 6️⃣ **SUBSTRING(string FROM start FOR length)**
**How it works:** Extracts a substring starting from a specific position for a given length.
```sql
SELECT name, SUBSTRING(name FROM 1 FOR 5) FROM employees;
```

### 7️⃣ **POSITION(substring IN string)**
**How it works:** Finds the starting position of a substring within a string (1-based index).
```sql
SELECT name, POSITION('o' IN name) FROM employees;
```

### 8️⃣ **TRIM([BOTH | LEADING | TRAILING] characters FROM string)**
**How it works:** Removes leading, trailing, or both occurrences of specified characters (default is whitespace).
```sql
SELECT TRIM(' A ') AS trimmed_string;
```

### 9️⃣ **REPLACE(string, old_substring, new_substring)**
**How it works:** Replaces occurrences of a substring with a new substring.
```sql
SELECT name, REPLACE(name, 'o', '*') FROM employees;
```

### 🔟 **REVERSE(string)**
**How it works:** Reverses the order of characters in a string.
```sql
SELECT name, REVERSE(name) FROM employees;
```

### 1️⃣1️⃣ **STRING_AGG(expression, delimiter)**
**How it works:** Concatenates values from multiple rows into a single string, using a delimiter.
```sql
SELECT STRING_AGG(name, ', ') FROM employees;
```

### 1️⃣2️⃣ **INITCAP(string)**
**How it works:** Capitalizes the first letter of each word in a string.
```sql
SELECT INITCAP(name) FROM employees;
```

---
## 📖 References
- [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)

## 📬 Contact
For any issues or suggestions, feel free to reach out!

🚀 Happy Coding!

