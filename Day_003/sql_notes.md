# SQL Notes - MySQL Database Connection & Schema Design

## 📖 Introduction

SQL (Structured Query Language) is the standard language used to communicate with relational databases.

MySQL is one of the most popular Relational Database Management Systems (RDBMS) used in web applications, enterprise software, and data-driven projects.

In today's practical, we learned how to create a database, design tables, and establish relationships using Primary Keys and Foreign Keys.

---

# 🚀 Why MySQL?

MySQL is used because it is:

- Open Source
- Fast and Reliable
- Easy to Learn
- Secure
- Scalable
- Widely used in the industry

---

# 💻 Installing MySQL

Download and install:

- MySQL Server
- MySQL Workbench

During installation:

- Create a root password
- Keep the default port (3306)
- Complete the setup

---

# 🗄️ Creating a Database

A database is a collection of related tables.

### Syntax

```sql
CREATE DATABASE traffic_management;
```

Select the database

```sql
USE traffic_management;
```

---

# 📋 Tables

A table stores related information in rows and columns.

Example:

```
Users
-------------------------
user_id
full_name
email
password
role
```

---

# 🔑 Primary Key

A Primary Key uniquely identifies each row in a table.

Properties:

- Unique
- Cannot be NULL
- Only one Primary Key per table

Example

```sql
user_id INT PRIMARY KEY AUTO_INCREMENT
```

---

# 🔗 Foreign Key

A Foreign Key creates a relationship between two tables.

Example

```sql
FOREIGN KEY (user_id)
REFERENCES users(user_id)
```

Advantages

- Maintains data integrity
- Prevents invalid data
- Connects related tables

---

# 🔒 Constraints

Constraints are rules applied to columns to maintain data accuracy.

Common Constraints

| Constraint | Purpose |
|------------|---------|
| PRIMARY KEY | Unique record |
| FOREIGN KEY | Relationship |
| NOT NULL | Cannot be empty |
| UNIQUE | No duplicate values |
| DEFAULT | Default value |
| AUTO_INCREMENT | Automatically increases ID |

---

# 🔄 CRUD Operations

CRUD stands for:

- Create
- Read
- Update
- Delete

Examples

Create

```sql
INSERT INTO users (...)
VALUES (...);
```

Read

```sql
SELECT * FROM users;
```

Update

```sql
UPDATE users
SET role = 'Admin'
WHERE user_id = 1;
```

Delete

```sql
DELETE FROM users
WHERE user_id = 2;
```

---

# 📊 Normalization

Normalization is the process of organizing database tables to reduce redundancy and improve data integrity.

### Benefits

- Reduces duplicate data
- Improves consistency
- Saves storage
- Easier maintenance

### Normal Forms

### First Normal Form (1NF)

- Atomic values
- No repeating groups

### Second Normal Form (2NF)

- Must satisfy 1NF
- Removes partial dependency

### Third Normal Form (3NF)

- Must satisfy 2NF
- Removes transitive dependency

---

# 📌 Indexes

An Index improves the speed of data retrieval.

Example

```sql
CREATE INDEX idx_vehicle_number
ON vehicles(vehicle_number);
```

Advantages

- Faster searching
- Faster sorting
- Improved query performance

Disadvantages

- Requires additional storage
- Slightly slower INSERT and UPDATE operations

---

# 🌍 Real-World Applications

MySQL is widely used in:

- Banking Systems
- E-commerce Platforms
- Hospital Management
- Student Management
- Traffic Management
- Inventory Systems
- Social Media Applications

---

# 📚 SQL Commands Learned

| Command | Purpose |
|----------|---------|
| CREATE DATABASE | Create a database |
| USE | Select a database |
| CREATE TABLE | Create a table |
| INSERT INTO | Insert records |
| SELECT | Retrieve data |
| UPDATE | Modify data |
| DELETE | Remove data |
| SHOW TABLES | List all tables |
| DESCRIBE | Show table structure |

---

# 🎯 Interview Questions

## 1. What is SQL?

SQL (Structured Query Language) is used to create, manage, and manipulate relational databases.

---

## 2. What is MySQL?

MySQL is an open-source Relational Database Management System (RDBMS).

---

## 3. What is a Primary Key?

A Primary Key uniquely identifies each record in a table.

Example:

```
user_id
```

---

## 4. What is a Foreign Key?

A Foreign Key is a column that references the Primary Key of another table, creating a relationship between them.

---

## 5. Difference between Primary Key and Foreign Key

| Primary Key | Foreign Key |
|--------------|-------------|
| Uniquely identifies a row | References another table |
| Cannot contain duplicate values | Can contain duplicate values |
| One per table | Multiple allowed |

---

## 6. What is Normalization?

Normalization is the process of organizing data to reduce redundancy and improve consistency.

---

## 7. What are Indexes?

Indexes improve the speed of searching and retrieving data from a database.

---

## 8. Why do we use Constraints?

Constraints help maintain:

- Data Integrity
- Accuracy
- Consistency
- Valid Relationships

---

# 📝 Summary

Today I learned how to create and connect a MySQL database, design relational tables, and establish relationships using Primary Keys and Foreign Keys.

Key concepts covered:

- MySQL Installation
- Database Creation
- Table Creation
- Primary Key
- Foreign Key
- Constraints
- CRUD Operations
- Normalization
- Indexes

I also designed the database schema for the **Traffic Management System**, which provides a solid foundation for integrating SQL with backend applications in future projects.