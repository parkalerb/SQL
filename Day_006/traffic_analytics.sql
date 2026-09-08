USE traffic_management;


-- 1. Location-wise incident count

SELECT
    location,
    COUNT(*) AS incident_count
FROM Incidents
GROUP BY location
ORDER BY incident_count DESC;


-- 2. Highest incident locations

SELECT
    location,
    incident_count
FROM (
    SELECT
        location,
        COUNT(*) AS incident_count
    FROM Incidents
    GROUP BY location
) AS incident_summary
WHERE incident_count = (
    SELECT MAX(incident_count)
    FROM (
        SELECT
            location,
            COUNT(*) AS incident_count
        FROM Incidents
        GROUP BY location
    ) AS location_counts
);


-- 3. Rank locations by incident frequency

WITH incident_counts AS (
    SELECT
        location,
        COUNT(*) AS incident_count
    FROM Incidents
    GROUP BY location
)

SELECT
    location,
    incident_count,
    RANK() OVER (ORDER BY incident_count DESC) AS incident_rank
FROM incident_counts
ORDER BY incident_rank;


-- 4. Vehicle count by type

SELECT
    vehicle_type,
    COUNT(*) AS vehicle_count
FROM Vehicles
GROUP BY vehicle_type
ORDER BY vehicle_count DESC;


-- 4. Average speed by location

SELECT
    location,
    AVG(speed) AS average_speed
FROM Vehicles
GROUP BY location
ORDER BY average_speed DESC;


-- 5. Latest incident for each location

WITH ranked_incidents AS (
    SELECT
        incident_id,
        location,
        incident_type,
        incident_date,
        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY incident_date DESC
        ) AS row_num
    FROM Incidents
)

SELECT
    incident_id,
    location,
    incident_type,
    incident_date
FROM ranked_incidents
WHERE row_num = 1
ORDER BY location;