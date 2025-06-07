DROP TABLE IF EXISTS Skipass;
DROP TABLE IF EXISTS Vacation_Package;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Ski_Zone;
DROP TABLE IF EXISTS Resort;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Date_of_Birth DATE
);


CREATE TABLE Reservation (
    Reservation_Number INT PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE,
    Booking_Date DATE,
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);


CREATE TABLE Payment (
     Payment_Number INT PRIMARY KEY,
    Total DECIMAL(10, 2),
    Date DATE,
    Reservation_Number INT UNIQUE,
    FOREIGN KEY (Reservation_Number) REFERENCES Reservation(Reservation_Number)
);


CREATE TABLE Vacation_Package (
    Package_ID INT PRIMARY KEY,
    Package_Type VARCHAR(50),
    Price DECIMAL(10, 2),
    Reservation_Number INT UNIQUE,
    FOREIGN KEY (Reservation_Number) REFERENCES Reservation(Reservation_Number)
);


CREATE TABLE Ski_Zone (
    Ski_Zone_ID INT PRIMARY KEY,
    Location VARCHAR(100),
    Difficulty VARCHAR(20) CHECK (Difficulty IN ('Easy', 'Medium', 'Hard'))
);


CREATE TABLE Skipass (
    Ski_Pass_ID INT PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE,
    Package_ID INT,
    Ski_Zone_ID INT,
    FOREIGN KEY (Package_ID) REFERENCES Vacation_Package(Package_ID),
    FOREIGN KEY (Ski_Zone_ID) REFERENCES Ski_Zone(Ski_Zone_ID)
);


CREATE TABLE Resort (
    Name VARCHAR(100),
    Room_Number INT,
    Location_Number INT PRIMARY KEY
);