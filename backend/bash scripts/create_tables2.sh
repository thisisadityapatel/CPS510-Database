#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

sqlplus64 "msghani/08203666@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca) (Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

CREATE TABLE Bills (
    BillID INT PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    RentalID INT NOT NULL,
    DueDate DATE NOT NULL,
    IssueDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR2(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RentalID) REFERENCES Bookings(RentalID)
);


CREATE TABLE TicketBill (
    BillID INT PRIMARY KEY NOT NULL,
    CustomerID INT NOT NULL,
    RentalID INT NOT NULL,
    DueDate DATE NOT NULL,
    IssueDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR2(50) NOT NULL,
    Description VARCHAR2(255) NOT NULL,
    IncidentDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RentalID) REFERENCES Bookings(RentalID)
);


exit;

EOF