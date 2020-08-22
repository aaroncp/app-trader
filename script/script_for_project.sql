/*SELECT DISTINCT genre_clean, ROUND(AVG(avg_rating),2) AS total_avg_rating
FROM
	(SELECT DISTINCT REPLACE(REPLACE(TRIM(UPPER(primary_genre)),' ','_'),'&','AND') AS genre_clean, ROUND(AVG(rating),2) AS avg_rating		FROM app_store_apps
	WHERE price <= '1.00' AND rating IS NOT NULL
	GROUP BY primary_genre
	UNION
	SELECT DISTINCT category, ROUND(AVG(rating),2)
	FROM play_store_apps
	WHERE price <= '1.00' AND rating IS NOT NULL
	GROUP BY category) AS subq
GROUP BY genre_clean
ORDER BY ROUND(AVG(avg_rating),2) DESC
LIMIT 10;*/

--The above query brings together the primary_genre and category columns and gives their averages across stores.

SELECT DISTINCT genres, ROUND(AVG(rating),2)
FROM play_store_apps
WHERE price <= '1.00' AND rating IS NOT NULL
GROUP BY genres
ORDER BY ROUND(AVG(rating),2) DESC;

--The above query shows the genres with the top 10 average ratings from the google play store.