-- POPULATE SCORES

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_f_scores

INSERT INTO [stg_f_scores](
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
)
select 
r.coffee_id
      ,r.[Fragrance / Aroma]
      ,r.Flavor
      ,r.Aftertaste
      ,r.[Salt / Acid]
      ,r.[Bitter / Sweet]
      ,r.Mouthfeel
      ,r.[Uniform Cup]
      ,r.[Clean Cup]
      ,r.Balance
      ,r.[Cupper Points]
      ,r.quality_score
FROM  stg_f_scores AS stg RIGHT JOIN stg_raw AS r ON (stg.coffee_id=r.coffee_id)
WHERE
stg.coffee_id IS NULL