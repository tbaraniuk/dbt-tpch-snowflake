select
    p.part_id,
    p.name,
    p.brand,
    sp.month
    sp.total_revenue,
    sp.total_cost,
    sp.total_profit,
    sp.avg_profit_margin
from
    {{ ref('stg_part') }} as p
join
    {{ ref('fct_sales_profitability') }} as sp
        on p.part_id = sp.part_id