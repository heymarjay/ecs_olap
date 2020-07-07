--POPULATE ANALYSIS

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[f_analysis](
		[coffee_id]
      ,[moisture]
      ,[category_one_defects]
      ,[quakers]
      ,[color]
      ,[category_two_defects]
      ,[record_updated]
)
SELECT 
		stg.[coffee_id]
      ,stg.[moisture]
      ,stg.[category_one_defects]
      ,stg.[quakers]
      ,stg.[color]
      ,stg.[category_two_defects]
      ,GETDATE()
FROM  [ECS].[dbo].[f_analysis] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_f_analysis] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE
prd.coffee_id IS NULL

-- LOG ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('f_analysis', 'INSERT', @rc, @dms, GETDATE());
