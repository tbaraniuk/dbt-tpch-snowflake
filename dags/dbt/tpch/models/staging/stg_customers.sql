select
    c_custkey as customer_id,
    c_name as name,
    c_acctbal as actual_balance,
    c_nationkey as nation_id
from
    {{ source('tpch', 'customer') }}