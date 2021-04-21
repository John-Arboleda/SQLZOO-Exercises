-- More JOIN operations

-- 1. 1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2. When was Citizen Kane released?
SELECT yr FROM movie WHERE title = 'Citizen Kane'

-- 3. Star Trek movies
SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr

-- 4. id for actor Glenn Close
SELECT id FROM actor WHERE name = 'Glenn Close';

-- 5. id for Casablanca
SELECT id FROM movie WHERE title = 'Casablanca';

-- 6. Cast list for Casablanca
SELECT name FROM actor JOIN casting ON id = actorid WHERE  movieid = 11768;

-- 7. Alien cast list
SELECT name FROM casting
JOIN actor ON actor.id = actorid
JOIN movie ON  movieid = movie.id WHERE title = 'Alien';

-- 8. Harrison Ford movies
SELECT title FROM casting
  JOIN actor ON actor.id = actorid
  JOIN movie ON  movieid = movie.id
    WHERE name = 'Harrison Ford';

-- 9. Harrison Ford as a supporting actor
SELECT title FROM casting
  JOIN actor ON actor.id = actorid
  JOIN movie ON  movieid = movie.id
    WHERE name = 'Harrison Ford' AND ord <> 1;

-- 10. Lead actors in 1962 movies
SELECT title, name FROM casting
JOIN actor ON actor.id = actorid
JOIN movie ON  movieid = movie.id WHERE yr = 1962 AND ord = 1;

-- 11. Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM movie
  JOIN casting ON movie.id=movieid
  JOIN actor   ON actorid=actor.id
    WHERE name='Rock Hudson'
      GROUP BY yr HAVING COUNT(title) > 2

-- 12. Lead actor in Julie Andrews movies
SELECT title, name FROM casting
  JOIN actor ON (actor.id = actorid)
  JOIN movie ON (movie.id = movieid)
    WHERE movieid IN (SELECT movieid FROM casting
      WHERE actorid = 179) AND casting.ord = 1
       ORDER BY title; -- toughest challenge

-- 13. Actors with 15 leading roles
SELECT name staring from casting
  JOIN actor ON (actor.id = actorid AND casting.ord = 1)
  JOIN movie ON (movie.id = movieid)
    GROUP BY name HAVING COUNT(ord) >= 15
      ORDER BY name
     
-- 14. 
SELECT title, COUNT(actorid) FROM casting
  JOIN actor ON (actor.id = actorid)
  JOIN movie ON (movie.id = movieid)
    WHERE yr = 1978
     GROUP BY title
       ORDER BY COUNT(actorid) DESC, title ASC