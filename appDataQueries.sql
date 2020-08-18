SELECT FLOOR(a.price/1), round(avg(a.rating),2)
FROM app_store_apps a
GROUP BY FLOOR(a.price/1)
order by FLOOR(a.price/1) desc

SELECT FLOOR(cast(replace(p.price,'$','') as decimal(5,2))/1), round(avg(p.rating),2)
FROM play_store_apps p
GROUP BY FLOOR(cast(replace(p.price,'$','') as decimal(5,2))/1)
order by FLOOR(cast(replace(p.price,'$','') as decimal(5,2))/1) desc

select p.price as price, round(avg(cast(replace(replace(p.install_count,'+',''),',','') as integer)),2) as install_count
from play_store_apps p
group by price

select a.price as price, round(avg(cast(a.review_count as decimal(10,2))),2) as review_count
from app_store_apps a
group by price
order by price