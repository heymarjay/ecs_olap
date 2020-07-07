-- POPULATE SCORES

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

INSERT INTO [ECS].[dbo].[f_certification](
		[coffee_id]
      ,[expiration]
      ,[certification_body]
      ,[certification_address]
      ,[certification_contact]
      ,[record_updated]
)
SELECT 
		stg.[coffee_id]
      ,stg.[expiration]
      ,stg.[certification_body]
      ,stg.[certification_address]
      ,stg.[certification_contact]
      ,GETDATE()
FROM  [ECS].[dbo].[f_certification] AS prd RIGHT JOIN [ECS_Transform].[dbo].[stg_f_certification] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE
prd.coffee_id IS NULL

-- LOG ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('f_certification', 'INSERT', @rc, @dms, GETDATE());

