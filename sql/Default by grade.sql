SELECT
    loan_grade,
    COUNT(*)                                              AS total_loans,
    SUM(loan_status)                                      AS defaults,
    ROUND(SUM(loan_status)*100.0/COUNT(*), 1)             AS default_rate_pct,
    ROUND(AVG(loan_int_rate), 2)                          AS avg_int_rate,
    ROUND(AVG(loan_amnt), 0)                              AS avg_loan_amnt,
    RANK() OVER (ORDER BY SUM(loan_status)*1.0/COUNT(*) DESC) AS risk_rank
FROM loans
GROUP BY loan_grade
ORDER BY risk_rank;
