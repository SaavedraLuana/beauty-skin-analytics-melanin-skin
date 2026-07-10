-- Example SQL queries for exploring data/skincare_log.csv in DuckDB/SQLite-style SQL
-- Assumes a table `skincare` created from the CSV with proper types (date parsed, numeric metrics)

-- 1) Average hydration and texture per product
SELECT product, ROUND(AVG(hydration),2) AS avg_hydration, ROUND(AVG(texture),2) AS avg_texture, COUNT(*) AS n
FROM skincare
GROUP BY product
ORDER BY avg_hydration DESC;

-- 2) Irritation summary: counts and percent with irritation >= 3
SELECT product,
       COUNT(*) AS total_records,
       SUM(CASE WHEN irritation >= 3 THEN 1 ELSE 0 END) AS irritation_count,
       ROUND(100.0 * SUM(CASE WHEN irritation >= 3 THEN 1 ELSE 0 END) / COUNT(*),2) AS irritation_pct
FROM skincare
GROUP BY product
ORDER BY irritation_pct DESC;

-- 3) Which products are associated with "glowy" skin_feel more often
SELECT product, COUNT(*) AS glowy_count,
       ROUND(100.0 * SUM(CASE WHEN lower(skin_feel) = 'glowy' THEN 1 ELSE 0 END) / COUNT(*),2) AS glowy_pct
FROM skincare
GROUP BY product
ORDER BY glowy_pct DESC;

-- 4) Morning vs night average hydration
SELECT routine_time, ROUND(AVG(hydration),2) AS avg_hydration, COUNT(*) AS n
FROM skincare
GROUP BY routine_time;

-- 5) Time series: average hydration by date (useful if you have many dates)
SELECT date, ROUND(AVG(hydration),2) AS avg_hydration
FROM skincare
GROUP BY date
ORDER BY date;

-- 6) Products that tend to cause irritation on the next day (requires richer dataset with next-day labels)
-- Placeholder: if you later add a 'next_day_irritation' column, you could run:
-- SELECT product, AVG(next_day_irritation) AS avg_next_day_irritation FROM skincare GROUP BY product ORDER BY avg_next_day_irritation DESC;

-- 7) Lightweight sanity checks
SELECT COUNT(*) AS rows, MIN(date) AS first_date, MAX(date) AS last_date FROM skincare;
