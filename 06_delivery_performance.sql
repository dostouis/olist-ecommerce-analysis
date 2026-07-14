SELECT
    seller_state,
    AVG(EXTRACT(DAY FROM (order_delivered_customer_date - order_purchase_timestamp))) 
    AS avg_delivery_days

FROM
    orders AS ord INNER JOIN order_items AS oi 
    ON ord.order_id = oi.order_id INNER JOIN
    sellers AS s ON oi.seller_id = s.seller_id
    
WHERE
    order_status = 'delivered'

GROUP BY
    seller_state

ORDER BY
    avg_delivery_days DESC;
