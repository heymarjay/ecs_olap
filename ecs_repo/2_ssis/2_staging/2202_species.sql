-- POPULATE SPECIES

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_d_species

INSERT INTO [stg_d_species]([species_name])
select 
distinct([Species])
FROM stg_raw
WHERE
   NOT EXISTS (SELECT * FROM [stg_d_species]
              WHERE stg_raw.[Species] = [stg_d_species].[species_name])