-- Default by ownership
SELECT
    person_home_ownership,
    COUNT(*)                                          AS total_borrowers,
    SUM(loan_status)                                  AS defaults,
    ROUND(SUM(loan_status)*100.0/COUNT(*), 1)         AS default_rate_pct,
    ROUND(AVG(person_income), 0)                      AS avg_income,
    ROUND(AVG(loan_amnt), 0)                          AS avg_loan_amnt
FROM loans
GROUP BY person_home_ownership
ORDER BY default_rate_pct DESC;
