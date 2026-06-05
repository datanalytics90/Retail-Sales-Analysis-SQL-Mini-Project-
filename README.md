# 🛒 Retail Sales Analysis — SQL Project

![SQL](https://img.shields.io/badge/Tool-MySQL-blue) ![Level](https://img.shields.io/badge/Level-Beginner-green) ![Records](https://img.shields.io/badge/Dataset-2000%20Rows-orange)

A complete SQL-based retail sales analysis project covering database setup, data cleaning, exploratory data analysis (EDA), and 10 business-driven queries. Built to demonstrate core data analyst skills using MySQL.

## 📁 Reports Document:
(https://docs.google.com/document/d/1sSCHQ4VHJWjxNElRP9zoYmC1jA3otX2Y/edit?usp=sharing&ouid=108349178558494157171&rtpof=true&sd=true)

---

## 📁 Project Structure

```
retail-sales-analysis/
├── database_setup.sql      ← Create database, table, and load CSV
├── data_cleaning.sql       ← NULL checks, DELETE, integrity validation
├── eda_queries.sql         ← EDA Tier 1 (basic) + Tier 2 (numeric summary)
├── analysis_queries.sql    ← 10 business analysis queries
├── findings_report.md      ← Key findings and insights
└── README.md               ← You are here
```

---

## 🗄️ Database Schema

**Database:** `p1_retail_db` | **Table:** `retail_sales`

| Column | Type | Description |
|---|---|---|
| transactions_id | INT (PK) | Unique transaction ID |
| sale_date | DATE | Date of sale |
| sale_time | TIME | Time of sale |
| customer_id | INT | Unique customer ID |
| gender | VARCHAR(10) | Male / Female |
| age | INT | Customer age |
| category | VARCHAR(35) | Product category |
| quantity | INT | Units sold |
| price_per_unit | FLOAT | Price per unit |
| cogs | FLOAT | Cost of Goods Sold |
| total_sale | FLOAT | Total sale amount |

---

## ❓ Business Questions Answered

| # | Question |
|---|---|
| Q1 | Retrieve all sales made on a specific date |
| Q2 | Clothing transactions with quantity ≥ 4 in November 2022 |
| Q3 | Total revenue and order count per category |
| Q4 | Average age of Beauty category customers |
| Q5 | All high-value transactions (total sale > ₹1,000) |
| Q6 | Transaction count by gender per category |
| Q7 | Best-selling month per year by average sale |
| Q8 | Top 5 customers by total spend |
| Q9 | Unique customer count per category |
| Q10 | Order distribution by time shift (Morning / Afternoon / Evening) |

---

## 📊 Key Findings

- **2,000 transactions** across **155 unique customers** and **3 product categories**
- **Electronics** generates the highest revenue; **Clothing** leads in order volume
- **Afternoon shift (12–5 PM)** is the peak shopping window
- **Top 5 customers** contribute a disproportionate share of total revenue — VIP opportunity
- **Beauty buyers** average ~40 years — suited to premium product positioning
- Seasonal sales peaks identified to guide inventory and campaign planning

---

## 🚀 How to Run This Project

### Step 1 — Prerequisites
- Install [MySQL](https://dev.mysql.com/downloads/) or use MySQL Workbench
- Download the dataset CSV file

### Step 2 — Set Up the Database
```sql
-- Open MySQL Workbench, paste and run:
source database_setup.sql
```
> ⚠️ Update the CSV file path in `database_setup.sql` to match your computer

### Step 3 — Clean the Data
```sql
source data_cleaning.sql
```

### Step 4 — Run EDA
```sql
source eda_queries.sql
```

### Step 5 — Run Business Analysis
```sql
source analysis_queries.sql
```

---

## 🛠️ SQL Techniques Used

- `CREATE DATABASE` / `CREATE TABLE` / `LOAD DATA LOCAL INFILE`
- `DELETE` with multi-column NULL checks
- `GROUP BY` with `SUM`, `COUNT`, `AVG`, `ROUND`
- Window functions: `RANK() OVER (PARTITION BY ...)`
- Common Table Expressions (CTEs): `WITH ... AS (...)`
- Conditional logic: `CASE WHEN ... THEN ... END`
- Date functions: `YEAR()`, `MONTH()`, `EXTRACT(HOUR FROM ...)`
- Data validation: integrity checks and range validation

---

## 📬 Connect

Feel free to fork this project, run it on your own dataset, or reach out with questions.
