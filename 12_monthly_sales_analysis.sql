
-- Project: Customer Sales & Revenue Analysis
-- File: 12_monthly_sales_analysis.sql
-- Purpose: Analyze monthly order counts and sales values

SELECT
    DATE_TRUNC('month', order_date)::date AS sales_month,
    COUNT(*) AS number_of_orders,
    ROUND(SUM(total), 2) AS monthly_sales_value
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;
