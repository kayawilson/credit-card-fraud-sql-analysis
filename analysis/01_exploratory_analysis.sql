-- Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- Total transaction amount
SELECT SUM(amount) AS total_spend
FROM transactions;

-- Average transaction amount
SELECT AVG(amount) AS average_transaction
FROM transactions;

-- Top 5 merchants by transaction volume
SELECT 
    m.merchant_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_sales
FROM transactions t
JOIN merchants m
ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_name
ORDER BY total_sales DESC
LIMIT 5;

-- Transaction count by status
SELECT 
    transaction_status,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_status;

-- Average spend by account type
SELECT
    a.account_type,
    AVG(t.amount) AS average_spend
FROM transactions t
JOIN accounts a
ON t.account_id = a.account_id
GROUP BY a.account_type;
