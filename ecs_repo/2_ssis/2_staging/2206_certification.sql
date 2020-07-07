-- POPULATE CERTIFICATION TABLE

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_f_certification

INSERT INTO [stg_f_certification](
		[coffee_id]
      ,[expiration]
      ,[certification_body]
      ,[certification_address]
      ,[certification_contact]
)
select 
		r.[coffee_id]
      ,r.Expiration
      ,r.[Certification Body]
      ,r.[Certification Address]
      ,r.[Certification Contact]
FROM  [stg_f_certification] AS stg RIGHT JOIN stg_raw AS r ON (stg.coffee_id=r.coffee_id)
WHERE
stg.coffee_id IS NULL