-- UPDATE COFFEE

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET 	[farm]=stg.[farm]
      ,[lot_number]=stg.[lot_number]
      ,[mill]=stg.[mill]
      ,[ico_number]=stg.[ico_number]
      ,[company]=stg.[company]
      ,[altitude_min]=stg.[altitude_min]
      ,[altitude_max]=stg.[altitude_max]
      ,[altitude_unit]=stg.[altitude_unit]
      ,[region]=stg.[region]
      ,[producer]=stg.[producer]
      ,[bag_number]=stg.[bag_number]
      ,[bag_weight]=stg.[bag_weight]
      ,[country_partner]=stg.[country_partner]
      ,[harvest_year]=stg.[harvest_year]
      ,[grading_date]=stg.[grading_date]
      ,[variety]=stg.[variety]
      ,[status]=stg.[status]
      ,[processing_method]=stg.[processing_method]
      ,record_updated=GETDATE()
FROM [ECS].[dbo].[d_coffee] AS prd JOIN [ECS_Transform].[dbo].[stg_d_coffee] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE prd.[farm]<>stg.[farm]
      OR prd.[lot_number]<>stg.[lot_number]
      OR prd.[mill]<>stg.[mill]
      OR prd.[ico_number]<>stg.[ico_number]
      OR prd.[company]<>stg.[company]
      OR prd.[altitude_min]<>stg.[altitude_min]
      OR prd.[altitude_max]<>stg.[altitude_max]
      OR prd.[altitude_unit]<>stg.[altitude_unit]
      OR prd.[region]<>stg.[region]
      OR prd.[producer]<>stg.[producer]
      OR prd.[bag_number]<>stg.[bag_number]
      OR prd.[bag_weight]<>stg.[bag_weight]
      OR prd.[country_partner]<>stg.[country_partner]
      OR prd.[harvest_year]<>stg.[harvest_year]
      OR prd.[grading_date]<>stg.[grading_date]
      OR prd.[variety]<>stg.[variety]
      OR prd.[status]<>stg.[status]
      OR prd.[processing_method]<>stg.[processing_method]
	  
-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_coffee', 'UPDATE', @rc, @dms, GETDATE());