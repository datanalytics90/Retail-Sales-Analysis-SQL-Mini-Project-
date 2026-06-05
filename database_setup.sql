-- ============================================================
-- FILE: database_setup.sql
-- PROJECT: Retail Sales Analysis
-- DATABASE: p1_retail_db
-- TOOL: MySQL
-- ============================================================

-- ── STEP 1: Enable local file import ─────────────────────────
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';       -- Should show: ON

-- ── STEP 2: Create & select the database ─────────────────────
CREATE DATABASE IF NOT EXISTS p1_retail_db;
USE p1_retail_db;

-- ── STEP 3: Create the retail_sales table ────────────────────
CREATE TABLE IF NOT EXISTS retail_sales (
    transactions_id   INT           PRIMARY KEY,
    sale_date         DATE,
    sale_time         TIME,
    customer_id       INT,
    gender            VARCHAR(10),
    age               INT,
    category          VARCHAR(35),
    quantity          INT,
    price_per_unit    FLOAT,
    cogs              FLOAT,
    total_sale        FLOAT
);

-- ── STEP 4: Load CSV data into the table ─────────────────────
-- ⚠️  Update the file path below to match YOUR computer path
TRUNCATE TABLE retail_sales;              -- Clear table before loading

LOAD DATA LOCAL INFILE '/your/path/to/retail_sales_data.csv'
INTO TABLE retail_sales
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    transactions_id, sale_date, sale_time, customer_id,
    gender, @age, category, @quantity,
    @price_per_unit, @cogs, @total_sale
)
SET
    age            = NULLIF(TRIM(@age), ''),
    quantity       = NULLIF(TRIM(@quantity), ''),
    price_per_unit = NULLIF(TRIM(@price_per_unit), ''),
    cogs           = NULLIF(TRIM(@cogs), ''),
    total_sale     = NULLIF(TRIM(REPLACE(@total_sale, '\r', '')), '');

-- ── STEP 5: Verify load ───────────────────────────────────────
SELECT COUNT(*) AS total_rows FROM retail_sales;   -- Expected: 2000
SELECT * FROM retail_sales LIMIT 10;               -- Preview first 10 rows
