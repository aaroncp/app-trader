SELECT *
FROM app_store_apps;


SELECT *
FROM play_store_apps;


SELECT a.name, p.name, a.content_rating, p.content_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name;


SELECT DISTINCT content_rating
FROM app_store_apps


SELECT COUNT(content_rating) AS over_4
FROM app_store_apps
WHERE content_rating = '4+'


SELECT COUNT(content_rating) AS over_9
FROM app_store_apps
WHERE content_rating = '9+'


SELECT COUNT(content_rating) AS over_12
FROM app_store_apps
WHERE content_rating = '12+'


SELECT COUNT(content_rating) AS over_17
FROM app_store_apps
WHERE content_rating = '17+'


SELECT DISTINCT content_rating
FROM play_store_apps


SELECT COUNT(content_rating) AS everyone
FROM play_store_apps
WHERE content_rating = 'Everyone'


SELECT COUNT(content_rating) AS over_10
FROM play_store_apps
WHERE content_rating = 'Everyone 10+'


SELECT COUNT(content_rating) AS teen
FROM play_store_apps
WHERE content_rating = 'Teen'


SELECT COUNT(content_rating) AS Mature_over_17
FROM play_store_apps
WHERE content_rating = 'Mature 17+'


SELECT COUNT(content_rating) AS adults_only
FROM play_store_apps
WHERE content_rating = 'Adults only 18+'


SELECT COUNT(content_rating) AS no_rating
FROM play_store_apps
WHERE content_rating = 'Unrated'

-- Trying something new

SELECT
	(SELECT COUNT(content_rating)
	FROM app_store_apps
	WHERE content_rating = '4+')AS appover4_playeveryone,
	(SELECT COUNT(content_rating) 
	FROM app_store_apps
	WHERE content_rating = '9+')AS appover9_playover10,
	(SELECT COUNT(content_rating) 
	FROM app_store_apps
	WHERE content_rating = '12+')AS appover12_playteen,
	(SELECT COUNT(content_rating) 
	FROM app_store_apps
	WHERE content_rating = '17+') AS appover17_playmature17
FROM app_store_apps
UNION
SELECT
	(SELECT COUNT(content_rating)
	FROM play_store_apps
	WHERE content_rating = 'Everyone') AS appover4_playeveryone,
	(SELECT COUNT(content_rating) 
	FROM play_store_apps
	WHERE content_rating = 'Everyone 10+') AS appover9_playover10,
	(SELECT COUNT(content_rating) 
	FROM play_store_apps
	WHERE content_rating = 'Teen') AS appover12_playteen,
	(SELECT COUNT(content_rating) 
	FROM play_store_apps
	WHERE content_rating = 'Mature 17+') AS appover17_playmature17
FROM play_store_apps

-- app store
SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM app_store_apps
WHERE content_rating = '4+'

SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM app_store_apps
WHERE content_rating = '9+'

SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM app_store_apps
WHERE content_rating = '12+'

SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM app_store_apps
WHERE content_rating = '17+'

-- play store
SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM play_store_apps
WHERE content_rating = 'Everyone'

SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM play_store_apps
WHERE content_rating = 'Everyone 10+'

SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM play_store_apps
WHERE content_rating = 'Teen'

SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM play_store_apps
WHERE content_rating = 'Mature 17+'

-- There are only 3 total apps with the below rating. Can basically throw it out.
SELECT ROUND(ROUND(AVG(rating)/5,1)*5, 1)
FROM play_store_apps
WHERE content_rating = 'Adults only 18+'

--Aaron's
select distinct(a.name), round(((a.rating + p.rating)/2),2) as avg_rating, a.primary_genre as Aprimary_genre, 
p.genres as Pgenre, p.category as Pcategory, a.content_rating as Acontent_rating, p.content_rating as Pcontent_rating,
a.review_count as Areview_count, p.review_count as Preview_count, p.install_count as Pinstall_count,
a.price as Aprice, p.price as Pprice
from
play_store_apps p
inner join app_store_apps a
on p.name = a.name
where (cast(replace(p.price,'$','') as decimal(5,2))) < 1.01
and a.price < 1.01
order by avg_rating desc

--Trying something else new
SELECT
(SELECT (ROUND(AVG(rating),2))
FROM app_store_apps
WHERE content_rating = '4+') AS app_over4,

(SELECT (ROUND(AVG(rating),2))
FROM app_store_apps
WHERE content_rating = '9+') AS app_over9,

(SELECT (ROUND(AVG(rating),2))
FROM app_store_apps
WHERE content_rating = '12+') AS app_over12,

(SELECT (ROUND(AVG(rating),2))
FROM app_store_apps
WHERE content_rating = '17+') AS app_over17
FROM app_store_apps
LIMIT 1

-- play store
SELECT
(SELECT (ROUND(AVG(rating),2))
FROM play_store_apps
WHERE content_rating = 'Everyone') AS play_everyone,

(SELECT (ROUND(AVG(rating),2))
FROM play_store_apps
WHERE content_rating = 'Everyone 10+') AS play_everyone10,

(SELECT (ROUND(AVG(rating),2))
FROM play_store_apps
WHERE content_rating = 'Teen') AS play_teen,

(SELECT (ROUND(AVG(rating),2))
FROM play_store_apps
WHERE content_rating = 'Mature 17+') AS play_mature
FROM play_store_apps
LIMIT 1

-- Basically the highest average of ratings by content rating is 9+ in app and Everyone10+ in play. Essentially the same age range.

--More from Aaron
select a.name, round((((a.rating + p.rating)/2)/.5),0)*.5 as avg_rating, a.primary_genre as A_primary_genre, 
p.genres as P_genre, p.category as P_category, a.content_rating as A_content_rating, p.content_rating as P_content_rating,
a.review_count as A_review_count, p.review_count as P_review_count, p.install_count as P_install_count,
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
order by avg_rating desc
-- Sidenote for myself, I want to learn more of sql so I could get to the point of writing a query like this one.