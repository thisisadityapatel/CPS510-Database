#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

sqlplus64 "msghani/08203666@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca) (Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

INSERT ALL
    INTO Cars (CarID, Make, Year, Model, CarType, Mileage, Colour, LicensePlate, RentalRate, Availability) VALUES (1, 'Toyota', 2020, 'Rav4', 'SUV', 20000, 'Red', 'ASDF 456', 80, 'T')
    INTO Cars (CarID, Make, Year, Model, CarType, Mileage, Colour, LicensePlate, RentalRate, Availability) VALUES (2, 'Honda', 2022, 'Civic', 'Sedan', 120000, 'Black', 'ZXCV 123', 70, 'T')
    INTO Cars (CarID, Make, Year, Model, CarType, Mileage, Colour, LicensePlate, RentalRate, Availability) VALUES (3, 'Ford', 2021, 'F-150', 'Truck', 40000, 'White', 'QWER 789', 90, 'T')
    INTO Cars (CarID, Make, Year, Model, CarType, Mileage, Colour, LicensePlate, RentalRate, Availability) VALUES (4, 'Tesla', 2023, 'Model 3', 'Electric', 10000, 'Blue', 'ABCD 123',100, 'F')
SELECT * FROM dual;

INSERT ALL
    INTO Customers (CustomerID, Name, Email, ContactNumber, LicenseNumber, Address, DateOfBirth, LoyaltyMember) VALUES (1, 'Lebron James', 'lebron@outlook.com', '1234567890', 'L1234 - 12345 - 12345', '321 Elm Street', TO_DATE('1984-12-30', 'YYYY-MM-DD'), 'F')
    INTO Customers (CustomerID, Name, Email, ContactNumber, LicenseNumber, Address, DateOfBirth, LoyaltyMember) VALUES (2, 'Stephen Curry', 'chef_curry@gmail.com', '3216540987', 'L4321 - 54321 - 54321', '123 Sesame Street', TO_DATE('1988-05-18', 'YYYY-MM-DD'), 'T')
    INTO Customers (CustomerID, Name, Email, ContactNumber, LicenseNumber, Address, DateOfBirth, LoyaltyMember) VALUES (3, 'Kevin Durant', 'slim-reaper@icloud.com', '0004567890', 'L147 - 14785 - 14785', '21 Jump Street', TO_DATE('1988-09-29', 'YYYY-MM-DD'), 'T')
SELECT * FROM dual;

INSERT ALL
    INTO Reviews (CarID, CustomerID, Feedback, Rating) VALUES (1, 1, 'Smooth drive, very comfortable.', 5)
    INTO Reviews (CarID, CustomerID, Feedback, Rating) VALUES (1, 2, 'Great fuel efficiency.', 4)
    INTO Reviews (CarID, CustomerID, Feedback, Rating) VALUES (3, 3, 'Powerful truck but a bit noisy.', 3)
    INTO Reviews (CarID, CustomerID, Feedback, Rating) VALUES (4, 1, 'Futuristic and smooth.', 5)
SELECT * FROM dual;

INSERT ALL
    INTO Maintenance (MaintenanceID, CarID, Description, Cost, Status) VALUES (1, 1, 'Oil change and tire rotation', 150.50, 'Completed')
    INTO Maintenance (MaintenanceID, CarID, Description, Cost, Status) VALUES (2, 2, 'Brake pad replacement', 200.00, 'In Progress')
    INTO Maintenance (MaintenanceID, CarID, Description, Cost, Status) VALUES (3, 3, 'Engine tune-up', 500.00, 'Pending')
    INTO Maintenance (MaintenanceID, CarID, Description, Cost, Status) VALUES (4, 4, 'Battery check and software update', 250.00, 'Completed')
SELECT * FROM dual;

INSERT ALL
    INTO Admin (EmployeeID, Name, Username, Password, Email) VALUES (1, 'John Doe', 'jdoe', 'password123', 'jdoe@example.com')
    INTO Admin (EmployeeID, Name, Username, Password, Email) VALUES (2, 'Jane Smith', 'jsmith', 'securepass', 'jsmith@gmail.com')
    INTO Admin (EmployeeID, Name, Username, Password, Email) VALUES (3, 'Alice Johnson', 'ajohnson', 'admin2024', 'ajohnson@example.com')
    INTO Admin (EmployeeID, Name, Username, Password, Email) VALUES (4, 'Bob Brown', 'bbrown', 'superpass', 'bbrown@admin.com')
