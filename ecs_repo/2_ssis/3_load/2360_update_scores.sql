-- POPULATE SCORES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET 	[fragrance_aroma]=stg.[fragrance_aroma]
      ,[flavor]=stg.[flavor]
      ,[aftertaste]=stg.[aftertaste]
      ,[salt_acid]=stg.[salt_acid]
      ,[bitter_sweet]=stg.[bitter_sweet]
      ,[mouthfeel]=stg.[mouthfeel]
      ,[uniform_cup]=stg.[uniform_cup]
      ,[clean_cup]=stg.[clean_cup]
      ,[balance]=stg.[balance]
      ,[overall]=stg.[overall]
      ,[total_cup_points]=stg.[total_cup_points]
      ,[record_updated]=GETDATE()
FROM [ECS].[dbo].[f_scores] AS prd JOIN [ECS_Transform].[dbo].[stg_f_scores] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE prd.[fragrance_aroma]<>stg.[fragrance_aroma]
      OR prd.[flavor]<>stg.[flavor]
      OR prd.[aftertaste]<>stg.[aftertaste]
      OR prd.[salt_acid]<>stg.[salt_acid]
	  OR prd.[bitter_sweet]<>stg.[bitter_sweet]
      OR prd.[mouthfeel]<>stg.[mouthfeel]
      OR prd.[uniform_cup]<>stg.[uniform_cup]
	  OR prd.[clean_cup]<>stg.[clean_cup]
	  OR prd.[balance]<>stg.[balance]
      OR prd.[overall]<>stg.[overall]
	  OR prd.[total_cup_points]<>stg.[total_cup_points]

-- LOG ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('f_scores', 'UPDATE', @rc, @dms, GETDATE());