USE sakila;

-- 1. List all actors.
SELECT * FROM actor;

-- 2. Find the surname of the actor with the forename 'John'.
SELECT * FROM actor WHERE first_name= "John";

-- 3. Find all actors with surname 'Neeson'.
SELECT * FROM actor WHERE last_name= "Neeson";

-- 4. Find all actors with ID numbers divisible by 10.
SELECT * FROM actor WHERE actor_id%10 = 0;

-- 5. What is the description of the movie with an ID of 100?
SELECT * FROM film WHERE film_id = 100;

-- 6. Find every R-rated movie.
SELECT * FROM film WHERE rating = "R";

-- 7. Find every non-R-rated movie.
SELECT * FROM film WHERE rating != "R";

-- 8. Find the ten shortest movies.
SELECT * FROM film order by length asc limit 10;

-- 9. Find the movies with the longest runtime, without using LIMIT.
SELECT * FROM film order by length desc;

-- 10. Find all movies that have deleted scenes.
SELECT * FROM film WHERE special_features LIKE '%Deleted Scenes%';

-- 11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT DISTINCT last_name FROM actor HAVING last_name IS NOT NULL ORDER by last_name desc; 

-- 12. Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, count(*) FROM actor GROUP BY last_name HAVING count(*)>=2 ORDER BY count(*) DESC;

-- 13. Which actor has appeared in the most films?
SELECT actor_id, COUNT(actor_id) film_count FROM film_actor GROUP BY actor_id HAVING film_count > 1 ORDER BY film_count DESC;
SELECT * FROM actor WHERE actor_id = 107;

-- 14. When is 'Academy Dinosaur' due?

SELECT f.title, i.film_id, r.inventory_id, r.return_date FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE f.title = 'Academy Dinosaur';


-- 15. What is the average runtime of all films?
SELECT AVG(length) FROM film;

-- 16. List the average runtime for every film category.

SELECT fc.category_id, AVG(length) FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- 17. List all movies featuring a robot.
select * from film_text where `description` = 'robot';

-- 18. How many movies were released in 2010?
select * from film where release_year= 2010;

-- 19. Find the titles of all the horror movies.

SELECT f.title, ca.`name` FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category ca ON fc.category_id = ca.category_id
WHERE ca.`name` = 'Horror';

-- 20. List the full name of the staff member with the ID of 2.
SELECT first_name, last_name FROM staff WHERE staff_id= 2;

-- 21. List all the movies that Fred Costner has appeared in.

SELECT film.title FROM film  
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE first_name= "Fred" AND last_name= "Costner";

-- 22. How many distinct countries are there?
select count(distinct country) from country;

-- 23. List the name of every language in reverse-alphabetical order.
SELECT name From language Order By name desc;

-- 24. List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER by first_name asc;

-- 25. Which category contains the most films?

SELECT ca.`name`, COUNT(*) film_count FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category ca ON fc.category_id = ca.category_id
GROUP BY ca.`name`
HAVING film_count > 0
ORDER BY film_count DESC LIMIT 1;