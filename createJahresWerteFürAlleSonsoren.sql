DECLARE @RC int
DECLARE @SensorId int
DECLARE @DateTimeStart datetime
DECLARE @DateTimeEnd datetime
DECLARE @MinValue decimal(18,4)
DECLARE @MaxValue decimal(18,4)


Set @DateTimeStart = '2025-01-01 00:00:00'
Set @DateTimeEnd = '2026-01-01 00:00:00'
Set @MinValue  = 21
Set @MaxValue  = 27

DECLARE sensorList CURSOR FOR
	Select Id from dbo.Sensor where dbo.Sensor.SensorType = 'Klimasensor'
OPEN sensorList

FETCH NEXT FROM sensorList INTO @SensorId
WHILE @@FETCH_STATUS = 0
BEGIN
	EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
	@SensorId
	,@DateTimeStart
	,@DateTimeEnd
	,@MinValue
	,@MaxValue

	FETCH NEXT FROM sensorList INTO @SensorId
END

CLOSE sensorList
DEALLOCATE sensorList


Set @MinValue  = 100
Set @MaxValue  = 400

DECLARE sensorList CURSOR FOR
	Select Id from dbo.Sensor where dbo.Sensor.SensorType = 'Trinksensor'
OPEN sensorList

FETCH NEXT FROM sensorList INTO @SensorId
WHILE @@FETCH_STATUS = 0
BEGIN
	EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
	@SensorId
	,@DateTimeStart
	,@DateTimeEnd
	,@MinValue
	,@MaxValue

	FETCH NEXT FROM sensorList INTO @SensorId
END

CLOSE sensorList
DEALLOCATE sensorList