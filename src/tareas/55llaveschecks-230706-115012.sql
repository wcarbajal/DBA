
select * FROM city;


-- 1. Crear una llave primaria en city (id)
ALTER Table city ADD PRIMARY KEY (id);


-- 2. Crear un check en population, para que no soporte negativos

ALTER Table city ADD CHECK (
    population >= 0
);


-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
ALTER Table countrylanguage ADD PRIMARY KEY (countrycode, language);


-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100


ALTER Table countrylanguage ADD CHECK (
    percentage >= 0 and percentage <= 100
);