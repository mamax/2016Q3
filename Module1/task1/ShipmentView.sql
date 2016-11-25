SELECT        W.City as OriginCity, M.City as DestinationCity, T.Brand, S.StartDate, S.CompleteDate, CA.Weight, CA.Volume as Volume, R.Distance*T.FuelConsumption/100 as FuelSpend
FROM            [QtaskDB].[dbo].[Route] as R
				INNER JOIN [QtaskDB].[dbo].[Cargo] CA ON R.RouteId = CA.RouteId 
				INNER JOIN [QtaskDB].[dbo].[Shipment] S ON R.RouteId = S.RouteId
				INNER JOIN [QtaskDB].[dbo].Truck T ON S.TruckId = T.TruckId
				LEFT JOIN [QtaskDB].[dbo].[Warehouse] W ON R.OriginWarehouseId = W.WarehouseId 
				LEFT JOIN [QtaskDB].[dbo].[Warehouse] M ON R.DestinationWarehouseId = M.WarehouseId;