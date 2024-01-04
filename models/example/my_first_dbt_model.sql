

/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table', post_hook = 'grant select on {{this}} to role analyst') }}

with source_data as (
    select 1 as id, 'CA' as state, '2020-03-01 00:00:00.000' as updated_at
    union all
    select 7 as id, 'NY' as state, '2020-01-01 00:00:00.000' as updated_at)
select
    * 
    --, {{ var('my_first_var') }} as a
from source_data
-- where id >= {{ var('my_third_var') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null