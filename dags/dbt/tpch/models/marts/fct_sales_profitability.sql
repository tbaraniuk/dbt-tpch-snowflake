with lineitem_extended as (
    select
        l.order_id,
        l.part_id,
        l.quantity,
        l.discounted_price as revenue,
        p.supply_cost,
        (p.supply_cost * l.quantity) as total_cost,
        (l.discounted_price - (p.supply_cost * l.quantity)) as profit,
        (l.discounted_price - (p.supply_cost * l.quantity)) / nullif(l.discounted_price, 0) as profit_margin,
        to_char(l.order_date, 'YYYY-MM') as month
    from
        {{ ref('int_line_items') }} as l
    join
        {{ ref('stg_partsupp') }} as p
            on l.part_supp_id = p.part_supp_id
)

select
    part_id,
    month,
    sum(revenue) as total_revenue,
    sum(total_cost) as total_cost,
    sum(profit) as total_profit,
    avg(profit_margin) as avg_profit_margin
from
    lineitem_extended
where
    month >= to_char(dateadd(month, -3, current_date), 'YYYY-MM')
group by
    part_id, month
order by
    part_id, month