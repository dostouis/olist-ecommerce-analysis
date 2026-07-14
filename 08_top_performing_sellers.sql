SELECT
    s.seller_id,
    SUM(price) AS revenue

FROM
    order_items AS oi INNER JOIN sellers AS s
    ON oi.seller_id = s.seller_id INNER JOIN
    orders AS ord ON oi.order_id = ord.order_id

WHERE
    order_status = 'delivered'

GROUP BY
    s.seller_id

ORDER BY
    revenue DESC

LIMIT 20;