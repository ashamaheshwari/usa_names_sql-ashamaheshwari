/*
SELECT *
FROM names
LIMIT 5;
*/

--1. How many rows are in the names table?
/*
SELECT COUNT(*) AS count_rows
FROM names;
*/
-- The name table contains 1957046 rows


--2. How many total registered people appear in the dataset?
/*
SELECT SUM(num_registered) AS total_registered
FROM names;
*/
--Total registered people in dataset: 351653025


--3. Which name had the most appearances in a single year in the dataset?
/*
SELECT name, year, MAX(num_registered) AS max_registered
FROM names
GROUP BY name, year
ORDER BY max_registered DESC
LIMIT 1;
*/
-- Linda is the most appeared name in 1947: 99689 times


--4. What range of years are included?
/*
SELECT DISTINCT(year)
FROM names;
*/
--Data for year 1880 to 2018 is included in table


--5.What year has the largest number of registrations?
/*
SELECT year, SUM(num_registered) AS number_registered
FROM names
GROUP BY year
ORDER BY number_registered DESC
LIMIT 1;
*/
--Year 1957 has the largest number of registrations 


--6. How many different (distinct) names are contained in the dataset?
/*
SELECT COUNT(DISTINCT name) as distinct_name
FROM names;
*/
--There are 98400 distinct names in the dataset


--7 Are there more males or more females registered?
/*
SELECT gender, sum(num_registered) AS gender_registered
FROM names
GROUP BY gender
*/
--There are more males (177573793) registered than females(174079232)


--8. What are the most popular male and female names overall (i.e., the most total registrations)?
/*
SELECT name, SUM(num_registered) as total_registration
FROM names
GROUP BY name
ORDER BY total_registration DESC;
*/
--James is the most popular name among males: 5187679
--Mary is the most popular name among females: 4140840


--9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
/*
SELECT name, SUM(num_registered) AS number_registered
FROM names
WHERE year >= 2000 AND year <= 2009
GROUP BY name
ORDER BY number_registered DESC;
*/
--Jacob is the most popular boy name of the first decade of the 2000s: 274367
--Emily is the most popular girl name of the first decade of the 2000s: 224082

--10. Which year had the most variety in names (i.e. had the most distinct names)?
/*
SELECT year, COUNT(DISTINCT name) AS most_names
FROM names
GROUP BY year
ORDER BY most_names DESC
LIMIT 1;
*/
-- Year 2008 had the most variety in names: 32518


--11. What is the most popular name for a girl that starts with the letter X?
/*
SELECT name, SUM(num_registered) as total_registered
FROM names
WHERE gender = 'F' AND name LIKE 'X%'
GROUP BY name
ORDER BY total_registered DESC
LIMIT 1;
*/
--There is no name for a girl that starts with the letter X in table


--12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
/*
SELECT COUNT(DISTINCT name) AS count_distinct_name
FROM names
WHERE name LIKE 'Q%' AND name NOT LIKE '_u%'
*/
--There are 46 distinct names appear that start with a 'Q', but whose second letter is not 'u'


--13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
/*
SELECT name, SUM(num_registered) AS total_registered
FROM names
WHERE name = 'Stephen' OR name = 'Steven'
GROUP BY name;
*/
--Steven is more popular spelling registered 1286951 times than Stephen, registered 860972 times.

--14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
/*
SELECT ROUND(sum(unisex_names) * 100.0 /count(*), 2)
FROM (
SELECT name, CASE WHEN COUNT(DISTINCT(gender)) > 1  THEN 1
END AS unisex_names
FROM names
GROUP BY name) as sub1
*/

--15. How many names have made an appearance in every single year since 1880?
/* 
year, COUNT(name) as count_name
FROM names
WHERE name in 
GROUP by year
*/
--16. How many names have only appeared in one year?

--17. How many names only appeared in the 1950s?

--18. How many names made their first appearance in the 2010s?

--19. Find the names that have not be used in the longest.

--20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
