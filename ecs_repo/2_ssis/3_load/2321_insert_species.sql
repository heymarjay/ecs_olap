-- POPULATE SPECIES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[d_species](
		[species_id]
		,[species_name]
        ,[record_updated]
)
SELECT 
		stg.[species_id]
      ,stg.[species_name]
      ,GETDATE()
FROM  [ECS].[dbo].[d_species] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_d_species] AS stg ON (prd.species_id=stg.species_id)
WHERE
prd.species_id IS NULL

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_species', 'INSERT', @rc, @dms, GETDATE());

