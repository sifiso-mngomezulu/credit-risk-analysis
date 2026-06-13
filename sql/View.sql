CREATE OR REPLACE VIEW vw_loan_grade_summary AS
SELECT
    loan_grade,
    COUNT(*)                                                      AS total_loans,
    ROUND(AVG(loan_amnt), 0)                                     AS avg_loan_amnt,
    ROUND(AVG(loan_int_rate), 2)                                 AS avg_int_rate,
    ROUND(AVG(loan_percent_income), 3)                           AS avg_pct_income,
    SUM(loan_status)                                             AS total_defaults,
    ROUND(SUM(loan_status) * 100.0 / COUNT(*), 1)               AS default_rate_pct
FROM loans
GROUP BY loan_grade
ORDER BY loan_grade;

SELECT * FROM vw_loan_grade_summary;
