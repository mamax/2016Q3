USE [QtaskDB]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 11/25/2016 1:14:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoId] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[Volume] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL DEFAULT ((10)),
 CONSTRAINT [pk_Cargo] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Birthdate] [datetime] NOT NULL,
 CONSTRAINT [pk_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Driver]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverId] [int] NOT NULL,
	[FirstName] [nchar](255) NULL,
	[LastName] [nchar](255) NULL,
	[Birthdate] [datetime] NOT NULL,
 CONSTRAINT [pk_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[RouteId] [int] NOT NULL,
	[OriginWarehouseId] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[DestinationWarehouseId] [int] NOT NULL,
 CONSTRAINT [pk_Route] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[TruckId] [int] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Truck]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[TruckId] [int] NOT NULL,
	[Brand] [nchar](255) NOT NULL,
	[RegistrationNumber] [nchar](255) NOT NULL,
	[Year] [int] NOT NULL,
	[Payload] [int] NOT NULL,
	[FuelConsumption] [int] NOT NULL,
	[VolumeCargo] [int] NOT NULL,
 CONSTRAINT [pk_Truck] PRIMARY KEY CLUSTERED 
(
	[TruckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TruckAndDriver]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckAndDriver](
	[TruckId] [int] NOT NULL,
	[DriverId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 11/25/2016 1:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseId] [int] NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NOT NULL,
 CONSTRAINT [pk_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD  CONSTRAINT [fk_Cargo_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([RouteId])
GO
ALTER TABLE [dbo].[Cargo] CHECK CONSTRAINT [fk_Cargo_Route]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [fk_Route_DestinationWarehouse] FOREIGN KEY([DestinationWarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [fk_Route_DestinationWarehouse]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [fk_Route_OriginWarehouse] FOREIGN KEY([OriginWarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [fk_Route_OriginWarehouse]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [fk_Shipment_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([RouteId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [fk_Shipment_Route]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [fk_Shipment_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([TruckId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [fk_Shipment_Truck]
GO
ALTER TABLE [dbo].[TruckAndDriver]  WITH CHECK ADD  CONSTRAINT [fk_TruckAndDriver_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[TruckAndDriver] CHECK CONSTRAINT [fk_TruckAndDriver_Driver]
GO
ALTER TABLE [dbo].[TruckAndDriver]  WITH NOCHECK ADD  CONSTRAINT [fk_TruckAndDriver_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([TruckId])
GO
ALTER TABLE [dbo].[TruckAndDriver] CHECK CONSTRAINT [fk_TruckAndDriver_Truck]
GO
