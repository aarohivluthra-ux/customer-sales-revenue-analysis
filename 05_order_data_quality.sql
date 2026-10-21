
-- Project: Customer Sales & Revenue Analysis
-- File: 05_order_data_quality.sql
-- Purpose: Validate order data quality and customer relationships

-- Check 1: Validate order records
SELECT
    COUNT(*) AS total_orders,
    COUNT(*) FILTER (
        WHERE customer_id IS NULL
    ) AS missing_customer_ids,
    COUNT(*) FILTER (
        WHERE order_date IS NULL
    ) AS missing_order_dates,
    COUNT(*) FILTER (
        WHERE status IS NULL OR TRIM(status) = ''
    ) AS missing_statuses,
    COUNT(*) FILTER (
        WHERE total IS NULL
    ) AS missing_totals,
    COUNT(*) FILTER (
        WHERE total <= 0
    ) AS non_positive_totals,
    COUNT(DISTINCT order_id) AS unique_order_ids
FROM orders;

-- Check 2: Find orders without a matching customer
SELECT
    COUNT(*) AS orders_without_matching_customer
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
