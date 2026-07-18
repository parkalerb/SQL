# 🚀 Sprint 02 - Day 002

# SQL CRUD Operations

---

## 🎯 Goal

Learn and practice complete CRUD (Create, Read, Update, Delete) operations in SQL along with table modification commands.

---

## 📚 Topics Covered

- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- DELETE
- ALTER TABLE
- ADD COLUMN
- DROP TABLE (Introduction)

---

## 💻 Practical Tasks

✔ Created Student Database

✔ Inserted Student Records

✔ Updated Student Marks

✔ Deleted a Student Record

✔ Added a New Column (Email)

✔ Updated Email Information

✔ Verified Changes using SELECT Queries

---

## 🔄 CRUD Operations

### Create

Used to create databases, tables, and insert records.

Examples:

- CREATE DATABASE
- CREATE TABLE
- INSERT

---

### Read

Retrieve records from the database.

Example:

```sql
SELECT * FROM Students;
```

---

### Update

Modify existing records.

Example:

```sql
UPDATE Students
SET marks = 90
WHERE student_id = 2;
```

---

### Delete

Remove records.

Example:

```sql
DELETE FROM Students
WHERE student_id = 5;
```

---

## 🎤 Interview Questions

### DELETE vs TRUNCATE vs DROP

| DELETE | TRUNCATE | DROP |
|---------|----------|------|
| Deletes selected rows | Removes all rows | Removes the entire table |
| WHERE clause supported | WHERE not allowed | Deletes structure + data |
| Can rollback (depends on DBMS/transaction) | Faster | Table no longer exists |

---

### What is ALTER?

ALTER modifies the structure of an existing table.

Examples:

- Add Column
- Modify Column
- Drop Column

---

### What are Constraints?

Constraints enforce rules on data.

Common Constraints:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK
- DEFAULT

---

## 📌 Learning Outcome

After completing this practical, I can:

- Perform complete CRUD operations.
- Modify table structure.
- Understand SQL constraints.
- Work with real database workflows.

---

## 📅 Progress

Sprint: 02

Day: 002

Status: ✅ Completed

---

## 👨‍💻 Author

Rohan Parkale