USE ECS
GO

--CREATE TABLES

CREATE TABLE [d_coffee] (
  [coffee_id] int PRIMARY KEY,
  [species_id] int NOT NULL,
  [country_id] int NOT NULL,
  [owner_id] int NOT NULL,
  [farm] nvarchar(255),
  [lot_number] nvarchar(255),
  [mill] nvarchar(255),
  [ico_number] nvarchar(255),
  [company] nvarchar(255),
  [altitude_min] nvarchar(255),
  [altitude_max] nvarchar(255),
  [altitude_unit] nvarchar(255),
  [region] nvarchar(255),
  [producer] nvarchar(255),
  [bag_number] nvarchar(255),
  [bag_weight] nvarchar(255),
  [country_partner] nvarchar(255),
  [harvest_year] nvarchar(255),
  [grading_date] nvarchar(255),
  [variety] nvarchar(255),
  [status] nvarchar(255),
  [processing_method] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

CREATE TABLE [d_owner] (
  [owner_id] int PRIMARY KEY,
  [owner_name] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

CREATE TABLE [d_species] (
  [species_id] int PRIMARY KEY,
  [species_name] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

CREATE TABLE [d_countries] (
  [country_id] int PRIMARY KEY,
  [country_name] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

CREATE TABLE [f_scores] (
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
  [total_cup_points] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

CREATE TABLE [f_analysis] (
  [coffee_id] int NOT NULL,
  [moisture] nvarchar(255),
  [category_one_defects] nvarchar(255),
  [quakers] nvarchar(255),
  [color] nvarchar(255),
  [category_two_defects] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

CREATE TABLE [f_certification] (
  [coffee_id] int NOT NULL,
  [expiration] nvarchar(255),
  [certification_body] nvarchar(255),
  [certification_address] nvarchar(255),
  [certification_contact] nvarchar(255),
  [record_updated] [datetime] NULL
)
GO

ALTER TABLE [d_coffee] ADD FOREIGN KEY ([owner_id]) REFERENCES [d_owner] ([owner_id])
GO

ALTER TABLE [d_coffee] ADD FOREIGN KEY ([species_id]) REFERENCES [d_species] ([species_id])
GO

ALTER TABLE [d_coffee] ADD FOREIGN KEY ([country_id]) REFERENCES [d_countries] ([country_id])
GO

ALTER TABLE [f_scores] ADD FOREIGN KEY ([coffee_id]) REFERENCES [d_coffee] ([coffee_id])
GO

ALTER TABLE [f_analysis] ADD FOREIGN KEY ([coffee_id]) REFERENCES [d_coffee] ([coffee_id])
GO

ALTER TABLE [f_certification] ADD FOREIGN KEY ([coffee_id]) REFERENCES [d_coffee] ([coffee_id])
GO

CREATE INDEX [d_coffee_index_0] ON [d_coffee] ("species_id")
GO

CREATE INDEX [d_coffee_index_1] ON [d_coffee] ("country_id")
GO

CREATE INDEX [d_coffee_index_2] ON [d_coffee] ("owner_id")
GO

CREATE INDEX [d_coffee_index_3] ON [d_coffee] ("species_id", "country_id")
GO

CREATE INDEX [d_coffee_index_4] ON [d_coffee] ("species_id", "owner_id")
GO

CREATE INDEX [f_scores_index_5] ON [f_scores] ("coffee_id")
GO

CREATE INDEX [f_analysis_index_6] ON [f_analysis] ("coffee_id")
GO

CREATE INDEX [f_certification_index_7] ON [f_certification] ("coffee_id")
GO
