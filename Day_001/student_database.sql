-- ==========================================
-- Day 001 : SQL Basics
-- Topic:
-- CREATE
-- INSERT
-- SELECT
-- WHERE
-- ORDER BY
-- ==========================================

-- Create Database
CREATE DATABASE college;

-- Use Database
USE college;

-- Create Student Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50)
);

-- Insert Records

INSERT INTO students VALUES
(101, 'Rohan', 22, 'MCA', 'Pune'),
(102, 'Amit', 21, 'BCA', 'Mumbai'),
(103, 'Priya', 23, 'MCA', 'Nashik'),
(104, 'Sneha', 22, 'BSc', 'Nagpur'),
(105, 'Rahul', 24, 'MCA', 'Pune'),
(106, 'Anjali', 21, 'BCA', 'Kolhapur'),
(107, 'Vikas', 22, 'BCom', 'Satara'),
(108, 'Neha', 23, 'MCA', 'Pune'),
(109, 'Akash', 22, 'BCA', 'Solapur'),
(110, 'Pooja', 21, 'BSc', 'Aurangabad');

-- Display all records

SELECT * FROM students;

-- Students from Pune

SELECT * FROM students
WHERE city = 'Pune';

-- Students ordered by name

SELECT * FROM students
ORDER BY name;

-- Students ordered by age

SELECT * FROM students
ORDER BY age DESC;