-- LEAVE ONLY NUMBERS

USE [ECS_Transform]
GO


UPDATE stg_raw 
SET
	[Category One Defects]=REPLACE([Category One Defects],' full defects',''),
	[Category Two Defects]=REPLACE([Category One Defects],' full defects','')