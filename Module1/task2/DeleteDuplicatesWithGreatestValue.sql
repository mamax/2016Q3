/******Adding an extra row into Truck table *****/
INSERT [QtaskDB].[dbo].[Truck] values (21, 'MAN', '1ABC234', '2014', '17500', '20', '95');

/******delete duplicates with the same RegistrationNumber values in Truck table. From two rows with identical RegistrationNumber values delete the row with greatest TruckId. Write At least two variants*****/
DELETE FROM [QtaskDB].[dbo].[Truck] 
WHERE [TruckId] = ( SELECT MAX([TruckId]) FROM [QtaskDB].[dbo].[Truck])

DELETE FROM [QtaskDB].[dbo].[Truck] 
WHERE [TruckId] = ( SELECT MAX([TruckId]) FROM [QtaskDB].[dbo].[Truck] WHERE [RegistrationNumber] ='1ABC234')

DELETE FROM [QtaskDB].[dbo].[Truck]
	   WHERE [RegistrationNumber] ='1ABC234'
	   ORDER BY [TruckId] DESC
	   LIMIT 1;
