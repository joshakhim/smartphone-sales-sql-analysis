# 📱 Smartphone Sales SQL Analysis Project

## 📌 Project Overview

This project explores smartphone pricing and performance data using SQL to identify market trends, flagship devices, and high-value smartphones.

The analysis focuses on understanding:
- Brand pricing strategies
- Revenue performance
- Premium smartphone trends
- Value-for-money devices
- Revenue contribution across products

The project was designed to strengthen real-world SQL analysis skills using aggregations, filtering, CTEs, and window functions.

---

# 🛠 Tools Used

- MySQL
- SQL
- GitHub

---

# 📂 Project Structure

```text
smartphone-sql-analysis/
│
├── data/
│   └── smartphone_dataset.csv
│
├── sql/
│   └── smartphone_analysis.sql
│
├── images/
│   └── query-results.png
│
└── README.md
```

---

# 📊 SQL Concepts Used

- SELECT Statements
- Filtering with WHERE
- Aggregate Functions
- GROUP BY
- ORDER BY
- Window Functions
- Revenue Analysis
- Ranking Functions
- Common Table Expressions (CTEs)

---

# 🔥 Business Questions Answered

- Which smartphone brands have the highest average prices?
- Which phones offer flagship-level specifications?
- Which smartphones provide strong value for their price?
- Which brands dominate the premium market?
- How does revenue accumulate across products and brands?

---

# 📈 Example SQL Query

```sql
SELECT 
    brand,
    AVG(price) AS avg_price
FROM smartphones
GROUP BY brand
ORDER BY avg_price DESC;
```

---

# 📊 Key Insights

- Apple devices had the highest average pricing across the dataset.
- Vivo smartphones delivered strong specifications at lower prices, making them competitive value options.
- Samsung maintained balanced performance across mid-range and premium devices.
- Premium smartphones significantly increased the overall market average price.

---

# 🧠 What I Learned

This project helped me improve my understanding of:
- SQL query structuring
- Aggregations and grouping
- Window functions
- Real-world analytical thinking
- Organizing SQL projects professionally on GitHub

---

# 🚀 Future Improvements

- Expand the dataset with more smartphone brands
- Add sales and customer review analysis
- Create a Tableau or Power BI dashboard
- Perform advanced pricing trend analysis

---

# 👤 Author

Joshua Akhim

# Smartphone Sales SQL Analysis

This project analyzes smartphone sales performance using SQL by combining product and sales transaction data.

The analysis focuses on:

* revenue generation,
* sales volume,
* pricing strategy,
* brand performance,
* and revenue contribution analysis.

Using JOINs, CTEs, aggregations, CASE WHEN statements, and window functions, the project explores how different smartphone brands perform based on quantity sold, premium pricing, and overall revenue contribution.

Key business questions answered include:

* Which smartphone generated the highest revenue?
* Which brands rely more on premium pricing or sales volume?
* Which products contribute most to total company revenue?
* How is revenue distributed across the product portfolio?
* What products underperform despite premium pricing?

This project was created as part of my journey learning SQL and business analytics through hands-on practice and real-world analytical thinking.

