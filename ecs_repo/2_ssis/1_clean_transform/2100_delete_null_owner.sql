-- DELETE ROWS WHERE OWNER IS NULL

USE [ECS_Transform]
GO

DELETE FROM stg_raw WHERE [Owner] IS NULL