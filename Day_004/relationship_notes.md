# SQL Relationships & JOINs Notes

## 📖 Introduction

Relational databases store data in multiple tables and connect those tables using relationships.

Relationships help avoid unnecessary data duplication and make databases easier to maintain.

In today's practical, I worked with the Traffic Management database and implemented relationships between:

* Users
* Vehicles
* Signals
* Incidents

I also practiced `INNER JOIN` and `LEFT JOIN`.

---

# 🔗 Foreign Key

A **Foreign Key** is a column that creates a relationship between two tables.

It usually references the Primary Key of another table.

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    user_id INT,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);
```

Here:

* `users.user_id` → Primary Key
* `vehicles.user_id` → Foreign Key

---

# 🎯 Why Use Foreign Keys?

Foreign Keys help:

* Maintain referential integrity
* Connect related tables
* Prevent invalid references
* Reduce duplicate data
* Represent real-world relationships

---

# 1️⃣ One-to-One Relationship

In a One-to-One relationship, one record in Table A is associated with only one record in Table B.

### Example

```text
User
  │
  │ 1
  │
  │ 1
  ▼
User Profile
```

One user has one profile.

A common implementation is to make the Foreign Key unique:

```sql
user_id INT UNIQUE
```

---

# 2️⃣ One-to-Many Relationship

In a One-to-Many relationship, one record can be associated with multiple records in another table.

### Traffic Management Example

```text
User
 │
 │ 1
 │
 │ N
 ▼
Vehicles
```

One user can own multiple vehicles.

Example:

```text
Rohan
 ├── MH12AB1234
 └── MH12GH3456
```

This is the main relationship implemented in today's practical.

---

# 3️⃣ Many-to-Many Relationship

In a Many-to-Many relationship, multiple records in one table can be associated with multiple records in another table.

### Example

```text
Vehicles  ↔  Routes
```

One vehicle can travel on multiple routes, and one route can have multiple vehicles.

A relational database normally implements this using a **junction table**.

Example:

```text
Vehicles
   │
   │
   ▼
Vehicle_Routes
   ▲
   │
   │
Routes
```

Example junction table:

```sql
CREATE TABLE vehicle_routes (
    vehicle_id INT,
    route_id INT,

    PRIMARY KEY (vehicle_id, route_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id),

    FOREIGN KEY (route_id)
        REFERENCES routes(route_id)
);
```

---

# 🔄 SQL JOIN

A `JOIN` combines rows from two or more tables based on a related column.

Example:

```sql
SELECT
    users.full_name,
    vehicles.vehicle_number
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id;
```

---

# 🟢 INNER JOIN

`INNER JOIN` returns only the records that have matching values in both tables.

### Example

```sql
SELECT
    users.full_name,
    vehicles.vehicle_number
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id;
```

### Concept

```text
Users          Vehicles

   A               A
   B               B
   C               D

INNER JOIN

   A
   B
```

Only matching records are returned.

---

# 🔵 LEFT JOIN

`LEFT JOIN` returns:

* All records from the left table
* Matching records from the right table
* `NULL` when there is no match

Example:

```sql
SELECT
    users.full_name,
    vehicles.vehicle_number
FROM users
LEFT JOIN vehicles
    ON users.user_id = vehicles.user_id;
```

If a user doesn't have a vehicle, that user will still appear in the result.

The vehicle columns will contain `NULL`.

---

# 📊 INNER JOIN vs LEFT JOIN

| INNER JOIN                            | LEFT JOIN                                    |
| ------------------------------------- | -------------------------------------------- |
| Returns matching records only         | Returns all left-table records               |
| Non-matching left records excluded    | Non-matching left records included           |
| Useful when matching data is required | Useful when all primary records are required |

---

# 🚦 Traffic Management Relationships

Today's database uses these relationships:

```text
Users
  │
  │ 1
  │
  │ N
  ▼
Vehicles
  │
  │ 1
  │
  │ N
  ▼
