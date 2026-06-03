SELECT date, AVG(glow) AS glow, AVG(hydration) AS hydration
FROM skincare_log
GROUP BY date
ORDER BY date;
