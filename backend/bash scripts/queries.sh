#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Query1: Retrieves cars that have been booked more than once.
# Query2: Retrieves customers who have both paid and unpaid bills using EXISTS and MINUS.
# Query3: Lists cars that are not part of any maintenance using MINUS.
# Query4: Calculates the average rental price for each car type, including only cars that have been rented at least once.
# Query5: Retrieves cars that have received multiple reviews, showing the highest-rated ones, using the MAX() function.
# Query6: Retrieve all cars that are currently available or have been rented at least once.

sqlplus64 "msghani/08203666@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca) (Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

SELECT c.CarID, c.Make, c.Model, COUNT(b.RentalID) AS BookingCount
FROM Cars c
JOIN Bookings b ON c.CarID = b.CarID
GROUP BY c.CarID, c.Make, c.Model
HAVING COUNT(b.RentalID) > 1;


SELECT DISTINCT c.CustomerID, c.Name
FROM Customers c
WHERE EXISTS (SELECT 1 FROM Bills b WHERE b.CustomerID = c.CustomerID AND b.Status = 'Paid')
MINUS
SELECT DISTINCT c.CustomerID, c.Name
FROM Customers c
WHERE EXISTS (SELECT 1 FROM Bills b WHERE b.CustomerID = c.CustomerID AND b.Status = 'Unpaid');


SELECT CarID, Make, Model
FROM Cars
MINUS
SELECT m.CarID, c.Make, c.Model
FROM Maintenance m
JOIN Cars c ON m.CarID = c.CarID;


SELECT c.CarType, AVG(b.RentalPrice) AS AvgRentalPrice
FROM Cars c
JOIN Bookings b ON c.CarID = b.CarID
GROUP BY c.CarType
HAVING COUNT(b.RentalID) > 0;


SELECT c.CarID, c.Make, c.Model, MAX(r.Rating) AS HighestRating
FROM Cars c
JOIN Reviews r ON c.CarID = r.CarID
GROUP BY c.CarID, c.Make, c.Model
HAVING COUNT(r.Rating) > 1;


SELECT CarID, Make, Model, 'Available' AS Status
FROM Cars
WHERE Availability = 'T'
UNION
SELECT DISTINCT c.CarID, c.Make, c.Model, 'Rented' AS Status
FROM Cars c
JOIN Bookings b ON c.CarID = b.CarID;

EOF