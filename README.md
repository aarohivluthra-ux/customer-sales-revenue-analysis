# Customer Sales and Revenue Analysis

## Project Overview
This project uses SQL and PostgreSQL to analyse customer behaviour, sales performance, product revenue, and customer retention. The goal is to turn raw sales data into meaningful business insights.

## Business Objectives
- Explore customer, product, order, and order-item data.
- Assess data quality and identify potential data issues.
- Analyse sales revenue by order status, product category, and month.
- Identify repeat customers and measure monthly customer retention and churn.
- Highlight trends that could support business decisions.

## Tools and Technologies
- SQL
- PostgreSQL
- GitHub

## Database Tables
- **customers:** Customer details and signup dates.
- **products:** Product names, categories, and prices.
- **orders:** Order dates, statuses, customer IDs, and order totals.
- **order_items:** Products and quantities associated with each order.

## Key Analysis and Findings
- Monthly revenue increased from January to March 2026, then declined in April.
- Mechanical Keyboard was the highest-selling product by sales value in the product analysis.
- Four customers placed more than one non-returned order.
- Monthly customer retention was 50% in February and March, falling to 25% in April.
- April's calculated customer churn rate was 75%.

## Project Structure
The SQL scripts are numbered and organised by analysis topic, including data exploration, data quality checks, sales summaries, monthly revenue trends, and customer retention analysis.

## Limitations
This project uses a small sample dataset. The findings are illustrative and should not be treated as definitive evidence of long-term customer behaviour.

## About
This is a portfolio project demonstrating SQL skills relevant to Data Analyst and Business Intelligence roles.

## SQL Project Files

The SQL scripts in this repository cover the following areas:

| Analysis Area | Purpose |
|---|---|
| Data Exploration | Understand the available tables and dataset structure. |
| Customer Data Quality | Check missing values, blank fields, and duplicate email addresses. |
| Product Data Quality | Validate product records and prices. |
| Order Data Quality | Check order completeness, valid totals, and customer relationships. |
| Order Item Data Quality | Validate quantities, unit prices, and order/product relationships. |
| Order Status Analysis | Compare order counts and order values by status. |
| Customer Analysis | Summarise customer purchasing activity. |
| Product Sales Analysis | Identify products contributing to sales value. |
| Category Analysis | Compare sales performance across product categories. |
| Monthly Revenue Analysis | Track monthly revenue and changes over time. |
| Customer Retention Analysis | Measure monthly active customers, repeat purchases, retention, and churn. |

### Featured Analysis: Customer Retention

The `13_customer_retention_analysis.sql` script investigates customer activity and repeat purchases, calculates month-over-month retention and churn rates, and identifies the month with the lowest retention.

### How to Use This Project

1. Open a SQL script in the repository.
2. Run it in a PostgreSQL-compatible environment with the project tables loaded.
3. Review the query output and compare the results with the documented business findings.
