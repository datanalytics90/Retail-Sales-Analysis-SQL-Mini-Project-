-- ============================================================
-- FILE: analysis_queries.sql
-- PROJECT: Retail Sales Analysis
-- PURPOSE: 10 Business Questions — SQL Answers
-- ============================================================

USE p1_retail_db;

-- ============================================================
-- Q1: Retrieve all sales made on '2022-11-05'
-- Business Use: Daily sales reconciliation and audit
-- ============================================================
SELECT
    transactions_id,
    sale_date,
    sale_time,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs,
    total_sale
FROM retail_sales
WHERE sale_date = '2022-11-05'
ORDER BY sale_time;

-- ============================================================
-- Q2: Clothing transactions with quantity >= 4 in Nov 2022
-- Business Use: Identify bulk buyers and wholesale trends
-- ============================================================
SELECT
    transactions_id,
    sale_date,
    customer_id,
    category,
    quantity,
    price_per_unit,
    total_sale
FROM retail_sales
WHERE
    category  = 'Clothing'
    AND sale_date >= '2022-11-01'
    AND sale_date  < '2022-12-01'
    AND quantity  >= 4
ORDER BY sale_date;

-- ============================================================
-- Q3: Total sales (revenue) for each category
-- Business Use: Revenue contribution by product line
-- ============================================================
SELECT
    category,
    SUM(total_sale)  AS total_revenue,
    COUNT(*)         AS total_orders,
    ROUND(AVG(total_sale), 2) AS avg_order_value
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- ============================================================
-- Q4: Average age of customers in the 'Beauty' category
-- Business Use: Demographic targeting for Beauty marketing
-- ============================================================
SELECT
    ROUND(AVG(age), 2) AS avg_customer_age
FROM retail_sales
WHERE category = 'Beauty';

-- ============================================================
-- Q5: All transactions where total_sale > 1000
-- Business Use: Identify premium purchases and VIP buyers
-- ============================================================
SELECT
    transactions_id,
    customer_id,
    category,
    total_sale,
    sale_date
FROM retail_sales
WHERE total_sale > 1000
ORDER BY total_sale DESC;

-- ============================================================
-- Q6: Transaction count by gender per category
-- Business Use: Gender-based buying patterns for ad targeting
-- ============================================================
SELECT
    category,
    gender,
    COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category, gender;

-- ============================================================
-- Q7: Best-selling month per year (by average sale amount)
-- Business Use: Seasonal trend analysis and inventory planning
-- ============================================================
SELECT year, month, avg_sale
FROM (
    SELECT
        YEAR(sale_date)              AS year,
        MONTH(sale_date)             AS month,
        ROUND(AVG(total_sale), 2)    AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        )                            AS sale_rank
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS ranked_sales
WHERE sale_rank = 1
ORDER BY year;

-- ============================================================
-- Q8: Top 5 customers by total spend
-- Business Use: VIP identification for loyalty programmes
-- ============================================================
SELECT
    customer_id,
    SUM(total_sale)  AS total_spent,
    COUNT(*)         AS total_orders,
    ROUND(AVG(total_sale), 2) AS avg_order_value
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- ============================================================
-- Q9: Unique customer count per category
-- Business Use: Measure category reach across the customer base
-- ============================================================
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category
ORDER BY unique_customers DESC;

-- ============================================================
-- Q10: Order count by time shift (Morning / Afternoon / Evening)
-- Business Use: Optimise staffing, promotions, push notifications
-- ============================================================
WITH shift_classified AS (
    SELECT
        transactions_id,
        sale_time,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12  THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) <= 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT
    shift,
    COUNT(transactions_id)                                    AS total_orders,
    ROUND(
        COUNT(transactions_id) * 100.0
        / SUM(COUNT(transactions_id)) OVER (), 2
    )                                                         AS order_percentage
FROM shift_classified
GROUP BY shift
ORDER BY
    CASE shift
        WHEN 'Morning'   THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening'   THEN 3
    END;
