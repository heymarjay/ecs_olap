-- VIEW FOR ALL ROBUSTA SCORES

USE ECS
GO

CREATE VIEW v_robusta_scores AS

SELECT c.coffee_id
	  ,s.[species_name] AS 'Species'
	  ,co.[country_name] AS 'Country of Origin'
	  ,o.[owner_name] AS 'Owner'
	  ,c.[farm] AS 'Farm Name'
      ,c.[mill] AS 'Mill'
      ,c.[company] AS 'Company'
      ,c.[altitude_min] AS 'Minimum Altitude'
      ,c.[altitude_max] AS 'Maximum Altitude'
      ,c.[region] AS 'Region'
      ,c.[producer] AS 'Producer'
      ,c.[harvest_year] AS 'Harvest Year'
      ,c.[processing_method] AS 'Processing Method'
	  ,sc.[fragrance_aroma] AS 'Aroma'
      ,sc.[flavor] AS 'Flavor'
      ,sc.[aftertaste] AS 'Aftertaste'
      ,sc.[salt_acid] AS 'Acidity'
      ,sc.[bitter_sweet] AS 'Sweetness'
      ,sc.[mouthfeel] AS 'Body'
      ,sc.[uniform_cup] AS 'Uniformity'
      ,sc.[clean_cup] AS 'Clean Cup'
      ,sc.[balance] AS 'Balance'
      ,sc.[overall] AS 'Overall'
      ,sc.[total_cup_points] AS 'Total Cup Points'
	  ,a.[moisture] AS 'Moisture'
      ,a.[category_one_defects] AS 'Category One Defects'
      ,a.[quakers] AS 'Quakers'
      ,a.[color] AS 'Color'
      ,a.[category_two_defects] AS 'Category Two Defects'
FROM d_coffee AS c JOIN d_countries AS co ON c.country_id=co.country_id
JOIN d_owner AS o ON c.owner_id=o.owner_id
JOIN d_species AS s ON c.species_id=s.species_id
JOIN f_analysis AS a ON c.coffee_id=a.coffee_id
JOIN f_scores AS sc ON c.coffee_id=sc.coffee_id
WHERE s.species_id=2