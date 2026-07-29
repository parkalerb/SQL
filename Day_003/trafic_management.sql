/*
==========================================
Project : Traffic Management System
Day     : 018
Database: traffic_management
==========================================
*/

-- ======================================
-- Create Database
-- ======================================

CREATE DATABASE IF NOT EXISTS traffic_management;

USE traffic_management;

-- ======================================
-- Create Users Table
-- ======================================

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ======================================
-- Create Vehicles Table
-- ======================================

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_number VARCHAR(20) UNIQUE NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    user_id INT,

    CONSTRAINT fk_vehicle_user
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- ======================================
-- Create Signals Table
-- ======================================

CREATE TABLE signals (
    signal_id INT PRIMARY KEY AUTO_INCREMENT,
    signal_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    green_time INT NOT NULL,
    red_time INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active'
);

-- ======================================
-- Insert Sample Data into Users
-- ======================================

INSERT INTO users (full_name, email, password, role)
VALUES
('Rohan Parkale', 'rohan@example.com', 'password123', 'Admin'),
('Rahul Sharma', 'rahul@example.com', 'rahul123', 'Operator'),
('Priya Patil', 'priya@example.com', 'priya123', 'User');

-- ======================================
-- Insert Sample Data into Vehicles
-- ======================================

INSERT INTO vehicles
(vehicle_number, vehicle_type, owner_name, user_id)
VALUES
('MH12AB1234', 'Car', 'Rohan Parkale', 1),
('MH14CD5678', 'Bike', 'Rahul Sharma', 2),
('MH20EF9012', 'Bus', 'Priya Patil', 3);

-- ======================================
-- Insert Sample Data into Signals
-- ======================================

INSERT INTO signals
(signal_name, location, green_time, red_time, status)
VALUES
('Signal A', 'MG Road', 45, 60, 'Active'),
('Signal B', 'Railway Station', 40, 55, 'Active'),
('Signal C', 'City Square', 50, 70, 'Maintenance');

-- ======================================
-- Display Records
-- ======================================

SELECT * FROM users;

SELECT * FROM vehicles;

SELECT * FROM signals;

-- ======================================
-- Useful Commands
-- ======================================

SHOW DATABASES;

USE traffic_management;

SHOW TABLES;

DESCRIBE users;

DESCRIBE vehicles;

DESCRIBE signals;