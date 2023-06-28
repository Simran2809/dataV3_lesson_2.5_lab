-- Lab | SQL Queries - Lesson 2.5

USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor WHERE first_name = 'SCARLETT';

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT count(*) AS num_copies_available FROM inventory;
SELECT COUNT(DISTINCT film_id) AS num_unique_titles FROM inventory;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT
  FLOOR(AVG(length) / 60) AS avg_hours,
  AVG(length) % 60 AS avg_minutes
FROM film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS num_distinct_last_names FROM actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days FROM rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date) AS month, DAYNAME(rental_date) AS weekday
FROM rental LIMIT 20;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
CASE WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' 
ELSE 'workday' END AS day_type
FROM rental
LIMIT 20;

-- 9. Get release years.
SELECT DISTINCT YEAR(release_year) AS release_year FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM film WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;


-- 13. How many films include Behind the Scenes content?
SELECT COUNT(*) AS num_films_with_behind_the_scenes
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
