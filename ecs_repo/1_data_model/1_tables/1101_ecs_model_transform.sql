USE ECS_Transform
GO

-- CREATE STAGING TABLES

CREATE TABLE [stg_d_coffee] (
	[coffee_id] [int] NOT NULL,
	[species_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[owner_id] [int] NOT NULL,
	[farm] [nvarchar](255) NULL,
	[lot_number] [nvarchar](255) NULL,
	[mill] [nvarchar](255) NULL,
	[ico_number] [nvarchar](255) NULL,
	[company] [nvarchar](255) NULL,
	[altitude_min] [nvarchar](255) NULL,
	[altitude_max] [nvarchar](255) NULL,
	[altitude_unit] [nvarchar](255) NULL,
	[region] [nvarchar](255) NULL,
	[producer] [nvarchar](255) NULL,
	[bag_number] [nvarchar](255) NULL,
	[bag_weight] [nvarchar](255) NULL,
	[country_partner] [nvarchar](255) NULL,
	[harvest_year] [nvarchar](255) NULL,
	[grading_date] [nvarchar](255) NULL,
	[variety] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[processing_method] [nvarchar](255) NULL,
)
GO

CREATE TABLE [stg_d_owner] (
  [owner_id] int PRIMARY KEY IDENTITY(1, 1),
  [owner_name] nvarchar(255)
)
GO

CREATE TABLE [stg_d_species] (
  [species_id] int PRIMARY KEY IDENTITY(1, 1),
  [species_name] nvarchar(255)
)
GO

CREATE TABLE [stg_d_countries] (
  [country_id] int PRIMARY KEY IDENTITY(1, 1),
  [country_name] nvarchar(255)
)
GO

CREATE TABLE [stg_f_scores] (
  [coffee_id] int NOT NULL,
  [fragrance_aroma] nvarchar(255),
  [flavor] nvarchar(255),
  [aftertaste] nvarchar(255),
  [salt_acid] nvarchar(255),
  [bitter_sweet] nvarchar(255),
  [mouthfeel] nvarchar(255),
  [uniform_cup] nvarchar(255),
  [clean_cup] nvarchar(255),
  [balance] nvarchar(255),
  [overall] nvarchar(255),
  [total_cup_points] nvarchar(255)
)
GO

CREATE TABLE [stg_f_analysis] (
  [coffee_id] int NOT NULL,
  [moisture] nvarchar(255),
  [category_one_defects] nvarchar(255),
  [quakers] nvarchar(255),
  [color] nvarchar(255),
  [category_two_defects] nvarchar(255)
)
GO

CREATE TABLE [stg_f_certification] (
  [coffee_id] int NOT NULL,
  [expiration] nvarchar(255),
  [certification_body] nvarchar(255),
  [certification_address] nvarchar(255),
  [certification_contact] nvarchar(255)
)
GO

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
	[Altitude_Min] [nvarchar](255) NULL,
	[Altitude_Max] [nvarchar](255) NULL,
	[Altitude_Unit] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[coffee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO