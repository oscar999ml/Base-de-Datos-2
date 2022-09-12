create database diagnostico;

use diagnostico;

create table estudiantes
(
    id_estudinte integer Primary Key,
    nombre varchar(20),
    apellido varchar(25),
    edad varchar (25),
    ci integer
);

insert  into estudiantes (id_estudinte, nombre,apellido,edad,ci) values
(1, 'Aracely', 'Mendoza', 18, 14125434),
    (2, 'Mguel', 'Velasco', 24, 45721854),
(3, 'Micaela', 'Sarzo' , 24, 455154);


select * from estudiantes;

create database  universidad;

use universidad;

CREATE TABLE estudiantes
(
  id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nombres VARCHAR(100),
  apellidos VARCHAR(100),
  edad INTEGER,
  fono INTEGER,
  email VARCHAR(50)
);

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email)
VALUES ('Aracely', 'Mendoza', 12, 123456, 'Aracely@gmail.com');

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email)
VALUES ('Micaela', 'Canaviri', 15, 123456, 'Micaela@gmail.com');

INSERT INTO estudiantes
(nombres, apellidos, edad, fono, email)
VALUES ('Ilia', 'Sarzo', 19, 123456, 'Ilia@gmail.com');




select *from estudiantes;

 select last_insert_id(); -- te muestra cual es el ultimo id te muestra --

  ALTER table estudiantes add column direccion VARCHAR(50); -- AGREGAR UN NUEVO CAMPO A LA TABLA ESTUDIANTES AUMENTAR UNA FILA MAS --

  ALTER TABLE estudiantes
 ADD COLUMN fax VARCHAR(10) default
 ADD COLUMN sexo VARCHAR(10);

-- Mostrar todos los registros(nombres, apellidos y edad) de los estudiantes en donde la edad sea mayor a 18 años.--

 SELECT  EST.nombres, EST.apellidos, EST.edad
     FROM  estudiantes AS EST
  WHERE EST.edad > 18;

-- MOSTRAR TODOS LOS REGISTROS DONDE CUYO ID DE LOS PARES  O IMPAR --


SELECT  EST.*
    FROM  estudiantes AS EST
WHERE EST.id_est % 2 =1;

-- MANEJO DE PRIMARY KEY Y FORE KEY --


CREATE DATABASE  LIBRERIA;
USE LIBRERIA;

CREATE TABLE  CATEGORIES
(
    ID_CATEGORIES  INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NAME VARCHAR(25)

);




    CREATE TABLE  PUBLISHERS
(
    ID_PUBLISHERS  INTEGER  AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NAME VARCHAR (25)
    );


 CREATE TABLE BOOKS
(
    ID_BOOKS INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TITLE  VARCHAR(25)  ,
    ISBN VARCHAR(25),
    PUBLISHERS_DATE DATE,
    DESCRIPTION VARCHAR(25),
    ID_CATEGORIES INTEGER NOT NULL,
    ID_PUBLISHERS INTEGER NOT NULL,
    FOREIGN KEY ( ID_CATEGORIES) REFERENCES CATEGORIES(ID_CATEGORIES),
    FOREIGN KEY  (ID_PUBLISHERS) REFERENCES CATEGORIES(ID_CATEGORIES)
 );

