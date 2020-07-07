-- DELETE ROWS WITH NULL COUNTRY

USE [ECS_Transform]
GO

DELETE FROM stg_raw WHERE [Country of Origin] IS NULL