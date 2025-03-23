with customer_orders as (
    select
        customer_id,
        count(order_id) as total_orders,
        sum(total_price) as total_spent,
        max(order_date) as last_order_date,
    from
        {{ ref('fct_orders') }}
    group by
        customer_id
),

retention_metrics as (
    select
        customer_id,
        total_orders,
        total_spent,
        last_order_date,
        current_date as today,
        {{ days_since("last_order_date") }} as days_since_last_order
    from
        customer_orders
),

retention_status as (
    select
        *,
        case
            when total_orders = 1 then 'New Customer'
            when days_since_last_order > 180 then 'Churned'
            when days_since_last_order between 90 and 180 then 'At Risk'
            else 'Active'
        end as retention_category
    from
        retention_metrics
)

select * from retention_status