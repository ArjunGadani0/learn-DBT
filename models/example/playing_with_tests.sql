{{ config(materialized="view") }}

select
    c.c_custkey,
    c.c_mktsegment,
    {{rename_seg('c_mktsegment')}} as revised_mkt_segment
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