SELECT * FROM dual;

INSERT ALL 
    INTO Bookings (RentalID, CarID, CustomerID, BookingDate, MethodOfPayment, BookingStatus, StartDate, EndDate, PickupLocation, DropoffLocation, RentalPrice, RentalStatus) VALUES (1, 1, 1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Credit Card', 'Confirmed', TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-12', 'YYYY-MM-DD'), '321 Elm Street', 'Main Office', 560.00, 'Complete') 
    INTO Bookings (RentalID, CarID, CustomerID, BookingDate, MethodOfPayment, BookingStatus, StartDate, EndDate, PickupLocation, DropoffLocation, RentalPrice, RentalStatus) VALUES (2, 2, 2, TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Debit Card', 'Confirmed', TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'), '123 Sesame Street', 'Main Office', 490.00, 'Future') 
    INTO Bookings (RentalID, CarID, CustomerID, BookingDate, MethodOfPayment, BookingStatus, StartDate, EndDate, PickupLocation, DropoffLocation, RentalPrice, RentalStatus) VALUES (3, 3, 3, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Credit Card', 'Pending', TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), '21 Jump Street', 'Main Office', 720.00, 'Future') 
    INTO Bookings (RentalID, CarID, CustomerID, BookingDate, MethodOfPayment, BookingStatus, StartDate, EndDate, PickupLocation, DropoffLocation, RentalPrice, RentalStatus) VALUES (4, 1, 2, TO_DATE('2024-08-28', 'YYYY-MM-DD'), 'Credit Card', 'Confirmed', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'), '123 Sesame Street', 'Main Office', 400.00, 'Complete') 
    INTO Bookings (RentalID, CarID, CustomerID, BookingDate, MethodOfPayment, BookingStatus, StartDate, EndDate, PickupLocation, DropoffLocation, RentalPrice, RentalStatus) VALUES (5, 4, 3, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Credit Card', 'Confirmed', TO_DATE('2024-09-22', 'YYYY-MM-DD'), TO_DATE('2024-09-29', 'YYYY-MM-DD'), '21 Jump Street', 'Main Office', 700.00, 'Future') 
    INTO Bookings (RentalID, CarID, CustomerID, BookingDate, MethodOfPayment, BookingStatus, StartDate, EndDate, PickupLocation, DropoffLocation, RentalPrice, RentalStatus) VALUES (6, 2, 1, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Credit Card', 'Confirmed', TO_DATE('2024-09-16', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'), '321 Elm Street', 'Main Office', 350.00, 'In-Progress')
SELECT * FROM dual;

INSERT ALL
    INTO Bills (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status) 
        VALUES (1, 1, 1, '2024-09-15', '2024-09-01', 500.75, 'Paid') -- Lebron James
    INTO Bills (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status) 
        VALUES (2, 2, 2, '2024-10-10', '2024-09-28', 750.50, 'Unpaid') -- Stephen Curry
    INTO Bills (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status) 
        VALUES (3, 3, 3, '2024-10-05', '2024-09-30', 600.00, 'Paid') -- Kevin Durant
    INTO Bills (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status) 
        VALUES (4, 2, 4, '2024-11-20', '2024-10-01', 320.25, 'Unpaid') -- Stephen Curry
    INTO Bills (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status) 
        VALUES (5, 3, 5, '2024-10-15', '2024-10-02', 425.00, 'Paid') -- Kevin Durant
SELECT * FROM dual;

INSERT ALL
    INTO TicketBill (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status, Description, IncidentDate) 
        VALUES (1, 1, 1, '2024-10-15', '2024-09-20', 200.00, 'Pending', 'Speeding violation', '2024-09-18') -- Lebron James
    INTO TicketBill (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status, Description, IncidentDate) 
        VALUES (2, 2, 2, '2024-10-20', '2024-09-25', 150.50, 'Paid', 'Parking violation', '2024-09-22') -- Stephen Curry
    INTO TicketBill (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status, Description, IncidentDate) 
        VALUES (3, 3, 3, '2024-11-01', '2024-10-05', 300.75, 'Overdue', 'Reckless driving', '2024-09-30') -- Kevin Durant
    INTO TicketBill (BillID, CustomerID, RentalID, DueDate, IssueDate, Amount, Status, Description, IncidentDate) 
        VALUES (4, 2, 4, '2024-11-10', '2024-10-10', 100.25, 'Pending', 'Seatbelt violation', '2024-10-05') -- Stephen Curry
SELECT * FROM dual;

exit;

EOF