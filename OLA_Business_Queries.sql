use ola_db;

Select TOP 10 * from bookings;


--1. Retrieve all successful bookings.

Select * from bookings where Booking_Status='Success';


--2. Find the average ride distance for each vehicle type.

Select Vehicle_Type, ROUND(Avg(Ride_Distance),2) as Avg_Distance
from Bookings 
group by Vehicle_Type;


--3. Get the total number of cancelled rides by customers.
Select Count(*) as Rides_Can_by_Cust from Bookings
where Booking_Status='Canceled by Customer';

--4. List the top 5 customers who booked the highest number of rides.
Select TOP 5 Customer_Id, Count(Booking_ID) as Total_Rides
from Bookings
group by Customer_ID
order by 2 desc;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues.
Select count(*) as Num_Of_Rides
from Bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings.

Select MAX(Driver_Ratings) as Max_Rating, MIN(Driver_Ratings) as Min_Rating
from Bookings
where Vehicle_Type='Prime Sedan';

--7. Retrieve all rides where payment was made using UPI.

Select * from Bookings
where Payment_Method='UPI';


--8. Find the average customer rating per vehicle type.

Select Vehicle_Type,ROUND(AVG(Customer_Rating),2)
from Bookings
group by Vehicle_Type;

--9. Calculate the total booking value of rides completed successfully.

Select SUM(Booking_Value) from bookings where Booking_Status='Success';

--10. List all incomplete rides along with the reason:

Select Booking_ID,Incomplete_Rides_Reason from Bookings
where Incomplete_Rides!=0;