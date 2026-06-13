-- ============================================================
DELIMITER //
CREATE PROCEDURE sp_intent_report(IN p_intent VARCHAR(30))
BEGIN
    SELECT
        loan_intent,
        COUNT(*)                                        AS total_loans,
        ROUND(AVG(loan_amnt), 0)                       AS avg_loan_amnt,
        ROUND(AVG(loan_int_rate), 2)                   AS avg_int_rate,
        SUM(loan_status)                               AS defaults,
        ROUND(SUM(loan_status)*100.0/COUNT(*), 1)      AS default_rate_pct
    FROM loans
    WHERE loan_intent = p_intent OR p_intent IS NULL
    GROUP BY loan_intent
    ORDER BY default_rate_pct DESC;
END //
DELIMITER ;

-- Test:
CALL sp_intent_report('MEDICAL');
CALL sp_intent_report(NULL);   -- all intents

