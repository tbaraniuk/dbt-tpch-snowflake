select
    orders.order_id,
    orders.order_date,
    orders.total_price,
    line_items.line_number,
    line_items.part_id,
    line_items.part_supp_id,
    line_items.quantity,
    line_items.extended_price,
    line_items.discount,
    line_items.discounted_price,
from
    {{ ref('stg_orders') }} as orders
join
    {{ ref('stg_line_items') }} as line_items
        on orders.order_id = line_items.order_id