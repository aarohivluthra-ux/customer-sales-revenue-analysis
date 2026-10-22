
-- Project: Customer Sales & Revenue Analysis
-- File: 10_product_sales_analysis.sql
-- Purpose: Analyze product sales value and units sold

SELECT
    p.product_id,
    p.name AS product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales_value
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.name,
    p.category
ORDER BY total_sales_value DESC;
