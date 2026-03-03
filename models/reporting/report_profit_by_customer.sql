select
customerid,
customername,
segment,
country,
sum(orderprofit) as profitpercustomer
from {{ ref('stg_orders') }}
group by
customerid,
customername,
segment,
country