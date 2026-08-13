/*
====================================================
Project : Smart Traffic Management System
Day     : 025
Topic   : Relationships & JOIN Queries
Database: traffic_management
====================================================
*/

-- ==================================================
-- 1. Select Database
-- ==================================================

USE traffic_management;


-- ==================================================
-- 2. Create Users Table
-- ==================================================

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ==================================================
-- 3. Create Vehicles Table
-- One User -> Many Vehicles
-- ==================================================

CREATE TABLE IF NOT EXISTS vehicles (
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


-- ==================================================
-- 4. Create Signals Table
-- ==================================================

CREATE TABLE IF NOT EXISTS signals (
    signal_id INT PRIMARY KEY AUTO_INCREMENT,
    signal_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    green_time INT NOT NULL,
    red_time INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active'
);


-- ==================================================
-- 5. Create Incidents Table
-- ==================================================

CREATE TABLE IF NOT EXISTS incidents (
    incident_id INT PRIMARY KEY AUTO_INCREMENT,
    incident_type VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    incident_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    vehicle_id INT,
    signal_id INT,

    CONSTRAINT fk_incident_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_incident_signal
        FOREIGN KEY (signal_id)
        REFERENCES signals(signal_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- ==================================================
-- 6. Insert Users
-- ==================================================

INSERT INTO users
(full_name, email, password, role)
VALUES
('Rohan Parkale', 'rohan@example.com', 'password123', 'Admin'),
('Rahul Sharma', 'rahul@example.com', 'rahul123', 'Operator'),
('Priya Patil', 'priya@example.com', 'priya123', 'User'),
('Amit Joshi', 'amit@example.com', 'amit123', 'User');


-- ==================================================
-- 7. Insert Vehicles
-- ==================================================

INSERT INTO vehicles
(vehicle_number, vehicle_type, owner_name, user_id)
VALUES
('MH12AB1234', 'Car', 'Rohan Parkale', 1),
('MH14CD5678', 'Bike', 'Rahul Sharma', 2),
('MH20EF9012', 'Bus', 'Priya Patil', 3),
('MH12GH3456', 'Car', 'Rohan Parkale', 1);


-- ==================================================
-- 8. Insert Signals
-- ==================================================

INSERT INTO signals
(signal_name, location, green_time, red_time, status)
VALUES
('Signal A', 'MG Road', 45, 60, 'Active'),
('Signal B', 'Railway Station', 40, 55, 'Active'),
('Signal C', 'City Square', 50, 70, 'Active');


-- ==================================================
-- 9. Insert Incidents
-- ==================================================

INSERT INTO incidents
(incident_type, description, vehicle_id, signal_id)
VALUES
(
    'Accident',
    'Minor collision near signal',
    1,
    1
),
(
    'Traffic Jam',
    'Heavy traffic during peak hours',
    2,
    2
),
(
    'Signal Violation',
    'Vehicle crossed red signal',
    3,
    3
),
(
    'Vehicle Breakdown',
    'Vehicle stopped near intersection',
    4,
    1
);


-- ==================================================
-- 10. Verify Tables
-- ==================================================

SHOW TABLES;


-- ==================================================
-- 11. Display All Records
-- ==================================================

SELECT * FROM users;

SELECT * FROM vehicles;

SELECT * FROM signals;

SELECT * FROM incidents;


-- ==================================================
-- 12. INNER JOIN
-- Users + Vehicles
--
-- Returns only users who have vehicles.
-- ==================================================

SELECT
    users.user_id,
    users.full_name,
    vehicles.vehicle_number,
    vehicles.vehicle_type
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id;


-- ==================================================
-- 13. LEFT JOIN
-- Users + Vehicles
--
-- Returns ALL users, even if they don't own
-- a vehicle.
-- ==================================================

SELECT
    users.user_id,
    users.full_name,
    vehicles.vehicle_number,
    vehicles.vehicle_type
FROM users
LEFT JOIN vehicles
    ON users.user_id = vehicles.user_id;


-- ==================================================
-- 14. INNER JOIN
-- Vehicles + Incidents
-- ==================================================

SELECT
    vehicles.vehicle_number,
    vehicles.vehicle_type,
    incidents.incident_type,
    incidents.description
FROM vehicles
INNER JOIN incidents
    ON vehicles.vehicle_id = incidents.vehicle_id;


-- ==================================================
-- 15. INNER JOIN
-- Signals + Incidents
-- ==================================================

SELECT
    signals.signal_name,
    signals.location,
    incidents.incident_type,
    incidents.description
FROM signals
INNER JOIN incidents
    ON signals.signal_id = incidents.signal_id;


-- ==================================================
-- 16. Multiple INNER JOIN
-- Users + Vehicles + Incidents
-- ==================================================

SELECT
    users.full_name,
    vehicles.vehicle_number,
    vehicles.vehicle_type,
    incidents.incident_type,
    incidents.description
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id
INNER JOIN incidents
    ON vehicles.vehicle_id = incidents.vehicle_id;


-- ==================================================
-- 17. Multiple JOIN
-- Users + Vehicles + Incidents + Signals
--
-- Complete Incident Information
-- ==================================================

SELECT
    users.full_name,
    vehicles.vehicle_number,
    vehicles.vehicle_type,
    incidents.incident_type,
    incidents.description,
    signals.signal_name,
    signals.location
FROM users
INNER JOIN vehicles
    ON users.user_id = vehicles.user_id
INNER JOIN incidents
    ON vehicles.vehicle_id = incidents.vehicle_id
INNER JOIN signals
    ON incidents.signal_id = signals.signal_id;


-- ==================================================
-- 18. LEFT JOIN
-- Signals + Incidents
--
-- Shows all signals, including signals
-- with no incidents.
-- ==================================================

SELECT
    signals.signal_name,
    signals.location,
    incidents.incident_type,
    incidents.description
FROM signals
LEFT JOIN incidents
    ON signals.signal_id = incidents.signal_id;


-- ==================================================
-- 19. Count Vehicles Per User
-- ==================================================

SELECT
    users.full_name,
    COUNT(vehicles.vehicle_id) AS vehicle_count
FROM users
LEFT JOIN vehicles
    ON users.user_id = vehicles.user_id
GROUP BY
    users.user_id,
    users.full_name;


-- ==================================================
-- 20. Count Incidents Per Signal
-- ==================================================

SELECT
    signals.signal_name,
    signals.location,
    COUNT(incidents.incident_id) AS incident_count
FROM signals
LEFT JOIN incidents
    ON signals.signal_id = incidents.signal_id
GROUP BY
    signals.signal_id,
    signals.signal_name,
    signals.location;