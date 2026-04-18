-- Delivery_data_Analysis_Database


-- Q1 Display all records from the delhivery_data table.
SELECT 
    *
FROM
    delhivery_data;

-- Q2 Fetch trip_id, source_city, and destination_city for trips where the route type is FTL.
SELECT 
    trip_uuid, source_center, destination_center
FROM
    delhivery_data
WHERE
    route_type = 'FTL';
    
-- Q3 Find all trips where the actual_time is greater than 500 minutes.
SELECT 
    *
FROM
    delhivery_data
WHERE
    actual_time > 500;
    
-- Q4 Display the top 5 trips with the highest actual_distance_to_destination.
SELECT 
    *
FROM
    delhivery_data
ORDER BY actual_distance_to_destination DESC
LIMIT 5;


-- Q5 Find the average actual delivery time for each route_type.
SELECT 
    route_type, AVG(actual_time) AS avg_delivery_time
FROM
    delhivery_data
GROUP BY route_type;


-- Q6 Count the number of trips originating from each source_city.
SELECT 
    source_center, COUNT(*) AS total_trips
FROM
    delhivery_data
GROUP BY source_center;


-- Q7 Find source cities where the number of trips is greater than 50.
SELECT 
    source_center, COUNT(*) AS trip_count
FROM
    delhivery_data
GROUP BY source_center
HAVING COUNT(*) > 50;


-- Q8 List distinct destination cities sorted in ascending order.
SELECT DISTINCT
    destination_center
FROM
    delhivery_data
ORDER BY destination_center ASC;


-- Q9 Find trips where the actual_time is greater than the average actual time of all trips.
SELECT 
    *
FROM
    delhivery_data
WHERE
    actual_time > (SELECT 
            AVG(actual_time)
        FROM
            delhivery_data);
            
            
-- Q10 For each route_type, find the maximum actual distance, but only show route types where the max distance is greater than 1000.
SELECT 
    route_type,
    MAX(actual_distance_to_destination) AS max_distance
FROM
    delhivery_data
GROUP BY route_type
HAVING MAX(actual_distance_to_destination) > 1000;


-- Q11 Display the top 3 source cities with the highest average actual delivery time.
SELECT 
    source_center, AVG(actual_time) AS avg_time
FROM
    delhivery_data
GROUP BY source_center
ORDER BY avg_time DESC
LIMIT 3;


-- Q12 Create a VIEW that shows trip_id, route_type, and delivery delay (Delivery delay = actual_time - osrm_time).
CREATE VIEW delivery_delay_view AS
    SELECT 
        trip_uuid,
        route_type,
        (actual_time - osrm_time) AS delivery_delay
    FROM
        delhivery_data;





