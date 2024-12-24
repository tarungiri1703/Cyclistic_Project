
-- Performed DATA COMBINING --
-- created and added all the data of last 11 months in a single table named COMBINED_DATA --
-- Avoided lat & lng columns because we will not use them in analysis --
USE project_cyclistic;

CREATE TABLE COMBINED_DATA (
ride_id nvarchar(50),
rideable_type nvarchar(50),
started_at datetime2(7),
ended_at datetime2(7),
start_station_name varchar(max),
start_station_id nvarchar(50),
end_station_name varchar(max),
end_station_id nvarchar(50),
member_casual nvarchar(50)
);

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-01];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-02];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-03];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-04];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-05];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-06];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-07];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-08];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-09];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-10];

INSERT INTO COMBINED_DATA (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name,end_station_id,member_casual)
SELECT ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
member_casual
FROM dbo.[2024-11];

-- create new column named ride_length (in minutes)--
ALTER TABLE COMBINED_DATA ADD ride_length int;
UPDATE COMBINED_DATA SET ride_length = DATEDIFF(MINUTE, started_at, ended_at);

-- create new column named day_of_week of ride start day (where 1=sunday & 7=saturday) --
ALTER TABLE COMBINED_DATA ADD day_of_week int;
UPDATE COMBINED_DATA SET day_of_week = DATEPART(WEEKDAY, started_at);
