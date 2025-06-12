WITH rfm AS (
  SELECT
    customer_id,
    MAX(order_date) AS last_order_date,
    COUNT(order_id) AS frequency,
    SUM(payment_value) AS monetary
  FROM transactions
  GROUP BY customer_id
),
reference_date AS (
  SELECT '2025-06-12' AS ref_date
),
rfm_score AS (
  SELECT
    r.customer_id,
    julianday(ref_date) - julianday(r.last_order_date) AS recency,
    r.frequency,
    r.monetary
  FROM rfm r
  CROSS JOIN reference_date
)
SELECT
  customer_id,
  recency,
  frequency,
  monetary,
  CASE
    WHEN recency <= 30 AND frequency >= 5 THEN 'Champion'
    WHEN recency <= 60 AND frequency >= 3 THEN 'Loyal'
    WHEN recency <= 90 THEN 'Recent'
    WHEN frequency = 1 THEN 'One-time'
    WHEN monetary >= 500 THEN 'High-Value'
    ELSE 'Others'
  END AS customer_segment
FROM rfm_score;
