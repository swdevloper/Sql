USE [SimpleSteps]
GO

/****** Object:  StoredProcedure [dbo].[spCreateMeasuredValues]    Script Date: 12.03.2026 21:10:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ==================================================================
-- Author:		Marcel Butterweck
-- Create date: 2026.03.10
-- Description:	Erstellt Testdatesätze für die MeasuredData Tabelle
-- ==================================================================
CREATE OR ALTER   PROCEDURE [dbo].[spCreateMeasuredValues2]
	@SensorId int,
	@DateTimeStart datetime,
	@DateTimeEnd datetime,
	@MinValue decimal(18,4),
	@MaxValue decimal(18,4)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		Declare @CurrentDateTime datetime
		Declare @RandomValue decimal(18,4)
		Declare @NewId bigint

		-- Parameter prüfen
		IF @DateTimeStart IS NULL
			THROW 50001, 'DateTimeStart darf nicht null sein!',1
		IF @DateTimeEnd IS NULL
			THROW 50002, 'DateTimeEnd darf nicht null sein!',1

		Declare @SensorCount int
		Set @SensorCount = (Select Id from dbo.Sensor where Id = @SensorId)
		IF @SensorCount = 0
			THROW 50003, 'Sensor nicht vorhanden!',1



		Set @CurrentDateTime = @DateTimeStart
		While @CurrentDateTime <= @DateTimeEnd
		BEGIN
			Set @RandomValue = Cast(@MinValue + (@MaxValue - @MinValue) * RAND(Checksum(NEWID())) as Decimal(18,4))
			Set @RandomValue = Round(@RandomValue,2)

			Insert into dbo.MeasuredData(MeasuredDateTime, MeasuredValue, Unit, SensorId) 
				values (@CurrentDateTime, @RandomValue, '°C', @SensorId)

			Set @NewId = Scope_Identity()
			
			Print Concat(@CurrentDateTime,' ',@RandomValue)
			Set @CurrentDateTime = DATEADD(DAY,1,@CurrentDateTime)
		END
	END TRY
	BEGIN CATCH
		PRINT 'Fehler in Prozedur [dbo].[spCreateMeasuredValues] aufgetreten.'
		Print Concat('Fehlernummer: ', ERROR_Number())
		Print Concat('Fehlermeldung: ', ERROR_Message())
		Print Concat('In Zeile: ', ERROR_Line());
		THROW
	END CATCH
END
GO


