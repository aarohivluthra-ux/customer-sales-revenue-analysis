
-- Project: Customer Sales & Revenue Analysis
-- File: 04_product_data_quality.sql
-- Purpose: Validate product data quality
-- Finding: 10 products; no missing names, categories, or prices;
-- no non-positive prices; 10 distinct product IDs.

SELECT
    COUNT(*) AS total_products,
    COUNT(*) FILTER (
        WHERE name IS NULL OR TRIM(name) = ''
    ) AS missing_names,
    COUNT(*) FILTER (
        WHERE category IS NULL OR TRIM(category) = ''
    ) AS missing_categories,
    COUNT(*) FILTER (
        WHERE price IS NULL
    ) AS missing_prices,
    COUNT(*) FILTER (
        WHERE price <= 0
    ) AS invalid_prices,
    COUNT(DISTINCT product_id) AS unique_product_ids
FROM products;

-- Check for NULL product IDs explicitly
SELECT
    COUNT(*) FILTER (
        WHERE product_id IS NULL
    ) AS missing_product_ids
FROM products;
