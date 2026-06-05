-- Transactions over $1,000
SELECT
    transaction_id,
    account_id,
    merchant_id,
    transaction_date,
    amount,
    transaction_status
FROM transactions
WHERE amount > 1000
ORDER BY amount DESC;

-- Declined transactions by account
SELECT
    account_id,
    COUNT(*) AS declined_transactions
FROM transactions
WHERE transaction_status = 'Declined'
GROUP BY account_id
ORDER BY declined_transactions DESC;

-- High-risk merchants based on fraud flags
SELECT
    m.merchant_name,
    COUNT(f.flag_id) AS fraud_flag_count
FROM fraud_flags f
JOIN transactions t
ON f.transaction_id = t.transaction_id
JOIN merchants m
ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_name
ORDER BY fraud_flag_count DESC;

-- Customers with multiple declined transactions
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(t.transaction_id) AS declined_count
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
WHERE t.transaction_status = 'Declined'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(t.transaction_id) >= 2
ORDER BY declined_count DESC;
