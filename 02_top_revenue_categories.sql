SELECT
    ct.product_category_name_english AS category,
    COUNT(*) AS order_count,
    SUM(oi.price) AS revenue

FROM
    order_items AS oi 
    INNER JOIN products AS p 
    ON oi.product_id = p.product_id
    INNER JOIN category_translation AS ct 
    ON p.product_category_name = ct.product_category_name

GROUP BY
    ct.product_category_name_english

ORDER BY
    revenue DESC

LIMIT 10;