{{ config(
   materialized='incremental',
   unique_key='inventory_id'
) }}


WITH inventory_data AS (
   SELECT
       i.inventory_id,
       i.reorder_level,
       i.product_id,
       i.quantity_in_stock,
       i.warehouse_id,
       i.rating,
       i.stock_level,
       i.sales_volume,
       i.restock_date,
       i.weight,
       i.supplier_id,
       i.discounts,
       i.storage_condition,
       i.safety_stock,
       i.inventory_status,
       i.average_monthly_demand,
       i.last_audit_date,
       i.last_restock_date,
       i.next_restock_date
   FROM {{ source('de_project', 'inventory_data') }} i
)


SELECT * FROM inventory_data