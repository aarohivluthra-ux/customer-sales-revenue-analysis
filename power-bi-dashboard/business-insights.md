# Business Insights — Customer Sales & Revenue Analysis

## 1. Project Objective
The objective of this project is to analyse customer activity, recorded order revenue, product performance, and order status using SQL and Power BI.

## 2. Key Findings

### Overall Performance
- **Recorded order revenue:** 704.50
- **Total orders:** 12
- **Total customers:** 8
- The dataset provides a small sample for demonstrating SQL analysis, data modelling, and dashboard development.

### Monthly Revenue Trend
Recorded order totals by month were:

| Month | Recorded Order Totals |
|---|---:|
| January 2026 | 128.00 |
| February 2026 | 167.40 |
| March 2026 | 283.00 |
| April 2026 | 127.00 |

- March had the highest recorded monthly total at 283.00.
- Recorded totals increased from January to February and again from February to March.
- April's recorded total decreased by 156.00 compared with March.

### Product Performance
- Mechanical Keyboard was the top product identified in the SQL product analysis, with item-level revenue of 178.00.
- The Power BI dashboard compares revenue across product categories and highlights the five highest-revenue products.

### Order Status
- Orders were grouped by status to examine the distribution of delivered, shipped, processing, and returned orders.
- This breakdown can help identify where additional investigation into order fulfilment may be useful.

## 3. Data Quality Checks
SQL checks were performed on customer, product, order, and order-item data.

- Checked for missing values and invalid totals.
- Checked for duplicate identifiers and unmatched customer or product references.
- Compared recorded order totals with calculated order-item totals.
- No differences were found in the order-total reconciliation for the supplied dataset.

## 4. Important Metric Definitions
- **Recorded order revenue:** Sum of `orders.total`; this currently includes returned orders.
- **Product-level revenue:** Sum of `order_items.quantity × order_items.unit_price`.
- These metrics answer different questions and should not be treated as interchangeable without further reconciliation.

## 5. Recommendations
1. Analyse returned orders separately before using recorded order totals as a measure of net sales.
2. Investigate the reasons for the decline in recorded totals in April.
3. Monitor product and category performance over a longer period.
4. Use a larger dataset to validate whether the observed trends persist.

## 6. Limitations
This analysis uses a small sample dataset with four months of order activity. The findings are descriptive and should not be treated as proof of long-term trends or customer behaviour.

## 7. Tools Used
- PostgreSQL-compatible SQL
- Microsoft Power BI
- DAX
- GitHub
