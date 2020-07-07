-- UPDATE SPECIES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET [species_name]=stg.[species_name],
	record_updated=GETDATE()
FROM [ECS].[dbo].[d_species] AS prd JOIN [ECS_Transform].[dbo].[stg_d_species] AS stg ON prd.species_id=stg.species_id
WHERE prd.[species_name]<>stg.[species_name]

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_species', 'UPDATE', @rc, @dms, GETDATE());