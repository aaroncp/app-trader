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

SELECT COUNT(content_rating)
FROM app_store_apps
WHERE content_rating = '17+'

SELECT COUNT(content_rating)
FROM app_store_apps
WHERE content_rating = '12+'

SELECT COUNT(content_rating)
FROM app_store_apps
WHERE content_rating = '9+'

SELECT COUNT(content_rating)
FROM app_store_apps
WHERE content_rating = '4+'

SELECT DISTINCT content_rating
FROM play_store_apps

SELECT COUNT(content_rating)
FROM play_store_apps
WHERE content_rating = 'Unrated'

SELECT COUNT(content_rating)
FROM play_store_apps
WHERE content_rating = 'Everyone'

SELECT COUNT(content_rating)
FROM play_store_apps
WHERE content_rating = 'Everyone 10+'

SELECT COUNT(content_rating)
FROM play_store_apps
WHERE content_rating = 'Teen'

SELECT COUNT(content_rating)
FROM play_store_apps
WHERE content_rating = 'Mature 17+'

SELECT COUNT(content_rating)
FROM play_store_apps
WHERE content_rating = 'Adults only 18+'