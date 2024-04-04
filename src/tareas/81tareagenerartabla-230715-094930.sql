

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

SELECT count(*) as total, 'America' as Contienente from country
INNER JOIN continent ON country.continent = continent.code
WHERE continent.name LIKE '%America'
union
SELECT count(*) as total, continent.name as Continente from country
inner JOIN continent ON country.continent = continent.code and continent.code IN (1,2,3,5,7)
GROUP BY continent.name
ORDER BY total asc;


select * from continent;


