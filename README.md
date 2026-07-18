# Skin Care Data Lab

This project analyzes a personal skincare routine using SQL and Python data analysis. It explores product performance, irritation patterns, and skin outcomes for melanin-rich skin through exploratory data analysis.

## What's included now
- **notebooks/analysis.ipynb** — Jupyter notebook with pandas + DuckDB examples and visualizations
- **sql/queries.sql** — Example SQL queries to answer key questions (product hydration, irritation rates, routine timing)
- **scripts/import_to_duckdb.sh** — Script to create a DuckDB file from data/skincare_log.csv
- **scripts/requirements.txt** — Python dependencies for running the notebook
- **data/skincare_log.csv** — 25 rows of skincare observations (products, dates, hydration, texture, irritation metrics)

## Dataset

The dataset tracks:
- **Product** — name of skincare product tested
- **Date** — when the product was used
- **Routine time** — morning or night application
- **Skin feel** — subjective outcome (dry, calm, glowy, tight, oily)
- **Hydration** — 0–10 scale (higher = more moisturized)
- **Texture** — 0–10 scale (higher = smoother)
- **Irritation** — 0–10 scale (higher = more irritated)
- **Notes** — freeform observations

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
duckdb -c "SELECT product, AVG(hydration) FROM read_csv_auto('data/skincare_log.csv') GROUP BY product ORDER BY avg_hydration DESC;"
```

## Key insights to explore

- **Which products deliver the best hydration?** — Group by product and compare average hydration scores.
- **Irritation patterns** — Which products cause irritation (irritation >= 3)? Does irritation correlate with routine time?
- **Morning vs. night performance** — Do morning or night routines yield better skin outcomes?
- **Texture + hydration correlation** — Do hydrating products also improve skin texture?

## Notes and next steps
- Expand dataset: add more historical rows across seasons for robust trend detection.
- Add delayed irritation tracking: include a `next_day_irritation` column to catch reactions that emerge 24 hours later (often critical for sensitive skin).
- Visualizations: saved plots in `images/` directory for quick reference.
- Automation: consider adding a GitHub Action to run notebook checks on push or generate fresh reports on schedule.

## Technologies
- **Pandas** — data manipulation and exploration
- **DuckDB** — SQL queries on in-memory or file-based data
- **Matplotlib & Seaborn** — statistical visualizations
- **JupyterLab** — interactive analysis environment
