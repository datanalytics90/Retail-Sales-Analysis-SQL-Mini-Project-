-- ============================================================
-- FILE: data_cleaning.sql
-- PROJECT: Retail Sales Analysis
-- PURPOSE: Identify and remove NULL / incomplete records
-- ============================================================

USE p1_retail_db;

-- ── STEP 1: View rows with missing data ──────────────────────
-- Run this FIRST — see what will be deleted before deleting
SELECT *
FROM retail_sales
WHERE
    sale_date      IS NULL OR
    sale_time      IS NULL OR
    customer_id    IS NULL OR
    gender         IS NULL OR
    age            IS NULL OR
    category       IS NULL OR
    quantity       IS NULL OR
    price_per_unit IS NULL OR
    cogs           IS NULL OR
    total_sale     IS NULL;

-- ── STEP 2: Check specific column — total_sale only ──────────
SELECT transactions_id, total_sale
FROM retail_sales
WHERE total_sale IS NULL;

-- ── STEP 3: Delete all rows with any NULL value ───────────────
SET SQL_SAFE_UPDATES = 0;        -- Disable safe mode for DELETE

DELETE FROM retail_sales
WHERE
    sale_date      IS NULL OR
    sale_time      IS NULL OR
    customer_id    IS NULL OR
    gender         IS NULL OR
    age            IS NULL OR
    category       IS NULL OR
    quantity       IS NULL OR
    price_per_unit IS NULL OR
    cogs           IS NULL OR
    total_sale     IS NULL;

SET SQL_SAFE_UPDATES = 1;        -- Re-enable safe mode after DELETE

-- ── STEP 4: Confirm final record count ───────────────────────
SELECT COUNT(*) AS total_rows_after_cleaning FROM retail_sales;
-- Expected result: 2000

-- ── STEP 5: Logical integrity check ──────────────────────────
-- Are there rows where quantity × price_per_unit ≠ total_sale?
SELECT *
FROM retail_sales
WHERE total_sale <> quantity * price_per_unit
LIMIT 20;

-- ── STEP 6: Check for zero or negative values ─────────────────
SELECT *
FROM retail_sales
WHERE quantity <= 0 OR price_per_unit <= 0 OR total_sale <= 0;

-- ── STEP 7: Confirm date range ────────────────────────────────
SELECT
    MIN(sale_date) AS first_sale_date,
    MAX(sale_date) AS last_sale_date
FROM retail_sales;
-- Expected: 2022-01-01 to 2023-12-31
