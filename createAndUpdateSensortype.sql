Alter table dbo.Sensor add SensorType nvarchar(50)
GO

Select * from dbo.Sensor where UserId is null
go

update dbo.Sensor set SensorType = 'Klimasensor' where UserId is null
GO

Select * from dbo.Sensor where RoomId is null
go

update dbo.Sensor set SensorType = 'Trinksensor' where RoomId is null
GO

Select * from dbo.Sensor
GO
