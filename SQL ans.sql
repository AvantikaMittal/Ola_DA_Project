create database Ola;
use Ola;

# 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where booking_status = "Success";

# 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance) from bookings as avg_distance 
group by vehicle_type;

# 3. Get the total number of cancelled rides by customers:
create view canceled_rides_by_customers as
select count(*) from bookings
where booking_status = "Canceled by Customer";
 
# 4. List the top 5 customers who booked the highest number of rides:
create view TOP_5_customers as
select customer_id, count(booking_id) as total_rides from bookings
group by customer_id
order by total_rides desc limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Ride_Cancelled_by_Drivers_P_C_Issue As 
select count(*) from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Ratings as
select max(driver_ratings) as MAX_Rating, min(driver_ratings) as MIN_Rating from bookings
where vehicle_type = "Prime Sedan";

# 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select * from bookings
where payment_method = "UPI";

# 8. Find the average customer rating per vehicle type:
create view Avg_cust_rating as
select vehicle_type, avg(customer_rating) from bookings as avg_customer_rating 
group by vehicle_type;

# 9. Calculate the total booking value of rides completed successfully:
create view total_succ_ride_value as
select sum(booking_value) from bookings
where booking_status = "Success";

# 10. List all incomplete rides along with the reason:
create view Incomplete_rides_reason as
select Booking_id, Incomplete_rides_reason from bookings
where Incomplete_rides = "Yes";