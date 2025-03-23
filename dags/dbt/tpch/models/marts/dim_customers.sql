select
    c.customer_id,
    c.name,
    c.actual_balance,
    c.nation_id,
    r.total_orders,
    r.total_spent,
    r.last_order_date,
    r.days_since_last_order,
    r.retention_category
from
    {{ ref('stg_customers') }} as c
join
    {{ ref('int_customer_retention') }} as r
        on c.customer_id = r.customer_id