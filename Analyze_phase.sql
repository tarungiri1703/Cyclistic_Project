-- Analysis Phase --

-- Number of members and casual riders --
SELECT 
	COUNT(ride_id) AS no_of_riders,member_casual
FROM dbo.COMBINED_DATA
	GROUP BY member_casual;


-- Rideable type used by Member and Casual Riders --
SELECT
	COUNT(ride_id) AS no_of_riders,rideable_type,member_casual
FROM dbo.COMBINED_DATA
	GROUP BY rideable_type,member_casual
ORDER BY
	COUNT(ride_id) DESC;


-- RIDE DURATION ANALYSIS --
-- Ride Length --
SELECT 
    ride_id, member_casual,
    DATEDIFF(MINUTE, started_at, ended_at) AS ride_length
FROM dbo.COMBINED_DATA
	ORDER BY ride_length DESC;

-- Average ride duration for annual members --
SELECT 
    member_casual,
    AVG(ride_length) AS avg_ride_length
FROM dbo.COMBINED_DATA
WHERE 
    member_casual = 'member'
GROUP BY 
    member_casual;

-- Average ride duration for casual riders
SELECT 
    member_casual,
    AVG(ride_length) AS avg_ride_length
FROM dbo.COMBINED_DATA
WHERE 
    member_casual = 'casual'
GROUP BY 
    member_casual;

-- Distribution of ride duration for annual members
SELECT
	CASE 
        WHEN ride_length < 10 THEN '0-10 mins'
        WHEN ride_length BETWEEN 10 AND 20 THEN '10-20 mins'
        WHEN ride_length BETWEEN 20 AND 30 THEN '20-30 mins'
        WHEN ride_length BETWEEN 30 AND 40 THEN '30-40 mins'
        WHEN ride_length BETWEEN 40 AND 50 THEN '40-50 mins'
        ELSE '50+ mins'
    END AS duration_range,
	COUNT(*) AS rides_count
FROM 
    dbo.COMBINED_DATA
WHERE
	member_casual ='member'
GROUP BY 
	CASE 
        WHEN ride_length < 10 THEN '0-10 mins'
        WHEN ride_length BETWEEN 10 AND 20 THEN '10-20 mins'
        WHEN ride_length BETWEEN 20 AND 30 THEN '20-30 mins'
        WHEN ride_length BETWEEN 30 AND 40 THEN '30-40 mins'
        WHEN ride_length BETWEEN 40 AND 50 THEN '40-50 mins'
        ELSE '50+ mins'
    END
ORDER BY
	duration_range;
	
-- Distribution of ride duration for casual riders
SELECT
	CASE 
        WHEN ride_length < 10 THEN '0-10 mins'
        WHEN ride_length BETWEEN 10 AND 20 THEN '10-20 mins'
        WHEN ride_length BETWEEN 20 AND 30 THEN '20-30 mins'
        WHEN ride_length BETWEEN 30 AND 40 THEN '30-40 mins'
        WHEN ride_length BETWEEN 40 AND 50 THEN '40-50 mins'
        ELSE '50+ mins'
    END AS duration_range,
	COUNT(*) AS rides_count
FROM 
    dbo.COMBINED_DATA
WHERE
	member_casual ='casual'
GROUP BY 
	CASE 
        WHEN ride_length < 10 THEN '0-10 mins'
        WHEN ride_length BETWEEN 10 AND 20 THEN '10-20 mins'
        WHEN ride_length BETWEEN 20 AND 30 THEN '20-30 mins'
        WHEN ride_length BETWEEN 30 AND 40 THEN '30-40 mins'
        WHEN ride_length BETWEEN 40 AND 50 THEN '40-50 mins'
        ELSE '50+ mins'
    END
ORDER BY
	duration_range;


-- RIDE FREQUENCY ANALYSIS --
-- Rides per Month Analysis --
SELECT
	COUNT(ride_id) AS no_of_rides,
	DATEPART(MONTH, started_at) as started_month,
	member_casual
FROM dbo.COMBINED_DATA
GROUP BY
	member_casual,
	DATEPART(MONTH, started_at)
ORDER BY COUNT(ride_id) DESC;

-- Rides per Day Analysis --
SELECT
	COUNT(ride_id) AS no_of_rides,
	day_of_week,
	member_casual
FROM dbo.COMBINED_DATA
GROUP BY
	member_casual,
	day_of_week
ORDER BY COUNT(ride_id) DESC;


-- TIME OF DAY ANALYSIS --
--Started Hour Analysis --
SELECT
	COUNT(ride_id) AS no_of_rides,
	DATEPART(HOUR, started_at) as started_hour,
	member_casual
FROM dbo.COMBINED_DATA
GROUP BY
	member_casual,
	DATEPART(HOUR, started_at)
ORDER BY COUNT(ride_id) DESC;

	
-- STATION ANALYSIS --
-- Start Station Analysis --
SELECT 
	COUNT(ride_id) AS no_of_rides,
	start_station_name, member_casual
FROM 
	dbo.COMBINED_DATA
GROUP BY 
	start_station_name, member_casual
ORDER BY COUNT(ride_id) DESC;


