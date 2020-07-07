-- POPULATE COUNTRIES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[d_countries](
		[country_id]
      ,[country_name]
      ,[record_updated]
)
SELECT 
		stg.[country_id]
      ,stg.[country_name]
      ,GETDATE()
FROM  [ECS].[dbo].[d_countries] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_d_countries] AS stg ON (prd.country_id=stg.country_id)
WHERE
prd.country_id IS NULL

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_countries', 'INSERT', @rc, @dms, GETDATE());

