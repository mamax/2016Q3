# 2016Q3

Module 1
Task 1:
1. Design and implement database in SSMS.
2. Generate SQL script with all database objects and constraints.
3. Create ER Diagram upon database.

Task 2
1. Imported data from Excel file(using Import Data and take Excel file as a sourcea and destination database tables).
2. In order to populate Shipment table with 1000 records using random Truck Id, and Route Id, I set coloumn [ShipmentId] as int not null identity(1,1);
Than I set identity_insert [QtaskDB].[dbo].[Shipment] OFF.
And inserted 1000 values into RouteId and TruckId in accordance.
3. I  created 'Customer' table and added data from Excel file, then added coloumn 'CustomerId' to 'Cargo' table with random values from Customer table.

Task 3
1. Added necessary tables to view and checked necessary fields.
Than I refactored Query according to the task and calculated 'FuelSpend' for every journey.
