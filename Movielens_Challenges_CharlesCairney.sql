USE movielens;
-- Question 1

SELECT title AS `Movie`, release_date FROM movies
	WHERE release_date > "1982-12-31" AND release_date < "1994-01-01"
    ORDER BY release_date asc
;

-- Question 2

SELECT m.title AS `Movie`, AVG(r.rating) AS `Average Rating` FROM ratings r
	JOIN movies m
		ON r.movie_id = m.id
	GROUP BY r.movie_id
    ORDER BY AVG(r.rating) asc;


-- Question 3

SELECT DISTINCT(m.title) AS Movie FROM movies m
	JOIN genres_movies gm
		ON m.id = gm.movie_id
	JOIN genres g
		ON gm.genre_id = g.id
	JOIN ratings r
		ON m.id = r.movie_id
	JOIN users u
		ON r.user_id = u.id
WHERE u.age = 24 
	AND r.rating = 5 
	AND u.gender = "M"
    AND g.name = "Sci-Fi"
ORDER BY m.title asc;

-- Question 4
-- Stuck On this one
SELECT DISTINCT(m.title), AVG(release_date) as `Popular date` FROM movies m
	WHERE release_date=(
		SELECT COUNT(release_date)
        FROM movies
        );	
    
-- Question 5

SELECT DISTINCT(g.name) AS Genre, COUNT(gm.genre_id) AS Occurrence FROM genres_movies gm
	JOIN genres g
		ON gm.genre_id = g.id
	JOIN movies m
		ON gm.movie_id = m.id
	GROUP BY gm.genre_id
    ORDER BY Occurrence asc;
	