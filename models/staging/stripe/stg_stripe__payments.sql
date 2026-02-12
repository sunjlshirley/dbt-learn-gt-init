SELECT
    id AS payment_id,
    orderid AS order_id,
    PAYMENTMETHOD AS payment_method,
    status,
    amount / 100 as amount,
    created as created_at
FROM
    {{ source('stripe', 'payments')}}