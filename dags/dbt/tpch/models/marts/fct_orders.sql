select
    order_id,
    customer_id,
    total_price,
    order_date,
from
    {{ ref('stg_orders') }}