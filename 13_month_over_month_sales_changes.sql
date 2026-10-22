-- Project: Customer Sales & Revenue Analysis
-- File: 13_month_over_month_sales_change.sql
-- Purpose: Compare monthly sales with the previous month
-- Finding: March recorded the highest monthly sales value.
-- Note: April data is incomplete through April 9.

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS sales_month,
        SUM(total) AS monthly_sales_value
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    sales_month,
    ROUND(monthly_sales_value, 2) AS monthly_sales_value,
    ROUND(
        LAG(monthly_sales_value) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS previous_month_sales,
    ROUND(
        monthly_sales_value
        - LAG(monthly_sales_value) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS sales_change
FROM monthly_sales
ORDER BY sales_month;