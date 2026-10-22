
-- Project: Customer Sales & Revenue Analysis
-- File: 07_order_status_analysis.sql
-- Purpose: Analyze order counts and values by status

SELECT
    status,
    COUNT(*) AS number_of_orders,
    SUM(total) AS total_order_value,
    ROUND(AVG(total), 2) AS average_order_value
FROM orders
GROUP BY status
ORDER BY number_of_orders DESC;
