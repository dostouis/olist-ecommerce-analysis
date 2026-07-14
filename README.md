# Olist E-Commerce Analysis: Revenue, Delivery Performance, and Customer Insights

## Project Overview
This project analyzes the Olist Brazilian E-Commerce dataset — a real-world dataset containing 99,441 orders from 2016-2018. The analysis covers revenue performance, delivery efficiency, customer satisfaction, and seller performance across 7 interconnected tables.

**Tool:** PostgreSQL  
**Dataset:** Olist Brazilian E-Commerce Dataset (Kaggle)  
**Source:** [kaggle.com/datasets/olistbr/brazilian-ecommerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
**Time Period:** September 2016 — August 2018  

---

## Business Problem
As an aspiring data analyst, this is my third end-to-end SQL project. I analyzed Olist's e-commerce data from the perspective of a business analyst tasked with understanding order fulfillment, revenue drivers, delivery performance, and customer satisfaction to help the company make better operational and strategic decisions.

---

## Dataset Overview
| Table | Rows | Description |
|---|---|---|
| `orders` | 99,441 | Main orders table — status, timestamps from purchase to delivery |
| `order_items` | 112,650 | Line items per order — product, seller, price, freight |
| `order_payments` | 103,886 | Payment method, installments, and payment value |
| `order_reviews` | 99,224 | Customer review scores and comments |
| `customers` | 99,441 | Customer location — city and state |
| `products` | 32,951 | Product details and category |
| `sellers` | 3,095 | Seller location — city and state |
| `category_translation` | 71 | Portuguese to English product category names |

---

## Data Cleaning
Before analysis, the following data quality issues were identified and handled:

| Issue | Count | Decision |
|---|---|---|
| NULL delivery dates | 2,965 | Non-delivered orders — excluded from delivery analysis |
| NULL approved dates | 160 | Excluded from approval time analysis |
| NULL review scores | 0 | Review data is 100% complete |
| NULL payment values | 0 | Payment data is 100% complete |
| NULL prices | 0 | Order items data is 100% complete |

**Key finding:** Data spans September 2016 to August 2018. Early months (Sep-Dec 2016) have very few orders as Olist was still growing — exclude from trend analysis to avoid misleading results.

---

## Analysis & Findings

**Q1. Order Fulfillment Rate**
- Business question: What percentage of orders were successfully delivered vs cancelled?
- Finding: 96,478 orders (97.0%) were successfully delivered — an excellent fulfillment rate. Only 625 orders (0.6%) were cancelled and 609 (0.6%) were unavailable. This suggests Olist's logistics network is highly reliable, with only a small fraction of orders failing to reach customers.

**Q2. Top Revenue Categories**
- Business question: Which product categories generate the most revenue?
- Finding: Health & Beauty led with R$1,233,131.72 in revenue, followed by Watches & Gifts (R$1,166,176.98) and Bed, Bath & Table (R$1,023,434.76). These three categories alone account for the majority of platform revenue, suggesting Olist should prioritize seller recruitment and marketing in these segments.

**Q3. Payment Method Preference**
- Business question: What payment methods do customers prefer and what's the average order value per payment type?
- Finding: Credit card is overwhelmingly the most popular payment method with 76,795 orders (73.7% of all payments) and an average order value of R$163.32. Boleto (bank slip) is second with 19,784 orders at R$145.03 average. Vouchers, while the least used, had the lowest average value (R$65.70) — suggesting they're used for smaller, discounted purchases.

**Q4. Customer Satisfaction by Category**
- Business question: Which product categories have the best and worst average review scores?
- Finding: Books (General Interest) had the highest satisfaction at 4.45/5.0, followed by Technical Books (4.36) and Luggage & Accessories (4.32). The worst performing categories were Office Furniture (3.49/5.0), Male Clothing (3.64), and Fixed Telephony (3.68) — suggesting quality or expectation issues in these segments that need investigation.

**Q5. Top Customer States**
- Business question: Which Brazilian states have the most customers and highest spending?
- Finding: São Paulo (SP) dominates with R$5,067,633.16 in revenue from 46,448 orders — nearly 3x the second state (Rio de Janeiro at R$1,759,651.13). The top 5 states (SP, RJ, MG, RS, PR) are all in the South/Southeast region, suggesting Olist's customer base is concentrated in Brazil's most economically developed regions.

**Q6. Delivery Performance**
- Business question: What is the average delivery time and how does it vary by seller state?
- Finding: The overall average delivery time is 12.1 days from purchase to delivery. The fastest recorded delivery was same-day (0 days) while the longest was 209 days — a massive outlier suggesting extreme logistics issues in some cases. This wide variance indicates inconsistent delivery performance that needs attention.

**Q7. Late Delivery Analysis**
- Business question: What percentage of orders were delivered late and does late delivery affect review scores?
- Finding: 7,826 orders (8.1%) were delivered after the estimated date. The impact on customer satisfaction is dramatic — late deliveries average a 2.57/5.0 review score compared to 4.29/5.0 for on-time deliveries. This 1.72 point difference clearly shows that delivery punctuality is the single biggest driver of customer dissatisfaction.

**Q8. Top Performing Sellers**
- Business question: Which sellers generate the most revenue and have the best review scores?
- Finding: The top seller generated R$226,987.93 with a 4.14/5.0 average review score. Notably, the highest revenue sellers are predominantly from São Paulo (SP), consistent with SP being the largest customer market. There's a trade-off visible — some high-revenue sellers have lower review scores (3.34), suggesting volume doesn't always equal quality.

**Q9. Payment Installment Analysis**
- Business question: Do customers who pay in more installments spend more overall?
- Finding: Yes — there's a clear positive correlation between installments and spending. Customers paying in 1 installment spend an average of R$112.42, while those paying in 8 installments spend R$307.74 on average (2.7x more). This suggests installment options are enabling higher-value purchases and Olist should continue promoting flexible payment options.

**Q10. Monthly Revenue Trend**
- Business question: How did revenue change month over month?
- Finding: Revenue grew consistently from R$111,798 in January 2017 to a peak of R$987,765 in November 2017 (+52.4% MoM) — likely driven by Black Friday. Revenue dipped in December 2017 (-26.5%) before recovering strongly in January 2018 (R$924,645). The data shows clear seasonality with Q4 peaks, suggesting holiday campaigns should focus on October-November.

---

## Key Insights
- **Late delivery destroys satisfaction:** Orders delivered late average 2.57/5.0 vs 4.29/5.0 for on-time — a 1.72 point gap. Improving logistics is the single highest-impact action Olist can take
- **São Paulo is everything:** SP generates nearly 3x more revenue than any other state — marketing and logistics investment should be concentrated here
- **Installments drive bigger purchases:** Customers paying in 8 installments spend 2.7x more than single-payment customers — flexible payment options directly increase order value
- **Health & Beauty leads revenue:** R$1.23M vs R$1.16M for Watches & Gifts — a competitive top 2 that both deserve marketing investment
- **97% fulfillment rate is excellent:** Only 0.6% of orders are cancelled — Olist's logistics network is highly reliable despite the 8.1% late delivery rate

---

## What I Learned
- Late delivery has a massive impact on customer satisfaction — a 1.72 point review score difference shows that logistics is not just an operational issue but a direct driver of customer experience
- São Paulo's dominance (46,448 orders vs 14,143 for Rio) shows how geographically concentrated Brazilian e-commerce still is
- Multi-table JOINs (up to 4 tables) are essential for real-world e-commerce analysis — almost every meaningful business question requires connecting multiple tables
- Payment installment data reveals customer behavior that single-metric analysis would miss — customers who pay in installments are actually higher-value customers
- Always check for outliers — a max delivery time of 209 days signals extreme edge cases that need investigation before drawing conclusions

---

## SQL Concepts Used
- `INNER JOIN` — connecting up to 4 tables (orders → order_items → products → category_translation)
- `GROUP BY` + aggregate functions (`SUM`, `COUNT`, `AVG`) — revenue and order analysis
- `HAVING` — filtering grouped results
- `ORDER BY` + `LIMIT` — ranking top performers
- `EXTRACT()` — pulling month and year from timestamps
- `CASE WHEN` — classifying orders as Late/On Time
- CTEs (Common Table Expressions) — organizing monthly revenue trend analysis
- `LAG()` window function — month-over-month revenue change
- `ROUND()` — formatting percentages and averages
- `SUM(COUNT(*)) OVER()` — calculating percentages within groups
- `IS NOT NULL` — filtering missing delivery dates
- Date arithmetic — subtracting timestamps to calculate delivery time in days

---

## Credit
Dataset: [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) via Kaggle
