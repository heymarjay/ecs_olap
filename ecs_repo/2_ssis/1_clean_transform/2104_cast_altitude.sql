-- POPULATE MIN AND MAX ALTITUDE

USE [ECS_Transform]
GO


UPDATE stg_raw SET altitude = REPLACE(altitude, ',', '');

UPDATE stg_raw
SET Altitude_Min=SUBSTRING(Altitude, 1, CHARINDEX('-', Altitude)-1),
	Altitude_Max=SUBSTRING(Altitude, CHARINDEX('-', Altitude) + 1, 1000)
WHERE CHARINDEX('-', Altitude) > 0;

UPDATE stg_raw
SET Altitude_Min=Altitude,
	Altitude_Max=Altitude
WHERE CHARINDEX('-', Altitude) <1;

UPDATE stg_raw
SET Altitude=LEFT(SUBSTRING(Altitude, PATINDEX('%[0-9.-]%', Altitude), 8000),PATINDEX('%[^0-9.-]%', SUBSTRING(Altitude, PATINDEX('%[0-9.-]%', Altitude), 8000) + 'X') -1),
	Altitude_Min=LEFT(SUBSTRING(Altitude_Min, PATINDEX('%[0-9.-]%', Altitude_Min), 8000),PATINDEX('%[^0-9.-]%', SUBSTRING(Altitude_Min, PATINDEX('%[0-9.-]%', Altitude_Min), 8000) + 'X') -1),
	Altitude_Max=LEFT(SUBSTRING(Altitude_Max, PATINDEX('%[0-9.-]%', Altitude_Max), 8000),PATINDEX('%[^0-9.-]%', SUBSTRING(Altitude_Max, PATINDEX('%[0-9.-]%', Altitude_Max), 8000) + 'X') -1);

UPDATE stg_raw SET Altitude=NULL WHERE Altitude='';
UPDATE stg_raw SET Altitude_Min=NULL WHERE Altitude_Min='';
UPDATE stg_raw SET Altitude_Max=NULL WHERE Altitude_Max='';

UPDATE stg_raw
SET Altitude_Unit = SUBSTRING(Altitude,PATINDEX('%[^0-9]%', Altitude),1)
WHERE PATINDEX('%[^0-9]%',Altitude) > 0;

UPDATE stg_raw
SET Altitude_Unit = 'm'
WHERE Altitude_Unit IS NULL
OR Altitude_Unit='';