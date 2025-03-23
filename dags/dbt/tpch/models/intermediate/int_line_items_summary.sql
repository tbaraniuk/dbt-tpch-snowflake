select
    order_id,
    SUM(extended_price) as sum_price
from
    {{ ref('int_line_items') }}
group by
    order_id