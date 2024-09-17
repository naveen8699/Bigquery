{{
    config(
        materialized='incremental',
        pre_hook ="UPDATE {{this}} SET dbt_valid_to = CURRENT_TIMESTAMP() WHERE dbt_valid_to = '2999-12-31 00:00:00 UTC' ",
   

         )
}}


select *,
CURRENT_TIMESTAMP() as dbt_valid_from,
parse_timestamp('%Y-%m-%d %H:%M:%S', '2999-12-31 00:00:00') AS dbt_valid_to
from {{ ref('my_first_dbt_model') }}

