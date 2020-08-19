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

select a.name, round((((a.rating + p.rating)/2)/.5),0)*.5 as avg_rating, a.primary_genre as A_primary_genre, 
p.genres as P_genre, p.category as P_category, a.content_rating as A_content_rating, p.content_rating as P_content_rating,
cast(a.review_count as integer) as A_review_count, p.review_count as P_review_count, p.install_count as P_install_count,
a.price as A_price, p.price as P_price
from
	(select distinct(name) as name, max(category) as category, max(rating) as rating, max(review_count) as review_count,
	 max(install_count) as install_count,max(price) as price,max(content_rating) as content_rating,max(genres) as genres
	from play_store_apps
	group by name) as p
inner join 
	(select distinct(name) as name, max(price) as price, max(review_count) as review_count, max(rating) as rating, 
	 max(content_rating) as content_rating, max(primary_genre) as primary_genre
	from app_store_apps
	group by name) as a
on p.name = a.name
where (cast(replace(p.price,'$','') as decimal(5,2))) < 1.01
and a.price < 1.01
and round((((a.rating + p.rating)/2)/.5),0)*.5 = 4.5
order by avg_rating desc, a_review_count desc