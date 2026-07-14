WITH problem_10 AS (
    SELECT
        EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
        EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
        SUM(price) AS revenue
    
    FROM
        order_items AS oi INNER JOIN orders AS o
        ON oi.order_id = o.order_id
    
    WHERE
        order_status = 'delivered'
    
    GROUP BY
        month, year
)

SELECT
    month,
    year,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS last_month_revenue

FROM
    problem_10;
