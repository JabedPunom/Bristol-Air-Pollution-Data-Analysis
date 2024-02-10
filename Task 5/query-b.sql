USE pollution;
SELECT s.station_name, AVG(r.PM2_5) AS '**PM2.5 Mean**', AVG(r.VPM2_5) AS '**VPM2.5 Mean**'
FROM pollution.Reading r
JOIN pollution.Station s ON r.Site_id = s.site_id
WHERE STR_TO_DATE(r.Date_Time, '%Y-%m-%d %H:%i:%s') BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
AND HOUR(STR_TO_DATE(r.Date_Time, '%Y-%m-%d %H:%i:%s')) BETWEEN 7 AND 9
GROUP BY s.station_name;