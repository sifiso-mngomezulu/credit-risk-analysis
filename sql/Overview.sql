SELECT
    COUNT(*)                                          AS total_records,
    SUM(loan_status)                                  AS total_defaults,
    ROUND(SUM(loan_status)*100.0/COUNT(*), 2)         AS overall_default_rate_pct,
    ROUND(AVG(person_age), 1)                         AS avg_age,
    ROUND(AVG(person_income), 0)                      AS avg_income,
    ROUND(AVG(loan_amnt), 0)                          AS avg_loan_amnt,
    ROUND(AVG(loan_int_rate), 2)                      AS avg_int_rate,
    SUM(CASE WHEN loan_int_rate IS NULL THEN 1 ELSE 0 END) AS nulls_int_rate,
    SUM(CASE WHEN person_emp_length IS NULL THEN 1 ELSE 0 END) AS nulls_emp_length
FROM loans;
