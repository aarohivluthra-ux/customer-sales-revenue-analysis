-- Project: Customer Sales and Revenue Analysis
-- Analysis: Customer Retention and Churn
-- Database: PostgreSQL
-- Purpose: Measure monthly customer activity.

-- 1. Monthly Active Customers

SELECT
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders
WHERE status <> 'returned'
GROUP BY DATE_TRUNC('month', order_date)::DATE
ORDER BY sales_month;


-- 2. Repeat Customers

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
WHERE status <> 'returned'
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY total_orders DESC;


-- 3. Month-over-Month Retained Customers

WITH monthly_customers AS (
    SELECT DISTINCT
        customer_id,
        DATE_TRUNC('month', order_date)::DATE AS sales_month
    FROM orders
    WHERE status <> 'returned'
),
retention AS (
    SELECT
        current_month.sales_month,
        COUNT(DISTINCT current_month.customer_id)
            AS retained_customers
    FROM monthly_customers AS current_month
    JOIN monthly_customers AS previous_month
        ON current_month.customer_id = previous_month.customer_id
        AND current_month.sales_month =
            (previous_month.sales_month + INTERVAL '1 month')::DATE
    GROUP BY current_month.sales_month
)
SELECT
    sales_month,
    retained_customers
FROM retention
ORDER BY sales_month;



-- 4. Monthly Retention and Churn Rates

WITH monthly_customers AS (
    SELECT DISTINCT
        customer_id,
        DATE_TRUNC('month', order_date)::DATE AS sales_month
    FROM orders
    WHERE status <> 'returned'
),
monthly_totals AS (
    SELECT
        sales_month,
        COUNT(*) AS active_customers
    FROM monthly_customers
    GROUP BY sales_month
),
retained AS (
    SELECT
        current_month.sales_month,
        COUNT(DISTINCT current_month.customer_id)
            AS retained_customers
    FROM monthly_customers AS current_month
    JOIN monthly_customers AS previous_month
        ON current_month.customer_id = previous_month.customer_id
        AND current_month.sales_month =
            (previous_month.sales_month + INTERVAL '1 month')::DATE
    GROUP BY current_month.sales_month
)
SELECT
    current_totals.sales_month,
    previous_totals.active_customers AS previous_month_customers,
    COALESCE(retained.retained_customers, 0) AS retained_customers,
    previous_totals.active_customers
        - COALESCE(retained.retained_customers, 0) AS churned_customers,
    ROUND(
        100.0 * COALESCE(retained.retained_customers, 0)
        / NULLIF(previous_totals.active_customers, 0),
        2
    ) AS retention_rate,
    ROUND(
        100.0 * (
            previous_totals.active_customers
            - COALESCE(retained.retained_customers, 0)
        ) / NULLIF(previous_totals.active_customers, 0),
        2
    ) AS churn_rate
FROM monthly_totals AS current_totals
JOIN monthly_totals AS previous_totals
    ON current_totals.sales_month =
        (previous_totals.sales_month + INTERVAL '1 month')::DATE
LEFT JOIN retained
    ON current_totals.sales_month = retained.sales_month
ORDER BY current_totals.sales_month;


-- 5. Identify the Month with the Lowest Retention Rate

WITH monthly_customers AS (
    SELECT DISTINCT
        customer_id,
        DATE_TRUNC('month', order_date)::DATE AS sales_month
    FROM orders
    WHERE status <> 'returned'
),
monthly_totals AS (
    SELECT
        sales_month,
        COUNT(*) AS active_customers
    FROM monthly_customers
    GROUP BY sales_month
),
retained AS (
    SELECT
        current_month.sales_month,
        COUNT(DISTINCT current_month.customer_id)
            AS retained_customers
    FROM monthly_customers AS current_month
    JOIN monthly_customers AS previous_month
        ON current_month.customer_id = previous_month.customer_id
        AND current_month.sales_month =
            (previous_month.sales_month + INTERVAL '1 month')::DATE
    GROUP BY current_month.sales_month
)
SELECT
    current_totals.sales_month,
    ROUND(
        100.0 * COALESCE(retained.retained_customers, 0)
        / NULLIF(previous_totals.active_customers, 0),
        2
    ) AS retention_rate
FROM monthly_totals AS current_totals
JOIN monthly_totals AS previous_totals
    ON current_totals.sales_month =
        (previous_totals.sales_month + INTERVAL '1 month')::DATE
LEFT JOIN retained
    ON current_totals.sales_month = retained.sales_month
ORDER BY retention_rate ASC
LIMIT 1;

