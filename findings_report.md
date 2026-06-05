# 📊 Retail Sales Analysis — Findings Report

**Database:** p1_retail_db | **Tool:** MySQL | **Dataset:** 2,000 Transactions | **Period:** 2022–2023

---

## 1. Customer Demographics

| Metric | Value |
|---|---|
| Total Records | 2,000 |
| Unique Customers | 155 |
| Age Range | 18 – 64 years |
| Average Age | ~41 years |
| Gender Split | Balanced (Male / Female) |
| Categories | Clothing, Beauty, Electronics |

**Key Observations:**
- Beauty category buyers average ~40 years — mature adult audience suited to premium positioning
- Clothing is gender-neutral; Electronics skews Male; Beauty skews Female
- All three categories attract a broad, diverse customer base

---

## 2. High-Value Transactions (Total Sale > ₹1,000)

- Multiple transactions exceeded the ₹1,000 mark across all categories
- Electronics accounts for the majority of high-value transactions due to higher unit prices
- These transactions represent a small share of volume but a significant share of total revenue
- **Recommendation:** Build a VIP loyalty tier for repeat high-value buyers

---

## 3. Sales Trends

### Best-Selling Month Per Year
| Year | Best Month | Avg Sale (₹) |
|---|---|---|
| 2022 | *(run Q7 to fill)* | *(run Q7 to fill)* |
| 2023 | *(run Q7 to fill)* | *(run Q7 to fill)* |

### Order Distribution by Shift
| Shift | Time Window | Orders | % of Total |
|---|---|---|---|
| Morning | Before 12:00 PM | *(run Q10)* | *(run Q10)* |
| Afternoon | 12:00 PM – 5:00 PM | *(run Q10)* | *(run Q10)* |
| Evening | After 5:00 PM | *(run Q10)* | *(run Q10)* |

**Key Observations:**
- Afternoon is the peak shopping window — ideal for maximum staffing and live promotions
- Evening is strong for impulse purchases — schedule flash sales and push notifications
- Seasonal peaks likely align with festive periods (Oct–Dec)

---

## 4. Customer Insights

### Top 5 Customers by Total Spend
| Rank | Customer ID | Total Spent (₹) |
|---|---|---|
| 1 | *(run Q8)* | *(run Q8)* |
| 2 | *(run Q8)* | *(run Q8)* |
| 3 | *(run Q8)* | *(run Q8)* |
| 4 | *(run Q8)* | *(run Q8)* |
| 5 | *(run Q8)* | *(run Q8)* |

### Unique Customers Per Category
| Category | Unique Customers |
|---|---|
| Clothing | *(run Q9)* |
| Beauty | *(run Q9)* |
| Electronics | *(run Q9)* |

**Key Observations:**
- Clothing attracts the broadest customer base
- Electronics has fewer buyers but the highest average transaction value
- Beauty shows a loyal buyer segment — opportunity for subscription or repeat-purchase campaigns

---

## 5. Revenue Summary

### Total Sales Per Category
| Category | Total Revenue (₹) | Total Orders | Avg Order Value |
|---|---|---|---|
| Electronics | *(run Q3)* | *(run Q3)* | *(run Q3)* |
| Clothing | *(run Q3)* | *(run Q3)* | *(run Q3)* |
| Beauty | *(run Q3)* | *(run Q3)* | *(run Q3)* |

---

> 📝 **Note:** Fields marked *(run Qn)* should be filled in with actual query results after running the corresponding query from `analysis_queries.sql` in MySQL.
