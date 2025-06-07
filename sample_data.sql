-- Customers
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (1, 'Customer1', 'customer1@email.com', '1991-02-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (2, 'Customer2', 'customer2@email.com', '1992-03-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (3, 'Customer3', 'customer3@email.com', '1993-04-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (4, 'Customer4', 'customer4@email.com', '1994-05-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (5, 'Customer5', 'customer5@email.com', '1995-06-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (6, 'Customer6', 'customer6@email.com', '1996-07-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (7, 'Customer7', 'customer7@email.com', '1997-08-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (8, 'Customer8', 'customer8@email.com', '1998-09-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (9, 'Customer9', 'customer9@email.com', '1999-01-15');
INSERT INTO Customer (ID, Name, Email, Date_of_Birth) VALUES (10, 'Customer10', 'customer10@email.com', '1990-02-15');

-- Ski Zones
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (1, 'Zone1', 'Hard');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (2, 'Zone2', 'Medium');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (3, 'Zone3', 'Easy');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (4, 'Zone4', 'Hard');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (5, 'Zone5', 'Hard');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (6, 'Zone6', 'Medium');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (7, 'Zone7', 'Easy');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (8, 'Zone8', 'Medium');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (9, 'Zone9', 'Medium');
INSERT INTO Ski_Zone (Ski_Zone_ID, Location, Difficulty) VALUES (10, 'Zone10', 'Hard');

-- Resorts
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort1', 101, 1);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort2', 102, 2);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort3', 103, 3);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort4', 104, 4);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort5', 105, 5);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort6', 106, 6);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort7', 107, 7);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort8', 108, 8);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort9', 109, 9);
INSERT INTO Resort (Name, Room_Number, Location_Number) VALUES ('Resort10', 110, 10);

-- Reservations
INSERT INTO Reservation (Reservation_Number, Start_Date, End_Date, Booking_Date, Customer_ID) VALUES 
(1, '2025-07-10', '2025-07-15', '2025-06-01', 1),
(2, '2025-07-12', '2025-07-18', '2025-06-02', 2),
(3, '2025-07-15', '2025-07-20', '2025-06-03', 3),
(4, '2025-07-18', '2025-07-23', '2025-06-04', 4),
(5, '2025-07-21', '2025-07-26', '2025-06-05', 5),
(6, '2025-07-24', '2025-07-29', '2025-06-06', 6),
(7, '2025-07-27', '2025-08-01', '2025-06-07', 7),
(8, '2025-07-30', '2025-08-04', '2025-06-08', 8),
(9, '2025-08-02', '2025-08-07', '2025-06-09', 9),
(10, '2025-08-05', '2025-08-10', '2025-06-10', 10);

-- Payments
INSERT INTO Payment (Payment_Number, Total, Date, Reservation_Number) VALUES 
(1, 1500.00, '2025-06-01', 1),
(2, 1800.00, '2025-06-02', 2),
(3, 1700.00, '2025-06-03', 3),
(4, 1400.00, '2025-06-04', 4),
(5, 1350.00, '2025-06-05', 5),
(6, 1600.00, '2025-06-06', 6),
(7, 1750.00, '2025-06-07', 7),
(8, 1450.00, '2025-06-08', 8),
(9, 1550.00, '2025-06-09', 9),
(10, 1650.00, '2025-06-10', 10);

-- Vacation Packages
INSERT INTO Vacation_Package (Package_ID, Package_Type, Price, Reservation_Number) VALUES 
(1, 'Standard', 1200.00, 1),
(2, 'Premium', 1400.00, 2),
(3, 'Family', 1600.00, 3),
(4, 'Standard', 1300.00, 4),
(5, 'Premium', 1500.00, 5),
(6, 'Family', 1700.00, 6),
(7, 'Standard', 1250.00, 7),
(8, 'Premium', 1350.00, 8),
(9, 'Family', 1450.00, 9),
(10, 'Standard', 1550.00, 10);

-- Skipasses
INSERT INTO Skipass (Ski_Pass_ID, Start_Date, End_Date, Package_ID, Ski_Zone_ID) VALUES 
(1, '2025-07-10', '2025-07-15', 1, 1),
(2, '2025-07-12', '2025-07-18', 2, 2),
(3, '2025-07-15', '2025-07-20', 3, 3),
(4, '2025-07-18', '2025-07-23', 4, 4),
(5, '2025-07-21', '2025-07-26', 5, 5),
(6, '2025-07-24', '2025-07-29', 6, 6),
(7, '2025-07-27', '2025-08-01', 7, 7),
(8, '2025-07-30', '2025-08-04', 8, 8),
(9, '2025-08-02', '2025-08-07', 9, 9),
(10, '2025-08-05', '2025-08-10', 10, 10);