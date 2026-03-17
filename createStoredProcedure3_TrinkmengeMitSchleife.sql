USE [SimpleSteps]
GO

/****** Object:  StoredProcedure [dbo].[spCreateMeasuredValues2]    Script Date: 17.03.2026 18:40:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ==================================================================
-- Author:		Marcel Butterweck
-- Create date: 2026.03.10
-- Description:	Erstellt Testdatesätze für die MeasuredData Tabelle
-- ==================================================================
CREATE OR ALTER  PROCEDURE [dbo].[spCreateMeasuredValues3]
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


		Declare @RandomValue decimal(18,4)
		Declare @RandomMinute int
		Declare @RandomTime datetime

		Set @CurrentDateTime = @DateTimeStart
		While @CurrentDateTime <= @DateTimeEnd
		BEGIN

		    DECLARE @i INT = 1
            WHILE @i <= 4
            BEGIN
				Set @RandomValue = Round(Cast(@MinValue + (@MaxValue - @MinValue) * RAND(Checksum(NEWID())) as Decimal(18,4)),2)
				Set @RandomMinute =Cast(0 + (1440 - 0) * RAND(Checksum(NEWID())) as int)
				Set @RandomTime = DATEADD(MINUTE,@RandomMinute,@CurrentDateTime)
				Print Concat(@RandomTime,' ',@RandomValue)
				Insert into dbo.MeasuredData(MeasuredDateTime, MeasuredValue, Unit, SensorId) 
					values (@RandomTime, @RandomValue, 'ml', @SensorId)

				SET @i = @i + 1
			END
			Set @CurrentDateTime = DATEADD(Day,1,@CurrentDateTime)
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


