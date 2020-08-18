/*select *
FROM play_store_apps p
INNER JOIN app_store_apps a
ON p.name = a.name;*/

--above query is for testing


/*SELECT p.genres, p.category, ROUND((AVG(p.rating) + AVG(a.rating)) / 2, 2) AS avg_rating
FROM play_store_apps p
INNER JOIN app_store_apps a
ON p.name = a.name
GROUP BY p.genres, p.category
ORDER BY avg_rating DESC;

We can see from this that the highest rated genres of apps across both stores are interactive education apps, books and references apps, brain/board game apps
(think words with friends), strategy and sports games, and family simulation apps.
All of this to say: people love interactive experience apps that make them feel like they're learning or improving.*/