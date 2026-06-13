SELECT
    loan_intent,
    COUNT(*)                                          AS total_loans,
    SUM(loan_status)                                  AS defaults,
    ROUND(SUM(loan_status)*100.0/COUNT(*), 1)         AS default_rate_pct,
    ROUND(AVG(loan_amnt), 0)                          AS avg_loan_amnt
FROM loans
GROUP BY loan_intent
ORDER BY default_rate_pct DESC;
