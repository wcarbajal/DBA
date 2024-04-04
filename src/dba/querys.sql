SELECT * FROM country;

CREATE UNIQUE index "unique_country_name" on country(
    name
);


CREATE index "country_continent" on country(
    continent
);

SELECT * from city;

CREATE UNIQUE INDEX "unique_name_countrycode_district" on city(
    name, countrycode, district
);

drop table country;

INSERT INTO country_bk
select * from country;

alter table country
DROP CONSTRAINT country_continent_check;


select 
(select code from continent B where B.name = A.continent)	
from country A;

UPDATE country A
set continent = (select "code" from continent B where B.name = A.continent)	;
select * from country;

alter table country
alter COLUMN continent type int4
USING continent::integer;


SELECT count(*), language from countrylanguage
group by language;

select DISTINCT language from countrylanguage order by language asc;

insert into language (name)
select DISTINCT language from countrylanguage order by language asc;

alter table countrylanguage
alter COLUMN languagecode type int4
USING languagecode::integer;


UPDATE countrylanguage A
set languagecode = (select code from language B where B.name = A.language)	;
select * from countrylanguage;

select country.name, continent.name from country 
INNER join continent on country.continent = continent.code 
order by country.name asc;


select * from continent;


alter SEQUENCE continent_code_seq restart WITH 9;

select country.name as pais, country.continent as codigoContinente, continent.name as continente from country 
RIGHT join continent on country.continent = continent.code 
where country.continent is NULL;
order by country.name asc;

-- Numero de Paises por continentes 
SELECT COUNT(*) as paises, continent."name" as Continente FROM country
INNER JOIN continent on country.continent = continent.code
GROUP BY Continente 
--order by count asc;
UNION
SELECT 0 as paises, continent."name" as Continente FROM country
RIGHT JOIN continent on country.continent = continent.code
WHERE country.continent is NULL
GROUP BY continent."name" 
order by Continente asc;



select count (*) as Total from city 
INNER join country on country.code = city.countrycode
GROUP BY country.code
order by count(*) desc);

select * from city where countrycode = 'BRA';


select DISTINCT a.languagecode, d."name" as Lenguaje, c.name as continente from countrylanguage a
inner join country b on a.countrycode = b.code
inner join continent c on b.continent  = c.code
inner join language d on a.languagecode = d.code
where a.isofficial = true;