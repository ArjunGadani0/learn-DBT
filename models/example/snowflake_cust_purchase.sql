{{ config(materialized='view') }}

select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
FROM {{ source('sample', 'customer') }} c
JOIN {{ source('sample', 'orders') }} o
    on c.c_custkey = o.o_custkey
{{group_by(3)}}
