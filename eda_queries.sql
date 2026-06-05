-- ============================================================
-- FILE: eda_queries.sql
-- PROJECT: Retail Sales Analysis
-- PURPOSE: Exploratory Data Analysis — Tier 1 & Tier 2
-- ============================================================

USE p1_retail_db;

-- ============================================================
-- TIER 1 — Basic Profiling
-- ============================================================

-- Total number of rows in the dataset
SELECT COUNT(*) AS total_records
FROM retail_sales;

-- How many unique customers made purchases?
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

-- What product categories exist?
SELECT DISTINCT category
FROM retail_sales;

-- How many transactions per category?
SELECT
    category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category
ORDER BY total_transactions DESC;

-- Gender split across the dataset
SELECT
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY gender
ORDER BY total_transactions DESC;

-- Age range of customers
SELECT
    MIN(age) AS youngest_customer,
    MAX(age) AS oldest_customer,
    ROUND(AVG(age), 1) AS average_age
FROM retail_sales;

-- ============================================================
-- TIER 2 — Numeric Summary & Validation (Stronger Project)
-- ============================================================

-- Full numeric summary — age and sale amount
SELECT
    MIN(age)          AS min_age,
    MAX(age)          AS max_age,
    ROUND(AVG(age), 1)        AS avg_age,
    MIN(total_sale)   AS min_sale,
    MAX(total_sale)   AS max_sale,
    ROUND(AVG(total_sale), 2) AS avg_sale
FROM retail_sales;

-- Are there logically broken rows? (quantity × price ≠ total_sale)
SELECT *
FROM retail_sales
WHERE total_sale <> quantity * price_per_unit
LIMIT 20;

-- Any zero or negative values that should not exist?
SELECT *
FROM retail_sales
WHERE quantity <= 0 OR price_per_unit <= 0 OR total_sale <= 0;

-- What time period does the data cover?
SELECT
    MIN(sale_date) AS first_day,
    MAX(sale_date) AS last_day
FROM retail_sales;
