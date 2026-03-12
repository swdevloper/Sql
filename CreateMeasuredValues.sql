USE [SimpleSteps]
GO

DECLARE @RC int
DECLARE @SensorId int
DECLARE @DateTimeStart datetime
DECLARE @DateTimeEnd datetime
DECLARE @MinValue decimal(18,4)
DECLARE @MaxValue decimal(18,4)



Set @SensorId = 2
Set @DateTimeStart = '2026-03-01 00:00:00'
Set @DateTimeEnd = '2026-04-01 00:00:00'
Set @MinValue  = 21
Set @MaxValue  = 27

EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue


Set @SensorId = 3
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue


Set @SensorId = 4
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue

Set @SensorId = 5
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue

Set @SensorId = 6
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue


Set @SensorId = 7
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue


Set @SensorId = 8
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue

Set @SensorId = 9
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue


Set @SensorId = 10
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue


Set @SensorId = 11
EXECUTE @RC = [dbo].[spCreateMeasuredValues] 
   @SensorId
  ,@DateTimeStart
  ,@DateTimeEnd
  ,@MinValue
  ,@MaxValue