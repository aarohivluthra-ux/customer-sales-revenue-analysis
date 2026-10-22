
-- Project: Customer Sales & Revenue Analysis
-- File: 06_order_items_data_quality.sql
-- Purpose: Validate order item data quality and relationships

-- Check 1: Validate required values and positive quantities/prices
SELECT
    COUNT(*) AS total_order_items,
    COUNT(*) FILTER (
        WHERE order_id IS NULL
    ) AS missing_order_ids,
    COUNT(*) FILTER (
        WHERE product_id IS NULL
    ) AS missing_product_ids,
    COUNT(*) FILTER (
        WHERE quantity IS NULL
    ) AS missing_quantities,
    COUNT(*) FILTER (
        WHERE quantity <= 0
    ) AS non_positive_quantities,
    COUNT(*) FILTER (
        WHERE unit_price IS NULL
    ) AS missing_unit_prices,
    COUNT(*) FILTER (
        WHERE unit_price <= 0
    ) AS non_positive_unit_prices
FROM order_items;

-- Check 2: Validate order and product relationships
SELECT
    COUNT(*) FILTER (
        WHERE o.order_id IS NULL
    ) AS items_without_matching_orders,
    COUNT(*) FILTER (
        WHERE p.product_id IS NULL
    ) AS items_without_matching_products
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
LEFT JOIN products p
    ON oi.product_id = p.product_id;
