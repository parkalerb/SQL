-- ==========================================
-- Sprint 02 | Day 002
-- SQL CRUD Operations
-- Author: Rohan Parkale
-- ==========================================

-- Create Database
CREATE DATABASE StudentDB;

-- Use Database
USE StudentDB;

-- Create Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);

-- Insert Records
INSERT INTO Students (name, age, course, marks)
VALUES
('Rohan', 22, 'MCA', 85),
('Amit', 21, 'MCA', 78),
('Sneha', 22, 'MCA', 91),
('Priya', 20, 'BCA', 88),
('Rahul', 23, 'MCA', 74);

-- Display Data
SELECT * FROM Students;

-- ==========================================
-- UPDATE
-- ==========================================

UPDATE Students
SET marks = 90
WHERE student_id = 2;

SELECT * FROM Students;

-- ==========================================
-- DELETE
-- ==========================================

DELETE FROM Students
WHERE student_id = 5;

SELECT * FROM Students;

-- ==========================================
-- ALTER TABLE
-- ==========================================

ALTER TABLE Students
ADD email VARCHAR(100);

SELECT * FROM Students;

-- Update Email

UPDATE Students
SET email = 'rohan@example.com'
WHERE student_id = 1;

UPDATE Students
SET email = 'amit@example.com'
WHERE student_id = 2;

UPDATE Students
SET email = 'sneha@example.com'
WHERE student_id = 3;

UPDATE Students
SET email = 'priya@example.com'
WHERE student_id = 4;

SELECT * FROM Students;

-- ==========================================
-- DROP COLUMN (Optional)
-- ==========================================

-- ALTER TABLE Students
-- DROP COLUMN email;

-- ==========================================
-- DROP TABLE (Optional)
-- ==========================================

-- DROP TABLE Students;

-- ==========================================
-- Verification Queries
-- ==========================================

SELECT * FROM Students;

SELECT name, marks
FROM Students
WHERE marks > 80;

SELECT COUNT(*) AS TotalStudents
FROM Students;