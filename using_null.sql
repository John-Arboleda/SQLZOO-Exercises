-- Using Null

-- 1. NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
SELECT name FROM teacher WHERE dept IS NULL

-- 2. 
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id) 

-- 3. 
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- 4. 
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- 5. Using the COALESCE function
select teacher.name, coalesce(mobile, '07986 444 2266') from teacher

-- 6. 
select teacher.name, coalesce(dept.name, 'None') from teacher left join dept on (teacher.dept = dept.id)


-- 7. 
select count(teacher.id), count(mobile) from teacher

-- 8. 
select dept.name, count(teacher.dept) from teacher right join dept on (teacher.dept = dept.id) group by dept.name

-- 9. Using CASE
SELECT teacher.name,
CASE
WHEN teacher.dept IN (1,2)
  THEN 'Sci'
  ELSE 'Art'
END AS dept FROM teacher

-- 10. 
SELECT teacher.name,
CASE
WHEN teacher.dept IN (1,2) THEN 'Sci'
WHEN teacher.dept IN (3) THEN 'Art'
ELSE 'None'
END AS dept FROM teacher