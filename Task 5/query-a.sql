USE pollution;
SELECT r.Date_Time, s.station_name, r.NOx
FROM pollution.Reading r
JOIN pollution.Station s ON r.Site_id = s.site_id
WHERE r.NOx = (
  SELECT MAX(NOx)
  FROM Reading
  WHERE Date_Time BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
    AND NOx IS NOT NULL
    AND NOx != 0
)
AND r.Date_Time BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59';
