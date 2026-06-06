-- Rolling transaction analysis using window functions

WITH suspicious_activity AS (
    SELECT
        t.transaction_id,
        t.account_id,
        t.transaction_date,
        t.amount,
        t.transaction_status,

        COUNT(*) OVER (
            PARTITION BY t.account_id
            ORDER BY t.transaction_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS rolling_transaction_count,

        AVG(t.amount) OVER (
            PARTITION BY t.account_id
        ) AS average_account_spend

    FROM transactions t
)

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    rolling_transaction_count,
    average_account_spend

FROM suspicious_activity

WHERE amount > 1000
OR rolling_transaction_count >= 3

ORDER BY amount DESC;
