# Database_assignment2

Created by Sabau Raman

📆 Project Overview
This project sets up a relational database using MariaDB and automatically populates it with sample data using a Python script. The script also runs six business queries and prints the results to the terminal.

🧰 Technologies Used
MariaDB – for the relational database

Python 3.13 – for automation and query execution

Docker + Docker Compose – to containerize the environment

SQL – for schema and data definition



📁 Project Structure

.
├── docker-compose.yml       # Defines MariaDB and setup service
├── DockerFile               # Builds the Python container
├── setup.py                 # Runs schema, inserts, and queries
├── scheme.sql               # SQL schema for all tables
├── sample_data.sql          # Contains insert statements
├── README.md                # Project instructions


🚀 How to Run This Project
1. Clone the Repository

git clone https://github.com/SabauRaman/Database_assignment2.git
cd Database_assignment2

2. Build and Start Everything

docker-compose up --build
This will:

Start MariaDB in a container

Wait until the database is ready

Run the setup.py script that:

Creates all tables from scheme.sql

Loads 10+ sample rows per table from sample_data.sql

Executes 6 business SQL queries

Prints results 

🧹 Clean Up

docker-compose down --volumes
This stops and removes all containers and deletes the volume that stores database data.

🧾 SQL Queries Implemented
Customers with future skipass reservations sorted by reservation duration

Most frequently booked vacation package

Reservations with a price above a threshold

Total package revenue in a date range

Customers with no reservations

Ski zones ranked by skipass usage
