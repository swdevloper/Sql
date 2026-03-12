USE [SimpleSteps]
GO


-- Insert Befehle --
INSERT INTO [dbo].[MeasuredData] ([MeasuredDateTime], [MeasuredValue], [Unit]) VALUES ('2026-03-05 20:00', 23.5, '°C')
GO
INSERT INTO [dbo].[MeasuredData] ([MeasuredDateTime], [MeasuredValue], [Unit]) VALUES ('2026-03-05 20:05', 23.5, '°C')
GO
INSERT INTO [dbo].[MeasuredData] ([MeasuredDateTime], [MeasuredValue], [Unit]) VALUES ('2026-03-05 20:10', 23.5, '°C')
GO
INSERT INTO [dbo].[MeasuredData] ([MeasuredDateTime], [MeasuredValue], [Unit]) VALUES ('2026-03-05 20:15', 23.5, '°C')
GO
INSERT INTO [dbo].[MeasuredData] ([MeasuredDateTime], [MeasuredValue], [Unit]) VALUES ('2026-03-05 20:25', 23.5, '°C')
GO


-- Read Befehle --
Select * from dbo.MeasuredData
go
Select MeasuredValue, Unit from dbo.MeasuredData
go
Select MeasuredValue, Unit from dbo.MeasuredData order by MeasuredValue desc
go
Select MeasuredValue, Unit from dbo.MeasuredData where MeasuredValue < 20.0  order by MeasuredValue desc
go

-- Update Befehle --
Update dbo.MeasuredData set Unit = 'Celsius'
go
Select * from dbo.MeasuredData
go
Update dbo.MeasuredData set Unit = '°C',MeasuredValue = 20.0
go
Select * from dbo.MeasuredData
go
Update dbo.MeasuredData set MeasuredValue = 24.5 where Id < 10
go
Select * from dbo.MeasuredData
go

-- Delete Befehle --
Delete from dbo.MeasuredData where Id = 5
Go
Select * from dbo.MeasuredData
go