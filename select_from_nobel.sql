-- SELECT from Nobel Tutorial

-- 1. Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2. 1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3. Albert Einstein
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

-- 4. Recent Peace Prizes
SELECT winner
  FROM nobel
  WHERE subject = 'Peace' and yr >= 2000;

-- 5. Literature in the 1980's
SELECT *
  FROM nobel
  WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Only Presidents
SELECT *
  FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

-- 7. John
SELECT winner
  FROM nobel
  WHERE winner LIKE 'John%';

-- 8. Chemistry and Physics from different years
SELECT *
  FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Exclude Chemists and Medics
SELECT *
  FROM nobel
  WHERE yr = 1980 AND NOT subject = 'Chemistry' AND NOT subject = 'Medicine';

-- 10. Early Medicine, Late Literature
SELECT *
  FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- 11. Umlaut
SELECT *
  FROM nobel
  WHERE winner LIKE 'PETER G%';

-- 12. Apostrophe
SELECT *
  FROM nobel
  WHERE winner = 'EUGENE O''NEILL';

-- 13. Knights of the realm
SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;

-- 14. Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner ASC;
