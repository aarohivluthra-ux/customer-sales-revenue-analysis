# Customer Sales & Revenue Analysis

## Project Overview
An end-to-end data analytics portfolio project using SQL and Microsoft Power BI to explore customer activity, sales performance, product revenue, and order status.

The project demonstrates data exploration, data quality validation, relational data modelling, DAX calculations, dashboard development, and business-oriented reporting.

## Tools & Technologies
- **SQL (PostgreSQL-compatible):** Data exploration, joins, aggregations, data quality checks, and business analysis
- **Microsoft Power BI:** Data modelling, DAX measures, KPI cards, and visualisations
- **GitHub:** Version control and project documentation

## Project Structure

### SQL Analysis
SQL scripts cover data exploration, data quality checks, order-status analysis, customer summaries, product performance, category analysis, and monthly trends.

### Power BI Dashboard
The dashboard presents:
- Total recorded order revenue: **704.50**
- Total orders: **12**
- Total customers: **8**
- Monthly revenue trend
- Revenue by product category
- Orders by status
- Top five products by revenue

[View the Power BI dashboard and screenshot](power-bi-dashboard/README.md)

### Business Insights
The business insights document summarises monthly trends, product performance, data quality checks, recommendations, and limitations.

[Read the business insights](power-bi-dashboard/business-insights.md)

## Key Findings
- March 2026 had the highest recorded monthly order total at **283.00**.
- April's recorded order total decreased by **156.00** compared with March.
- Mechanical Keyboard was the top product in the SQL product analysis, with item-level revenue of **178.00**.
- SQL quality checks found no differences in the order-total reconciliation for this sample dataset.

## Important Metric Note
Recorded order revenue is calculated from `orders.total` and includes returned orders. Product-level revenue is calculated from quantity multiplied by unit price. These measures are not interchangeable without further reconciliation.

## Project Limitations
The dataset contains a small sample of eight customers and twelve orders across four months. Findings are descriptive and should not be interpreted as established long-term business trends.

## Skills Demonstrated
SQL querying, data quality validation, relational data modelling, DAX, KPI development, data visualisation, business analysis, and technical documentation.
