
-- Project: Customer Sales & Revenue Analysis
-- File: 02_customer_data_quality.sql
-- Purpose: Check for missing customer values
-- Finding: All 8 customers have values in the checked columns.

SELECT
    COUNT(*) AS total_customers,
    COUNT(name) AS customers_with_name,
    COUNT(email) AS customers_with_email,
    COUNT(country) AS customers_with_country,
    COUNT(signup_date) AS customers_with_signup_date
FROM customers;
