-- POPULATE COUNTRIES

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_d_countries

INSERT INTO [stg_d_countries]([country_name])
select 
distinct([Country of Origin])
FROM stg_raw
WHERE
   NOT EXISTS (SELECT * FROM [stg_d_countries]
              WHERE stg_raw.[Country of Origin] = [stg_d_countries].[country_name])