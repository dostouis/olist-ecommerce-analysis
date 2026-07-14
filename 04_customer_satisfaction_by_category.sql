SELECT
    ct.product_category_name_english AS category,
    AVG(r.review_score) AS avg_review_score

FROM
    order_reviews AS r INNER JOIN order_items AS oi
    ON r.order_id = oi.order_id INNER JOIN
    products AS p ON oi.product_id = p.product_id
    INNER JOIN category_translation AS ct
    ON p.product_category_name = ct.product_category_name

GROUP BY
    category

ORDER BY
    avg_review_score DESC

LIMIT 20;