Incidents
  │
  │ N
  │
  │ 1
  ▼
Signals
```

### Relationships

* One User → Many Vehicles
* One Vehicle → Many Incidents
* One Signal → Many Incidents

---

# 🔍 JOIN Queries Practiced

## Users + Vehicles

```sql
SELECT
    users.full_name,
    vehicles.vehicle_number
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id;
```

---

## Vehicles + Incidents

```sql
SELECT
    vehicles.vehicle_number,
    incidents.incident_type
FROM vehicles
INNER JOIN incidents
    ON vehicles.vehicle_id = incidents.vehicle_id;
```

---

## Signals + Incidents

```sql
SELECT
    signals.signal_name,
    incidents.incident_type
FROM signals
INNER JOIN incidents
    ON signals.signal_id = incidents.signal_id;
```

---

## Users + Vehicles + Incidents

```sql
SELECT
    users.full_name,
    vehicles.vehicle_number,
    incidents.incident_type
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id
INNER JOIN incidents
    ON vehicles.vehicle_id = incidents.vehicle_id;
```

---

# 🧹 Normalization

Normalization is the process of organizing data in a relational database to reduce redundancy and improve data integrity.

### Main Goals

* Reduce duplicate data
* Avoid update anomalies
* Improve consistency
* Make database maintenance easier

---

# 1NF — First Normal Form

A table is in 1NF when:

* Each column contains atomic values
* There are no repeating groups
* Each row can be uniquely identified

Example:

Bad:

```text
Vehicle Types
Car, Bike, Bus
```

Better:

```text
Vehicle Type
Car
Bike
Bus
```

---

# 2NF — Second Normal Form

A table must:

* Already satisfy 1NF
* Have no partial dependency on part of a composite key

---

# 3NF — Third Normal Form

A table must:

* Already satisfy 2NF
* Have no transitive dependency

Non-key attributes should depend on the key, not on another non-key attribute.

---

# 🎤 Interview Questions

## 1. What is a Foreign Key?

A Foreign Key is a column that references a key in another table and establishes a relationship between the tables.

---

## 2. What is a One-to-Many relationship?

It is a relationship where one record in one table can be associated with multiple records in another table.

Example:

```text
One User → Many Vehicles
```

---

## 3. What is a Many-to-Many relationship?

It is a relationship where multiple records in both tables can be associated with each other.

A junction table is generally used to implement it.

---

## 4. What is INNER JOIN?

`INNER JOIN` returns only records where matching values exist in both tables.

---

## 5. What is LEFT JOIN?

`LEFT JOIN` returns all records from the left table and matching records from the right table.

If no match exists, the right-side columns contain `NULL`.

---

## 6. Difference between INNER JOIN and LEFT JOIN?

**INNER JOIN:**

Only matching records.

**LEFT JOIN:**

All records from the left table plus matching records from the right table.

---

## 7. Why are Foreign Keys important?

Foreign Keys maintain relationships and referential integrity between related tables.

---

## 8. Why is normalization important?

Normalization reduces data redundancy and helps maintain consistent and reliable data.

---

## 9. What is a junction table?

A junction table is an intermediate table used to implement a Many-to-Many relationship.

---

# 🧠 Key Takeaways

* Foreign Keys connect related tables.
* One-to-One represents a one-to-one relationship.
* One-to-Many represents one record associated with multiple records.
* Many-to-Many requires a junction table in a relational database.
* `INNER JOIN` returns matching records.
* `LEFT JOIN` preserves all records from the left table.
* Normalization helps reduce data redundancy.
* Proper relationships make a database easier to maintain and scale.

---

# 🚀 Day 025 Learning Outcome

Today I learned how relational databases connect multiple tables using Foreign Keys and practiced SQL JOIN operations.

I also extended the Traffic Management database with an `incidents` table and used relationships to retrieve meaningful information across Users, Vehicles, Signals, and Incidents.

These concepts form an important foundation for backend development and real-world database design.
