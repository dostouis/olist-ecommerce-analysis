SELECT
    payment_type,
    COUNT(payment_type) AS total_payment_type,
    AVG(payment_value) AS avg_ord_val

FROM
    order_payments

GROUP BY 
    payment_type

ORDER BY
    total_payment_type DESC,
    avg_ord_val DESC;