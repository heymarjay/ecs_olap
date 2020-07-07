-- POPULATE COFFEE

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[d_coffee](
		[coffee_id]
      ,[species_id]
      ,[country_id]
      ,[owner_id]
      ,[farm]
      ,[lot_number]
      ,[mill]
      ,[ico_number]
      ,[company]
      ,[altitude_min]
      ,[altitude_max]
      ,[altitude_unit]
      ,[region]
      ,[producer]
      ,[bag_number]
      ,[bag_weight]
      ,[country_partner]
      ,[harvest_year]
      ,[grading_date]
      ,[variety]
      ,[status]
      ,[processing_method]
      ,[record_updated]
)
SELECT 
		stg.[coffee_id]
      ,stg.[species_id]
      ,stg.[country_id]
      ,stg.[owner_id]
      ,stg.[farm]
      ,stg.[lot_number]
      ,stg.[mill]
      ,stg.[ico_number]
      ,stg.[company]
      ,stg.[altitude_min]
      ,stg.[altitude_max]
      ,stg.[altitude_unit]
      ,stg.[region]
      ,stg.[producer]
      ,stg.[bag_number]
      ,stg.[bag_weight]
      ,stg.[country_partner]
      ,stg.[harvest_year]
      ,stg.[grading_date]
      ,stg.[variety]
      ,stg.[status]
      ,stg.[processing_method]
      ,GETDATE()
FROM  [ECS].[dbo].[d_coffee] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_d_coffee] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE
prd.coffee_id IS NULL

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_coffee', 'INSERT', @rc, @dms, GETDATE());

