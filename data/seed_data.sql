-- Insert Customers
INSERT INTO customers VALUES
(1, 'John', 'Smith', 34, 'Atlanta', 'GA', '2022-01-15'),
(2, 'Sarah', 'Johnson', 28, 'Charlotte', 'NC', '2021-09-10'),
(3, 'Michael', 'Brown', 45, 'Dallas', 'TX', '2020-03-22');

-- Insert Accounts
INSERT INTO accounts VALUES
(101, 1, 'Credit Card', 5000.00, '2022-01-15'),
(102, 2, 'Credit Card', 7500.00, '2021-09-10'),
(103, 3, 'Credit Card', 10000.00, '2020-03-22');

-- Insert Merchants
INSERT INTO merchants VALUES
(201, 'Amazon', 'Retail', 'Seattle', 'WA'),
(202, 'Walmart', 'Retail', 'Bentonville', 'AR'),
(203, 'Best Buy', 'Electronics', 'Richfield', 'MN');

-- Insert Transactions
INSERT INTO transactions VALUES
(1001, 101, 201, '2026-06-01 10:15:00', 120.50, 'Approved'),
(1002, 101, 202, '2026-06-02 12:30:00', 2500.00, 'Declined'),
(1003, 102, 203, '2026-06-03 09:45:00', 89.99, 'Approved'),
(1004, 103, 201, '2026-06-04 18:10:00', 3200.00, 'Declined');

-- Insert Fraud Flags
INSERT INTO fraud_flags VALUES
(1, 1002, 'Large declined transaction', '2026-06-02'),
(2, 1004, 'Suspicious high-dollar transaction', '2026-06-04');
