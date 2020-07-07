-- UPDATE COUNTRIES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET country_name=stg.country_name,
	record_updated=GETDATE()
FROM [ECS].[dbo].[d_countries] AS prd JOIN [ECS_Transform].[dbo].[stg_d_countries] AS stg ON prd.country_id=stg.country_id
WHERE prd.country_name<>stg.country_name

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_countries', 'UPDATE', @rc, @dms, GETDATE());