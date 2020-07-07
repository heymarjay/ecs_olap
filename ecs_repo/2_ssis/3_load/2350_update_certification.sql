-- UPDATE CERTIFICATION

USE [ECS]
GO

DECLARE @rc INT
DECLARE @dms INT
DECLARE @dt DATETIME2(7)
SET @dt = SYSDATETIME()

UPDATE prd
SET 	[expiration]=stg.[expiration]
      ,[certification_body]=stg.[certification_body]
      ,[certification_address]=stg.[certification_address]
      ,[certification_contact]=stg.[certification_contact]
      ,[record_updated]=GETDATE()
FROM [ECS].[dbo].[f_certification] AS prd JOIN [ECS_Transform].[dbo].[stg_f_certification] AS stg ON (prd.coffee_id=stg.coffee_id)
WHERE prd.[expiration]<>stg.[expiration]
      OR prd.[certification_body]<>stg.[certification_body]
      OR prd.[certification_address]<>stg.[certification_address]
      OR prd.[certification_contact]<>stg.[certification_contact]

-- LOG ENTRY

SELECT @rc = @@ROWCOUNT
SELECT @dms= DATEDIFF(MILLISECOND, @dt, SYSDATETIME())

INSERT INTO logs_table ([table], [operation], [records_affected], [duration_ms], [record_time])
VALUES ('f_certification', 'UPDATE', @rc, @dms, GETDATE());