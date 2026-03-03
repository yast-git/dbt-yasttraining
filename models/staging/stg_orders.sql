SELECT 
--from orders
o.orderid,
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE,
o.ORDERSELLINGPRICE,
o.ORDERCOSTPRICE,
(ORDERSELLINGPRICE -  ORDERCOSTPRICE) AS ORDERPROFIT,
--from customer
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
-- from product
p.CATEGORY,
p.PRODUCTNAME,
p.SUBCATEGORY
FROM {{ ref('raw_orders') }} as o
LEFT JOIN {{ ref('raw_customer') }} as c
ON o.CUSTOMERID = c.CUSTOMERID
LEFT JOIN {{ ref('raw_product') }} as p
ON o.PRODUCTID = p.PRODUCTID