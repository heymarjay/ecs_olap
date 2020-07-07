-- POPULATE OWNERS

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_d_owner

INSERT INTO [stg_d_owner]([owner_name])
select 
distinct([Owner])
FROM stg_raw
WHERE
   NOT EXISTS (SELECT * FROM [stg_d_owner]
              WHERE stg_raw.[Owner] = [stg_d_owner].[owner_name])