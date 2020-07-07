-- LIMIT NUMBER OF DECIMALS

USE [ECS_Transform]
GO

UPDATE stg_raw 
SET	[quality_score]=CAST([quality_score] AS DECIMAL(5,2)),
	[Fragrance / Aroma]=CAST([Fragrance / Aroma] AS DECIMAL(4,2)),
	[Flavor] =CAST([Flavor] AS DECIMAL(4,2)),
	[Aftertaste] =CAST([Aftertaste] AS DECIMAL(4,2)),
	[Salt / Acid] =CAST([Salt / Acid] AS DECIMAL(4,2)),
	[Bitter / Sweet] =CAST([Bitter / Sweet] AS DECIMAL(4,2)),
	[Mouthfeel] =CAST([Mouthfeel] AS DECIMAL(4,2)),
	[Uniform Cup] =CAST([Uniform Cup] AS DECIMAL(4,2)),
	[Clean Cup] =CAST([Clean Cup] AS DECIMAL(4,2)),
	[Balance] =CAST([Balance] AS DECIMAL(4,2)),
	[Cupper Points] =CAST([Cupper Points] AS DECIMAL(4,2)),
	[Moisture]=[Moisture]+'%'