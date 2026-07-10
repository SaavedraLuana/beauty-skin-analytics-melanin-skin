#!/usr/bin/env bash
# scripts/import_to_duckdb.sh
# Create a DuckDB file 'data/skincare.duckdb' and import the CSV into a table `skincare`.
# Requires: duckdb CLI (https://duckdb.org)

set -euo pipefail

DB_FILE=data/skincare.duckdb
CSV_FILE=data/skincare_log.csv

if [ ! -f "$CSV_FILE" ]; then
  echo "CSV file not found: $CSV_FILE"
  exit 1
fi

# Remove existing DB to start fresh
rm -f "$DB_FILE"

duckdb "$DB_FILE" <<SQL
-- read_csv_auto will infer types; it works well for small personal CSVs
CREATE TABLE skincare AS SELECT * FROM read_csv_auto('$CSV_FILE');
-- Create helpful indexes (DuckDB uses automatic optimization; these are optional)
CREATE VIEW product_stats AS SELECT product, AVG(hydration) AS avg_hydration, AVG(texture) AS avg_texture, COUNT(*) AS n FROM skincare GROUP BY product;
SQL

echo "Created $DB_FILE with table 'skincare'. Use: duckdb $DB_FILE" 
