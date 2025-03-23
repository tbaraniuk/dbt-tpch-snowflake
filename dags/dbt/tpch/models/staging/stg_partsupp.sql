select
    {{ dbt_utils.generate_surrogate_key([
        'ps_partkey',
        'ps_suppkey'
    ]) }} as part_supp_id,
    ps_partkey as part_id,
    ps_suppkey as supply_id,
    ps_availqty as available_quantity,
    ps_supplycost as supply_cost
from
    {{ source('tpch', 'partsupp') }}