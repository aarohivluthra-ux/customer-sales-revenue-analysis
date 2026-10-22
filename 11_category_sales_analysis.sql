
-- Project: Customer Sales & Revenue Analysis
-- File: 11_category_sales_analysis.sql
-- Purpose: Compare sales value and units across categories

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    COUNT(DISTINCT oi.order_id) AS number_of_orders,
    ROUND(
        SUM(oi.quantity * oi.unit_price),
        2
    ) AS total_sales_value
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales_value DESC;
