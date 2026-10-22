
-- Project: Customer Sales & Revenue Analysis
-- File: 08_order_total_validation.sql
-- Purpose: Compare recorded order totals with item-level values

SELECT
    o.order_id,
    o.total AS recorded_order_total,
    SUM(oi.quantity * oi.unit_price) AS calculated_item_total,
    ROUND(
        o.total - SUM(oi.quantity * oi.unit_price),
        2
    ) AS difference
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total
ORDER BY o.order_id;
