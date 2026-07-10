# Skin Care Data Lab

This project analyzes a personal skincare routine using SQL and small ad-hoc analysis scripts.

## What's included now
- notebooks/analysis.ipynb        - Jupyter notebook with pandas + DuckDB examples and simple plots
- sql/queries.sql                - Example SQL queries to answer README questions
- scripts/import_to_duckdb.sh    - Script to create a DuckDB file from data/skincare_log.csv
- scripts/requirements.txt       - Python dependencies for running the notebook
- data/skincare_log.csv          - Original CSV (unchanged)

## How to run the analysis (quick)

1) Install dependencies (recommended in virtualenv)

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r scripts/requirements.txt
```

2) Run the import script to create a DuckDB file (optional)

```bash
bash scripts/import_to_duckdb.sh
# opens data/skincare.duckdb with table `skincare`
```

3) Open and run the notebook

```bash
jupyter lab notebooks/analysis.ipynb
```

4) Or run example SQL queries directly with DuckDB

```bash
# one-liner example
duckdb -c "SELECT product, AVG(hydration) FROM read_csv_auto('data/skincare_log.csv') GROUP BY product;"
```

## Notes and next steps
- The dataset is small; add more historical rows for robust trends.
- Consider adding a column for `next_day_irritation` or standardizing `skin_feel` text (e.g., 'glowy').
- I can add automated tests, visualizations saved to `reports/`, or a GitHub Action to run notebook checks on push — tell me which.
