-- 1. Check total orders
-- Found: 99,441 total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2. Check date range
-- Found: 2016-09-04 to 2018-10-17
SELECT
    MIN(order_purchase_timestamp) AS earliest_order,
    MAX(order_purchase_timestamp) AS latest_order
FROM orders;

-- 3. Check order statuses
-- Found: delivered (96,478), shipped (1,107), canceled (625),
--        unavailable (609), invoiced (314), processing (301),
--        approved (2), created (5)
SELECT
    order_status,
    COUNT(*) AS count
FROM orders
GROUP BY order_status
ORDER BY count DESC;

-- 4. Check NULL delivery dates
-- Found: 2,965 orders with no delivery date
-- Decision: These are non-delivered orders (canceled, shipped, etc.)
-- Exclude from delivery time analysis
SELECT COUNT(*) AS null_delivery_dates
FROM orders
WHERE order_delivered_customer_date IS NULL;

-- 5. Check NULL approved dates
-- Found: 160 orders with no approval date
-- Decision: Exclude from approval time analysis
SELECT COUNT(*) AS null_approved_dates
FROM orders
WHERE order_approved_at IS NULL;

-- 6. Check NULL review scores
-- Found: 0 NULL review scores — review data is complete
SELECT COUNT(*) AS null_review_scores
FROM order_reviews
WHERE review_score IS NULL;

-- 7. Check NULL payment values
-- Found: 0 NULL payment values — payment data is complete
SELECT COUNT(*) AS null_payment_values
FROM order_payments
WHERE payment_value IS NULL;

-- 8. Check NULL prices in order items
-- Found: 0 NULL prices — order items data is complete
SELECT COUNT(*) AS null_prices
FROM order_items
WHERE price IS NULL;

-- 9. Check total rows per table
-- Found: orders (99,441), order_items (112,650),
--        order_payments (103,886), order_reviews (99,224),
--        customers (99,441), products (32,951),
--        sellers (3,095), category_translation (71)
SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'category_translation', COUNT(*) FROM category_translation;