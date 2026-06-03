-- Qual produto melhora mais o glow?
SELECT product, AVG(glow) AS avg_glow
FROM skincare_log
GROUP BY product
ORDER BY avg_glow DESC;

-- Qual produto causa mais irritação?
SELECT product, AVG(irritation) AS avg_irritation
FROM skincare_log
GROUP BY product
ORDER BY avg_irritation DESC;
