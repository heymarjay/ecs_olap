-- POPULATE COFFEE TABLE

USE [ECS_Transform]
GO

TRUNCATE TABLE stg_d_coffee

INSERT INTO [stg_d_coffee](
[coffee_id],
[species_id],
[country_id],
[owner_id],
[farm],
[lot_number],
[mill],
[ico_number],
[company],
[altitude_min],
[altitude_max],
[altitude_unit],
[region],
[producer],
[bag_number],
[bag_weight],
[country_partner],
[harvest_year],
[grading_date],
[variety],
[status],
[processing_method]
)
select 
r.[coffee_id],
s.[species_id],
c.[country_id],
o.[owner_id],
r.[Farm Name],
r.[Lot Number],
r.Mill,
r.[ICO Number],
r.Company,
r.Altitude_Min,
r.Altitude_Max,
r.Altitude_Unit,
r.Region,
r.Producer,
r.[Number of Bags],
r.[Bag Weight],
r.[In-Country Partner],
r.[Harvest Year],
r.[Grading Date],
r.Variety,
r.Status,
r.[Processing Method]
FROM  [stg_d_coffee] AS prd RIGHT JOIN stg_raw AS r ON (prd.coffee_id=r.coffee_id)
JOIN stg_d_countries AS c ON r.[Country of Origin]=c.country_name
JOIN stg_d_owner AS o ON r.[Owner]=o.owner_name
JOIN stg_d_species AS s ON r.Species=s.[species_name]
WHERE
prd.coffee_id IS NULL