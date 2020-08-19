select name,review_count, rating
from app_store_apps
order by rating desc
limit 10
--
select name,max(review_count) as highest_reviews, rating
from app_store_apps
group by name,rating
--
select avg(review_count), name, rating
from app_store_apps
where rating = 5
---
select name,review_count, rating
from play_store_apps
where rating = 5 
order by rating 
limit 10
--
select name,review_count, rating
from play_store_apps
where rating = 5 and review_count >=100
order by rating 
--
select name,review_count,cast(replace(replace(install_count,'+',''),',','') as integer), rating
from play_store_apps
where rating = 5 
order by rating 

cast(replace(replace(p.install_count,'+',''),',','') as integer)
--
select name,review_count,cast(replace(replace(install_count,'+',''),',','') as integer), rating
from play_store_apps
where rating = 5 
order by replace desc
limit 10
----
select name,round(avg(review_count),2) as avg_rc, rating
from play_store_apps
where rating IS NOT NULL 
group by rating, name
order by rating desc
----
select name,round(avg(review_count),2) as avg_rc, rating
from play_store_apps
where rating IS NOT NULL 
group by rating, name
order by rating desc
---
select name,cast(replace(replace(install_count,'+',''),',','') as integer), rating
from play_store_apps
group by rating, name
order by rating desc
----
select name,cast(review_count as int), rating
from app_store_apps
where (select round(avg(review_count),2) as avg_rc 
from app_store_apps)
group by rating, name
order by rating desc
