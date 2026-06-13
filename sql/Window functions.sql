-- Window functions
SELECT
    id,
    loan_grade,
    loan_amnt,
    loan_int_rate,
    ROUND(AVG(loan_amnt)    OVER (PARTITION BY loan_grade), 0) AS grade_avg_amnt,
    ROUND(AVG(loan_int_rate) OVER (PARTITION BY loan_grade), 2) AS grade_avg_rate,
    loan_amnt - ROUND(AVG(loan_amnt) OVER (PARTITION BY loan_grade), 0) AS amnt_vs_grade_avg,
    RANK() OVER (PARTITION BY loan_grade ORDER BY loan_amnt DESC) AS rank_in_grade
FROM loans
ORDER BY loan_grade, rank_in_grade
LIMIT 50;   -- preview first 50 rows
