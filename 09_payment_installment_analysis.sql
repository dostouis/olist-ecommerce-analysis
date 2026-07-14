SELECT
    payment_installments,
    COUNT(payment_installments) AS total_installation,
    AVG(payment_value) AS avg_rev

FROM 
    order_payments

GROUP BY
    payment_installments

ORDER BY 
    payment_installments ASC;