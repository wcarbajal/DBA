

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
select DISTINCT language from countrylanguage order by language asc;

-- Actualizar todos los registros
insert into language (name)
select DISTINCT language from countrylanguage order by language asc;

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
alter table countrylanguage
alter COLUMN languagecode type int4
USING languagecode::integer;


-- Crear el forening key y constraints de no nulo el language_code

-- Revisar lo creado