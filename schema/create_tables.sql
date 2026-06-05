-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

-- Create Accounts Table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    credit_limit DECIMAL(10,2),
    account_open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Merchants Table
CREATE TABLE merchants (
    merchant_id INT PRIMARY KEY,
    merchant_name VARCHAR(100),
    category VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Create Transactions Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    merchant_id INT,
    transaction_date TIMESTAMP,
    amount DECIMAL(10,2),
    transaction_status VARCHAR(20),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
);

-- Create Fraud Flags Table
CREATE TABLE fraud_flags (
    flag_id INT PRIMARY KEY,
    transaction_id INT,
    fraud_reason VARCHAR(255),
    flagged_date DATE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);
