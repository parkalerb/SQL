USE traffic_management;


-- 1. Total number of vehicles

SELECT COUNT(*) AS total_vehicles
FROM Vehicles;


-- 2. Average vehicle speed

SELECT AVG(speed) AS average_speed
FROM Vehicles;


-- 3. Minimum and maximum vehicle speed

SELECT
    MIN(speed) AS minimum_speed,
    MAX(speed) AS maximum_speed
FROM Vehicles;


-- 4. Number of vehicles by type

SELECT
    vehicle_type,
    COUNT(*) AS total_vehicles
FROM Vehicles
GROUP BY vehicle_type;


-- 5. Total incidents by location

SELECT
    location,
    COUNT(*) AS total_incidents
FROM Incidents
GROUP BY location;


-- 6. Signals grouped by status

SELECT
    status,
    COUNT(*) AS total_signals
FROM Signals
GROUP BY status;


-- 7. Locations having more than 2 incidents

SELECT
    location,
    COUNT(*) AS total_incidents
FROM Incidents
GROUP BY location
HAVING COUNT(*) > 2;


-- 8. Find the highest vehicle speed

SELECT MAX(speed) AS highest_speed
FROM Vehicles;


-- 9. Find the lowest vehicle speed

SELECT MIN(speed) AS lowest_speed
FROM Vehicles;


-- 10. Find locations where incidents
-- are more than the average number of incidents per location

SELECT location
FROM Incidents
GROUP BY location
HAVING COUNT(*) > (
    SELECT AVG(incident_count)
    FROM (
        SELECT COUNT(*) AS incident_count
        FROM Incidents
        GROUP BY location
    ) AS incident_data
);