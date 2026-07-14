SELECT
    CASE 
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time' 
    END AS delivery_status,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage,
    ROUND(AVG(review_score), 2) AS avg_review_score

FROM
    orders AS ord INNER JOIN order_reviews AS ord_rev
    ON ord.order_id = ord_rev.order_id

WHERE
    order_delivered_customer_date IS NOT NULL

GROUP BY
    delivery_status

ORDER BY
    order_count DESC;