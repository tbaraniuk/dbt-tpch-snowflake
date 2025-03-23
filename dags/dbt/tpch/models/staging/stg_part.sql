select
    p_partkey as part_id
    p_name as name,
    p_brand as brand
from
    {{ source('tpch', 'part') }}