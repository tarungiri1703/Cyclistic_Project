-- identify and remove all null values --
SELECT * FROM dbo.COMBINED_DATA WHERE
ride_id is null
or rideable_type is null
or started_at is null
or ended_at is null
or start_station_name is null
or end_station_name is null
or member_casual is null;

DELETE FROM dbo.COMBINED_DATA WHERE
ride_id is null
or rideable_type is null
or started_at is null
or ended_at is null
or start_station_name is null
or end_station_name is null
or member_casual is null;                       
-- After deleting null values 4077579 rows are left --

-- identifying and removing duplicates --
SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual,
COUNT(*) AS duplicatecount
FROM COMBINED_DATA
GROUP BY 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
HAVING COUNT(*) >1;                   
-- No duplicate records found --
