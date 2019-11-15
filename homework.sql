----- NORMAL MODE -----
-- Question 1
SELECT id, title, genres
FROM movies.movies;

-- Question 2
SELECT title, id
FROM movies.movies
LIMIT 10;

-- Question 3
SELECT title
FROM movies.movies
WHERE id = 485;

-- QUESTION 4
SELECT id
FROM movies.movies
WHERE title LIKE "%Made in America%";

-- QUESTION 5
SELECT title
FROM movies.movies
ORDER BY IF(title RLIKE '^[a-z]', 1, 2), title
LIMIT 10;

-- QUESTION 6
SELECT title
FROM movies.movies
WHERE title LIKE "%(2002)%";

-- QUESTION 7
SELECT title
FROM movies.movies
WHERE title LIKE "%Godfather%"
LIMIT 1;

-- QUESTION 8
SELECT title, genres
FROM movies.movies
WHERE genres = "comedy";

-- QUESTION 9
SELECT title, genres
FROM movies.movies
WHERE genres LIKE "%comedy%" AND title LIKE "%(2000)%";

-- QUESTION 10
SELECT title, genres
FROM movies.movies
WHERE genres LIKE "%comedy%" AND title LIKE "%death%";

-- QUESTION 11
SELECT title
FROM movies.movies
WHERE title LIKE "%super%" AND title LIKE "%(2001)%" OR "%(2002)%";

-- QUESTION 12
-- made table with foreign key --

-- QUESTION 13
INSERT INTO actors (name, character_name, movie_id, date_of_birth)
VALUES
("Tom Hanks", "Woody", 1, "1956-07-09"),
("Tim Allen", "Buzz", 2, "1960-10-29"),
("Don Rickles", "Mr. Potato Head", 3, "1950-02-23"),
("Annie Potts", "Little Bo-Peep", 4, "1970-05-18"),
("Wallace Shawn", "Rex", 5, "1956-09-10"),
("John Ratzenberger", "Hamm", 6, "1956-03-30"),
("Laurie Metcalf", "Mom", 7, "1973-04-20"),
("Andrew Stanton", "Commercial Guy", 8, "1979-10-15"),
("Jim Varney", "Slinky Dog", 9, "1981-12-31"),
("John Morris", "Andy", 10, "1989-11-02");

-- QUESTION 14
ALTER TABLE movies
ADD MPAA_rating varchar(100) not null;

SET SQL_SAFE_UPDATES = 0;
UPDATE movies.movies
SET MPAA_rating = "3.0"
WHERE id = 3 OR id = 4 OR id = 5 OR id = 6 OR id = 7;

----- WITH JOINS -----
-- QUESTION 1
SELECT title, rating
FROM movies
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather%";

-- QUESTION 2
SELECT title, rating
FROM movies
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather%"
ORDER BY movies.title DESC;

-- QUESTION 3
SELECT title, imdb_Id 
FROM movies m
LEFT JOIN links  ON links.movie_id = m.id
WHERE title LIKE "%(2005)%" AND genres LIKE "%Comedy%";

-- QUESTION 4
SELECT title, rating
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE rating = null

----- COMPLETE THE FOLLOWING AGGREGATION OBJECTIVES -----
-- QUESTION 1
SELECT AVG(rating)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 339;

-- QUESTION 2
SELECT COUNT(rating)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 339

-- QUESTION 3
SELECT COUNT(title)
FROM movies m
WHERE genres LIKE "%Comedy%"

-- QUESTION 4
SELECT AVG(rating)
FROM movies m
LEFT JOIN ratings r ON r.user_id = m.id
WHERE m.id = 4

-- QUESTION 5
SELECT MAX(rating)
FROM movies m
LEFT JOIN ratings r ON r.user_id = m.id

-- QUESTION 6
SELECT AVG(rating) h , user_id
FROM ratings
GROUP BY user_id
ORDER BY h DESC 
LIMIT 1

-- QUESTION 7
SELECT AVG(rating) h , user_id , COUNT(rating) r
FROM ratings
GROUP BY user_id
HAVING r > 50
ORDER BY h DESC 
LIMIT 1

-- QUESTION 8
SELECT AVG(rating) h , title
FROM ratings
GROUP BY title
HAVING r > 4.0
ORDER BY h DESC