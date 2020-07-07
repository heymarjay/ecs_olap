-- POPULATE OWNER

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[d_owner](
		[owner_id]
      ,[owner_name]
      ,[record_updated]
)
SELECT 
		stg.[owner_id]
      ,stg.[owner_name]
      ,GETDATE()
FROM  [ECS].[dbo].[d_owner] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_d_owner] AS stg ON (prd.owner_id=stg.owner_id)
WHERE
prd.owner_id IS NULL

-- LOGS ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('d_owner', 'INSERT', @rc, @dms, GETDATE());

