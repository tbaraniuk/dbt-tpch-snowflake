select
    l_orderkey as order_id,
    l_linenumber as line_number,
    l_partkey as part_id,
    {{ dbt_utils.generate_surrogate_key([
        'l_partkey',
        'l_suppkey'
    ]) }} as part_supp_id,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount,
    (l_extendedprice * (1 - l_discount)) as discounted_price
from
    {{ source('tpch', 'lineitem') }}