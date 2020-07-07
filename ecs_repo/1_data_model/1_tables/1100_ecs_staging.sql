USE [ECS_Transform]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- CREATE direct import from flat file

CREATE TABLE [dbo].[stg_raw](
	[coffee_id] [int] IDENTITY(1,1) NOT NULL,
	[quality_score] [nvarchar](255) NULL,
	[view_certificate_1] [nvarchar](255) NULL,
	[view_certificate_2] [nvarchar](255) NULL,
	[Cupping Protocol and Descriptors] [nvarchar](255) NULL,
	[View Green Analysis Details] [nvarchar](255) NULL,
	[Request a Sample] [nvarchar](255) NULL,
	[Species] [nvarchar](255) NULL,
	[Owner] [nvarchar](255) NULL,
	[Country of Origin] [nvarchar](255) NULL,
	[Farm Name] [nvarchar](255) NULL,
	[Lot Number] [nvarchar](255) NULL,
	[Mill] [nvarchar](255) NULL,
	[ICO Number] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Altitude] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Producer] [nvarchar](255) NULL,
	[Number of Bags] [nvarchar](255) NULL,
	[Bag Weight] [nvarchar](255) NULL,
	[In-Country Partner] [nvarchar](255) NULL,
	[Harvest Year] [nvarchar](255) NULL,
	[Grading Date] [nvarchar](255) NULL,
	[Variety] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Processing Method] [nvarchar](255) NULL,
	[NA] [nvarchar](255) NULL,
	[Fragrance / Aroma] [nvarchar](255) NULL,
	[Flavor] [nvarchar](255) NULL,
	[Aftertaste] [nvarchar](255) NULL,
	[Salt / Acid] [nvarchar](255) NULL,
	[Bitter / Sweet] [nvarchar](255) NULL,
	[Mouthfeel] [nvarchar](255) NULL,
	[NA2] [nvarchar](255) NULL,
	[Uniform Cup] [nvarchar](255) NULL,
	[Clean Cup] [nvarchar](255) NULL,
	[Balance] [nvarchar](255) NULL,
	[Cupper Points] [nvarchar](255) NULL,
	[Total Cup Points] [nvarchar](255) NULL,
	[NA3] [nvarchar](255) NULL,
	[Moisture] [nvarchar](255) NULL,
	[Category One Defects] [nvarchar](255) NULL,
	[Quakers] [nvarchar](255) NULL,
	[Color] [nvarchar](255) NULL,
	[Category Two Defects] [nvarchar](255) NULL,
	[NA4] [nvarchar](255) NULL,
	[Expiration] [nvarchar](255) NULL,
	[Certification Body] [nvarchar](255) NULL,
	[Certification Address] [nvarchar](255) NULL,
	[Certification Contact] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[coffee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


