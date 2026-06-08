SELECT
    product,
    irritation,
    CASE
        WHEN irritation > 3 THEN 'high risk'
        ELSE 'safe'
    END AS irritation_risk
FROM skincare_log;
