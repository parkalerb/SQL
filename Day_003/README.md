# Day 018 - MySQL Database Schema Design

## 📚 Overview

Welcome to **Day 018** of my SQL learning journey.

Today, I learned how to create and manage a MySQL database by designing a relational database schema for the **Traffic Management System** project. I created multiple related tables, applied database constraints, and understood how relationships between tables improve data integrity.

This practical session helped me understand the fundamentals of relational database design used in real-world applications.

---

# 🎯 Learning Objectives

- Install and configure MySQL
- Create a new database
- Design relational tables
- Understand Primary Keys and Foreign Keys
- Apply database constraints
- Build a real-world database schema

---

# 📂 Folder Structure

```
Day_003/
│
├── traffic_management.sql
├── sql_notes.md
└── README.md
```

---

# 📖 Topics Covered

- MySQL Installation
- Database Creation
- Table Creation
- Primary Key
- Foreign Key
- Constraints
- CRUD Basics
- Normalization
- Indexes

---

# 💻 Practical Tasks Performed

## ✅ Created Database

```sql
CREATE DATABASE traffic_management;
```

Selected the database for further operations.

```sql
USE traffic_management;
```

---

## ✅ Created Users Table

The **users** table stores information about system users.

Fields included:

- user_id
- full_name
- email
- password
- role
- created_at

---

## ✅ Created Vehicles Table

The **vehicles** table stores vehicle information.

Fields included:

- vehicle_id
- vehicle_number
- vehicle_type
- owner_name
- user_id (Foreign Key)

Relationship:

One user can own multiple vehicles.

---

## ✅ Created Signals Table

The **signals** table stores traffic signal information.

Fields included:

- signal_id
- signal_name
- location
- green_time
- red_time
- status

---

## ✅ Added Sample Records

Inserted sample data into:

- Users
- Vehicles
- Signals

This helped verify that the tables were created successfully and the relationships worked as expected.

---

# 🗄️ Database Schema

```
traffic_management
│
├── users
│     ├── user_id (PK)
│     ├── full_name
│     ├── email
│     ├── password
│     ├── role
│     └── created_at
│
├── vehicles
│     ├── vehicle_id (PK)
│     ├── vehicle_number
│     ├── vehicle_type
│     ├── owner_name
│     └── user_id (FK)
│
└── signals
      ├── signal_id (PK)
      ├── signal_name
      ├── location
      ├── green_time
      ├── red_time
      └── status
```

---

# 📈 Skills Gained

After completing today's practical, I learned how to:

- Create databases in MySQL
- Design relational tables
- Use Primary Keys
- Create Foreign Key relationships
- Apply constraints
- Insert sample data
- Query database tables

---

# 🧠 Key Takeaways

- A Primary Key uniquely identifies every record in a table.
- A Foreign Key creates relationships between tables and maintains data integrity.
- Normalization reduces data redundancy.
- Indexes improve query performance.
- Proper database design makes applications more scalable and maintainable.

---

# 📊 Progress

| Topic | Status |
|--------|--------|
| MySQL Installation | ✅ Completed |
| Database Creation | ✅ Completed |
| Table Creation | ✅ Completed |
| Primary Key | ✅ Completed |
| Foreign Key | ✅ Completed |
| Constraints | ✅ Completed |
| CRUD Basics | ✅ Completed |
| Normalization | ✅ Completed |
| Indexes | ✅ Completed |

---

# 🚀 Technologies Used

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub

---

# 📌 What's Next?

In the next learning session, I will continue exploring SQL by writing more advanced queries using:

- JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions
- Views

These concepts are essential for real-world backend development and database management.

---

# 👨‍💻 Author

**Rohan Parkale**

- MCA Student
- Python Developer
- AIML Enthusiast
- Passionate about Machine Learning, Database Design, and Software Development

---

⭐ Thank you for visiting this repository! Feel free to explore my other learning repositories and follow my SQL learning journey on GitHub.