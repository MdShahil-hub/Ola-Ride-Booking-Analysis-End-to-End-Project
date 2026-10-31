use oladb;

-- 1. Retrieve all successful bookings:
create view successful_bookings as
select * from bookings
where booking_status='Success';

-- 2. Find the average ride distance for each vehicle type:
create view avg_ride_by_vehicle_type as
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings 
GROUP BY Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
create view count_cancel_ride as
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5 as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings 
GROUP BY Customer_ID ORDER BY total_rides DESC LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view personal_and_car_related_issue as
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_rating_for_Prime_Sedan as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings 
WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
create view  UPI_payment as
SELECT * FROM bookings WHERE Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
create view average_rating_for_vehicle_type as
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_for_successfully_completed_ride as
SELECT SUM(Booking_Value) as total_successful_value FROM bookings 
WHERE Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
create view incomplete_ride_reason as
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings 
WHERE Incomplete_Rides = 'Yes';


