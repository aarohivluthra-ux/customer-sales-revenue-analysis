
-- Project: Customer Sales & Revenue Analysis
-- File: 03_customer_data_quality.sql
-- Purpose: Check duplicate emails and missing customer values

-- Check 1: Find duplicate emails after normalisation
SELECT
    LOWER(TRIM(email)) AS cleaned_email,
    COUNT(*) AS occurrences
FROM customers
WHERE email IS NOT NULL
  AND TRIM(email) <> ''
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;

-- Check 2: Count missing or blank customer values
SELECT
    COUNT(*) FILTER (
        WHERE name IS NULL OR TRIM(name) = ''
    ) AS missing_names,
    COUNT(*) FILTER (
        WHERE email IS NULL OR TRIM(email) = ''
    ) AS missing_emails,
    COUNT(*) FILTER (
        WHERE country IS NULL OR TRIM(country) = ''
    ) AS missing_countries,
    COUNT(*) FILTER (
        WHERE signup_date IS NULL
    ) AS missing_signup_dates
FROM customers;
