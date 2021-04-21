-- SUM and COUNT

-- 1. Total world population
SELECT SUM(population) FROM world

-- 2. List of continents
SELECT DISTINCT Continent FROM world;

-- 3. GDP of Africa
SELECT SUM(gdp) AS African_gdp FROM world where continent = 'Africa'

-- 4. Count the big countries
SELECT count(name) from world WHERE Area >= 1000000 

-- 5. Baltic states population
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6. Counting the countries of each continent
SELECT continent, COUNT(name) FROM world GROUP BY continent

-- 7. Counting big countries in each continent
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent

-- 8. Counting big continents
SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000