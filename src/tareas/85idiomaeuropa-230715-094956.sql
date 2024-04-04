
-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";


select  count(*) as total, d.code, d.name from countrylanguage a
inner join country b on  a.countrycode = b.code
inner join continent c on b.continent = c.code
inner join language d on a.languagecode = d.code
where isofficial = true and c.code in (5)
GROUP by d.code
order by total desc
limit 1;






-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
select  b."name", d.code, d.name from countrylanguage a
inner join country b on  a.countrycode = b.code
inner join continent c on b.continent = c.code
inner join language d on a.languagecode = d.code
where isofficial = true and c.code in (5) and languagecode in (135);






