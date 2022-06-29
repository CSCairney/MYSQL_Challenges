use sakila;
-- Question 1 

SELECT first_name, last_name FROM actor;

-- Question 2

SELECT last_name FROM actor WHERE first_name = "John" AND first_name IS NOT NULL;

-- Question 3

SELECT * FROM actor WHERE last_name = "Neeson";

-- Question 4

SELECT * FROM actor WHERE (actor_id % 10) =0;

-- Question 5

SELECT `description` FROM film WHERE film_id = 100;

-- Question 6

SELECT title FROM film WHERE rating = "R";

-- Question 7

SELECT title FROM film WHERE rating != "R";

-- Question 8

SELECT title, length FROM film ORDER BY length ASC limit 10;

-- Question 9

SELECT title FROM film WHERE length=(
	SELECT max(length)
    FROM film
);

-- Question 10

SELECT title FROM FILM WHERE special_features LIKE "%Deleted Scenes%";

-- Question 11

SELECT last_name, COUNT(last_name) FROM actor
GROUP BY last_name 
HAVING count(*)=1
ORDER BY last_name desc;
    
-- Question 12

SELECT last_name, COUNT(last_name) FROM actor
	GROUP BY last_name
    HAVING count(*)>1
    ORDER BY count(last_name) desc
    ;

-- Question 13

SELECT first_name, last_name, COUNT(fa.actor_id) FROM actor
	JOIN film_actor fa
		ON actor.actor_id = fa.actor_id
	GROUP BY fa.actor_id
    ORDER BY COUNT(fa.actor_id) desc
    LIMIT 1;

-- Question 14

select f.title, DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY) AS due_date
from inventory i
inner join film f ON i.film_id=f.film_id
inner join rental r ON i.inventory_id = r.inventory_id
WHERE f.title = "Academy Dinosaur" AND r.return_date IS NULL;

-- Question 15

SELECT avg(length) FROM film;
    
-- Question 16

SELECT c.name, AVG(f.length) FROM film f
 INNER JOIN film_category fc ON f.film_id = fc.film_id
 INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY fc.category_id ORDER BY AVG(f.length);

-- Question 17

SELECT title FROM film_text WHERE `description` LIKE "%robot%";

-- Question 18

SELECT COUNT(release_year) FROM film WHERE release_year LIKE "%2010%";

-- Question 19

SELECT film.title 
FROM film 
JOIN film_category ON film.film_id=film_category.film_id
WHERE category_id = 11
;

-- Question 20

SELECT first_name, last_name FROM staff WHERE staff_id = 2;

-- Question 21

SELECT title FROM film f
	JOIN film_actor
		ON  f.film_id = film_actor.film_id
	JOIN actor
		ON film_actor.actor_id = actor.actor_id
WHERE first_name="Fred" AND last_name="Costner";

-- Question 22

SELECT count(DISTINCT(country)) AS `Distinct Countries` FROM country;

-- Question 23

SELECT `name` FROM `language` ORDER BY `name` desc; 

-- Question 24

SELECT first_name, last_name 
FROM actor
WHERE last_name LIKE "%son"
    ORDER BY first_name asc;
    
-- Question 25

SELECT `name` AS Category, COUNT(fc.category_id) AS Amount FROM category
	JOIN film_category fc
		ON category.category_id = fc.category_id
	GROUP BY category.category_id
    ORDER BY COUNT(category_id) desc
    LIMIT 1;
	