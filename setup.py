import mariadb
import sys
import time

time.sleep(5)

try:
    conn = mariadb.connect(
        user="root",
        password="root",
        host="mariadb",
        port=3306,
        database="ski_db"
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB: {e}")
    sys.exit(1)

cursor = conn.cursor()




schema_sql = [
     """
    CREATE TABLE IF NOT EXISTS Customer (
        ID INT PRIMARY KEY,
        Name VARCHAR(100),
        Email VARCHAR(100) UNIQUE,
        Date_of_Birth DATE
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS Reservation (
        Reservation_Number INT PRIMARY KEY,
        Start_Date DATE,
        End_Date DATE,
        Booking_Date DATE,
        Customer_ID INT,
        FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS Payment (
        Payment_Number INT PRIMARY KEY,
        Total DECIMAL(10, 2),
        Date DATE,
        Reservation_Number INT UNIQUE,
        FOREIGN KEY (Reservation_Number) REFERENCES Reservation(Reservation_Number)
    )   
    """,
    """
    CREATE TABLE IF NOT EXISTS Vacation_Package (
        Package_ID INT PRIMARY KEY,
        Package_Type VARCHAR(50),
        Price DECIMAL(10, 2),
        Reservation_Number INT UNIQUE,
        FOREIGN KEY (Reservation_Number) REFERENCES Reservation(Reservation_Number)
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS Ski_Zone (
        Ski_Zone_ID INT PRIMARY KEY,
        Location VARCHAR(100),
        Difficulty VARCHAR(20) CHECK (Difficulty IN ('Easy', 'Medium', 'Hard'))
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS Skipass (
        Ski_Pass_ID INT PRIMARY KEY,
        Start_Date DATE,
        End_Date DATE,
        Package_ID INT,
        Ski_Zone_ID INT,
        FOREIGN KEY (Package_ID) REFERENCES Vacation_Package(Package_ID),
        FOREIGN KEY (Ski_Zone_ID) REFERENCES Ski_Zone(Ski_Zone_ID)
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS Resort (
        Name VARCHAR(100),
        Room_Number INT,
        Location_Number INT PRIMARY KEY
    )
    """
    
]


for stmt in schema_sql:
    cursor.execute(stmt)



print("Database schema created and sample data inserted.")

# 1. Customers with future skipasses, sorted by total reservation nights
cursor.execute("""
    SELECT c.Name, SUM(DATEDIFF(r.End_Date, r.Start_Date)) AS Total_Nights
    FROM Customer c
    JOIN Reservation r ON c.ID = r.Customer_ID
    JOIN Vacation_Package vp ON r.Reservation_Number = vp.Reservation_Number
    JOIN Skipass sp ON vp.Package_ID = sp.Package_ID
    WHERE r.Start_Date > CURDATE()
    GROUP BY c.ID
    ORDER BY Total_Nights DESC
""")
print("\n1. Customers with future skipasses by total reservation nights:")
for row in cursor.fetchall():
    print(row)

# 2. Most often booked package
cursor.execute("""
    SELECT Package_Type, COUNT(*) AS Booked_Count
    FROM Vacation_Package
    GROUP BY Package_Type
    ORDER BY Booked_Count DESC
    LIMIT 1
""")
print("\n2. Most often booked package:")
for row in cursor.fetchall():
    print(row)

# 3. Reservations above a price threshold
cursor.execute("""
    SELECT p.Payment_Number, r.Reservation_Number, p.Total
    FROM Payment p
    JOIN Reservation r ON p.Reservation_Number = r.Reservation_Number
    WHERE p.Total > 1250
    """)
print("\n3. Reservations with price above threshold:")
for row in cursor.fetchall():
    print(row)

# 4. Revenue from package sales within a date range
cursor.execute("""
    SELECT SUM(vp.Price) AS Total_Revenue
    FROM Vacation_Package vp
    JOIN Reservation r ON vp.Reservation_Number = r.Reservation_Number
    WHERE r.Start_Date BETWEEN '2025-01-01' AND '2025-03-31'
""")
print("\n4. Revenue from package sales (Jan–Mar 2025):")
for row in cursor.fetchall():
    print(row)

# 5. Customers who have never made a reservation
cursor.execute("""
    SELECT c.ID, c.Name
    FROM Customer c
    LEFT JOIN Reservation r ON c.ID = r.Customer_ID
    WHERE r.Reservation_Number IS NULL
""")
print("\n5. Customers without reservations:")
for row in cursor.fetchall():
    print(row)

# 6. Ski zones ranked by number of skipasses
cursor.execute("""
    SELECT sz.Location, COUNT(sp.Ski_Pass_ID) AS Skipass_Count
    FROM Ski_Zone sz
    JOIN Skipass sp ON sz.Ski_Zone_ID = sp.Ski_Zone_ID
    GROUP BY sz.Location
    ORDER BY Skipass_Count DESC
""")
print("\n6. Ski zones ranked by skipass usage:")
for row in cursor.fetchall():
    print(row)



cursor.close()
conn.close()