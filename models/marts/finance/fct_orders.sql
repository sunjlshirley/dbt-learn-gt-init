with 
    orders as (
        select * from {{ ref('stg_jaffle_shop__orders')}}
    ),
    payments as (
        select * from {{ ref('stg_stripe__payments')}}
    ),
    final as (
        select
            orders.order_id,
            orders.customer_id,
            sum(case when payments.status = 'success' then amount else 0 end) as amount
        from
            orders
            left join payments on orders.order_id = payments.order_id
        group by 
            1, 2
    )

select * from final