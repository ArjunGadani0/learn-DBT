{% macro rename_seg(column_name) %}
    (
        case
            when c.c_mktsegment in ('BUILDING', 'HOUSEHOLD', 'FURNITURE')
            then 'segment_1'
            else 'segment_2'
        end
    )
{% endmacro %}