USE pollution;
SELECT s.station_name, AVG(r.CO) AS '**CO Mean**', AVG(r.NO) AS '**NO Mean**', AVG(r.NO2) AS '**NO2 Mean**',AVG(r.NOx) AS '**NOx Mean**',
AVG(r.NVPM2_5) AS '**NVPM2_5 Mean**',AVG(r.NVPM10) AS '**NVPM10 Mean**',AVG(r.O3) AS '**O3 Mean**',
AVG(r.PM2_5) AS '**PM2.5 Mean**', AVG(r.PM10) AS '**PM10 Mean**', AVG(r.Pressure) AS '**Pressure Mean**',
AVG(r.RH) AS '**RH Mean**',AVG(r.SO2) AS '**SO2 Mean**', AVG(r.Temperature) AS '**Temperature Mean**',
AVG(r.VPM2_5) AS '**VPM2.5 Mean**',AVG(r.VPM10) AS '**VPM1.0 Mean**'
FROM pollution.Reading r
JOIN pollution.Station s ON r.Site_id = s.site_id
WHERE STR_TO_DATE(r.Date_Time, '%Y-%m-%d %H:%i:%s') BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
AND HOUR(STR_TO_DATE(r.Date_Time, '%Y-%m-%d %H:%i:%s')) BETWEEN 7 AND 9
AND r.CO IS NOT NULL
AND r.NO IS NOT NULL
AND r.NO2 IS NOT NULL
AND r.NOx IS NOT NULL
AND r.NVPM2_5 IS NOT NULL
AND r.NVPM10 IS NOT NULL
AND r.O3 IS NOT NULL
AND r.PM2_5 IS NOT NULL
AND r.PM10 IS NOT NULL
AND r.Pressure IS NOT NULL
AND r.RH IS NOT NULL
AND r.SO2 IS NOT NULL
AND r.Temperature IS NOT NULL
AND r.VPM2_5 IS NOT NULL
AND r.VPM10 IS NOT NULL

GROUP BY s.station_name;