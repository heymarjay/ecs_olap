-- UPDATE OWNER

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET owner_name=stg.owner_name,
	record_updated=GETDATE()
FROM [ECS].[dbo].[d_owner] AS prd JOIN [ECS_Transform].[dbo].[stg_d_owner] AS stg ON prd.owner_id=stg.owner_id
WHERE prd.owner_name<>stg.owner_name

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_owner', 'UPDATE', @rc, @dms, GETDATE());