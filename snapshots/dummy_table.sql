{% snapshot dummy_table %}

{{ config(
    target_database='northern-bot-429916-d6',  
    target_schema='dbt_nm',                    
    unique_key='ifnull(concat(field1,field2),field1)',                   
    strategy='timestamp',                     
    updated_at='load_date'            
) }}

SELECT
    *
FROM
    `northern-bot-429916-d6.dbt_nm.test_table_2` 

{% endsnapshot %}
