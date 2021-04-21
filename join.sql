-- The JOIN operation

-- 1. 
SELECT matchid, player FROM goal 
  WHERE teamid = 'Ger'

-- 2. 
SELECT id,stadium,team1,team2
  FROM game JOIN goal
    ON (game.id = goal.matchid)
  WHERE game.id = 1012 LIMIT 1

-- 3. 
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER'

-- 4. 
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%'

-- 5. 
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam
    ON(goal.teamid = eteam.id) 
 WHERE gtime<=10

-- 6. 
SELECT mdate, teamname
  FROM game JOIN eteam
   ON (game.team1 = eteam.id)
  WHERE eteam.coach = 'Fernando Santos';

-- 7. 
SELECT player
  FROM game JOIN goal
    ON (game.id = goal.matchid)
  WHERE game.stadium = 'National Stadium, Warsaw';

-- 8. 
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE 'GER' IN (team1, team2) AND teamid <> 'GER';

-- 9. 
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;

-- 10. 
SELECT stadium, COUNT(player)
  FROM game JOIN goal ON matchid=id
 GROUP BY stadium;

-- 11. 
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE 'POL' IN (team1, team2)
  GROUP BY matchid, mdate;

-- 12. 
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE teamid  = 'GER'
  GROUP BY matchid, mdate;

-- 13. 
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2