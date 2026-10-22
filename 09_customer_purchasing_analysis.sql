
-- Project: Customer Sales & Revenue Analysis
-- File: 09_customer_purchasing_analysis.sql
-- Purpose: Summarize order activity and value by customer

SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total), 0) AS total_order_value,
    ROUND(AVG(o.total), 2) AS average_order_value
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name
ORDER BY total_order_value DESC;
