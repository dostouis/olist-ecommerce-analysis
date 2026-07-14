SELECT
    customer_state,
    SUM(price) AS revenue,
    COUNT(DISTINCT ord.order_id) AS order_count

FROM
    order_items AS oi INNER JOIN orders AS ord
    ON oi.order_id = ord.order_id 
    INNER JOIN customers AS c
    ON ord.customer_id = c.customer_id

WHERE
    order_status = 'delivered'

GROUP BY
    customer_state

ORDER BY
    revenue DESC;