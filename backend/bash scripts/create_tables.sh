#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

sqlplus64 "msghani/08203666@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca) (Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

CREATE TABLE Cars (
    CarID INT PRIMARY KEY NOT NULL,
    Make VARCHAR2(50) NOT NULL,
    Year INT NOT NULL,
    Model VARCHAR2(50) NOT NULL,
    CarType VARCHAR2(50),
    Mileage INT DEFAULT 0,
    Colour VARCHAR2(50),
    LicensePlate VARCHAR2(20) NOT NULL UNIQUE,
    RentalRate DECIMAL(10, 2) NOT NULL,
    Availability CHAR(1) DEFAULT 'T'
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL UNIQUE,
    ContactNumber VARCHAR2(20) NOT NULL UNIQUE,
    LicenseNumber VARCHAR2(50) NOT NULL UNIQUE,
    Address VARCHAR2(255),
    DateOfBirth DATE,
    LoyaltyMember CHAR(1) DEFAULT 'F'
);


CREATE TABLE Bookings (
    RentalID INT PRIMARY KEY NOT NULL,
    CarID INT NOT NULL,
    CustomerID INT NOT NULL,
    BookingDate DATE NOT NULL,
    MethodOfPayment VARCHAR2(50) DEFAULT 'Credit Card',
    BookingStatus VARCHAR2(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PickupLocation VARCHAR2(100) NOT NULL,
    DropoffLocation VARCHAR2(100) DEFAULT 'Main Office',
    RentalPrice DECIMAL(10, 2) NOT NULL,
    RentalStatus VARCHAR2(50) NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Reviews (
    CarID INT NOT NULL,
    CustomerID INT NOT NULL,
    Feedback VARCHAR2(255) NOT NULL,
    Rating INT NOT NULL,
    PRIMARY KEY (CarID, CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY NOT NULL,
    CarID INT NOT NULL,
    Description VARCHAR2(255) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    Status VARCHAR2(50) NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);


CREATE TABLE Admin (
    EmployeeID INT PRIMARY KEY NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    Username VARCHAR2(50) NOT NULL UNIQUE,
    Password VARCHAR2(255) NOT NULL,
    Email VARCHAR2(100) NOT NULL UNIQUE
);


exit;

EOF