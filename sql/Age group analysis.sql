-- Age group analysis
SELECT
    CASE
        WHEN person_age < 25              THEN '20–24'
        WHEN person_age BETWEEN 25 AND 34 THEN '25–34'
        WHEN person_age BETWEEN 35 AND 44 THEN '35–44'
        WHEN person_age BETWEEN 45 AND 54 THEN '45–54'
        WHEN person_age BETWEEN 55 AND 80 THEN '55–80'
        ELSE 'Outlier (>80)'
    END                                               AS age_group,
    COUNT(*)                                          AS total,
    ROUND(AVG(loan_amnt), 0)                          AS avg_loan_amnt,
    ROUND(AVG(person_income), 0)                      AS avg_income,
    ROUND(SUM(loan_status)*100.0/COUNT(*), 1)         AS default_rate_pct
FROM loans
GROUP BY age_group
ORDER BY MIN(person_age);
