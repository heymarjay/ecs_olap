-- POPULATE SCORES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[f_scores](
		[coffee_id]
      ,[fragrance_aroma]
      ,[flavor]
      ,[aftertaste]
      ,[salt_acid]
      ,[bitter_sweet]
      ,[mouthfeel]
      ,[uniform_cup]
      ,[clean_cup]
      ,[balance]
      ,[overall]
      ,[total_cup_points]
      ,[record_updated]
)
SELECT 
		stg.[coffee_id]
      ,stg.[fragrance_aroma]
      ,stg.[flavor]
      ,stg.[aftertaste]
      ,stg.[salt_acid]
      ,stg.[bitter_sweet]
      ,stg.[mouthfeel]
      ,stg.[uniform_cup]
      ,stg.[clean_cup]
      ,stg.[balance]
      ,stg.[overall]
      ,stg.[total_cup_points]
      ,GETDATE()
FROM  [ECS].[dbo].[f_scores] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_f_scores] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE
prd.coffee_id IS NULL

-- LOG ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('f_scores', 'INSERT', @rc, @dms, GETDATE());