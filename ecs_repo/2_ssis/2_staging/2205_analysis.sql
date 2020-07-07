-- POPULATE ANALYSIS

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_f_analysis

INSERT INTO [stg_f_analysis](
		[coffee_id]
      ,[moisture]
      ,[category_one_defects]
      ,[quakers]
      ,[color]
      ,[category_two_defects]
)
select 
r.[coffee_id]
      ,r.Moisture
      ,r.[Category One Defects]
      ,r.Quakers
      ,r.Color
      ,r.[Category Two Defects]
FROM  [stg_f_analysis] AS stg RIGHT JOIN stg_raw AS r ON (stg.coffee_id=r.coffee_id)
WHERE
stg.coffee_id IS NULL