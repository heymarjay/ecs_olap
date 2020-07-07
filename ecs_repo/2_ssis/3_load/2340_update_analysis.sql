-- UPDATE ANALYSIS

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET 	[moisture]=stg.[moisture]
      ,[category_one_defects]=stg.[category_one_defects]
      ,[quakers]=stg.[quakers]
      ,[color]=stg.[color]
      ,[category_two_defects]=stg.[category_two_defects]
      ,record_updated=GETDATE()
FROM [ECS].[dbo].[f_analysis] AS prd JOIN [ECS_Transform].[dbo].[stg_f_analysis] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE prd.[moisture]<>stg.[moisture]
      OR prd.[category_one_defects]<>stg.[category_one_defects]
      OR prd.[quakers]<>stg.[quakers]
      OR prd.[color]<>stg.[color]
      OR prd.[category_two_defects]<>stg.[category_two_defects]

-- LOG ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('f_analysis', 'UPDATE', @rc, @dms, GETDATE());