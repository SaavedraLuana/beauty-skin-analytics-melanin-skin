SELECT product, AVG(irritation) AS avg_irritation
FROM skincare_log
GROUP BY product
ORDER BY avg_irritation ASC;
