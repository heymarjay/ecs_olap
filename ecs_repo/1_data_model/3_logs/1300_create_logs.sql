USE [ECS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[logs_table](
	[table] [nvarchar](255) NULL,
	[operation] [nvarchar](255) NULL,
	[records_affected] [int] NULL,
	[duration_ms] [int] NULL,
	[record_time] [datetime] NULL
) ON [PRIMARY]
GO


