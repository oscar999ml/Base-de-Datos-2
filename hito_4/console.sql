create database diagnostico;

use diagnostico;

create table estudent
(
id_estudent integer not null primary key,
nombre varchar (20),
apelido varchar (20),
edad integer
);

insert into estudent (id_estudent, nombre, apelido, edad)
values (1,'kevin','mamani',22);
insert into estudent (id_estudent, nombre, apelido, edad)
values (2,'joel','condori',21);

select * from estudent;

drop database if exists williams;
drop table estudent;

create database universidad;
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
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email) VALUES ('nombre1', 'apellidos1', 12, 123456, 'nombre1@gmail.com');

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email) VALUES ('nombre2', 'apellidos2', 15, 123456, 'nombre2@gmail.com');

INSERT INTO estudiantes
(nombres, apellidos, edad, fono, email) VALUES ('nombre3', 'apellidos3', 19, 123456, 'nombre3@gmail.com');

select* from estudiantes;
select est.*
    from estudiantes as est;

select last_insert_id();
#
alter table estudiantes add column dirreccion varchar (100);

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email)
VALUES ('nombre4', 'apellidos4', 12, 123456, 'nombre1@gmail.com'),
('nombre5', 'apellidos5', 12, 123456, 'nombre1@gmail.com'),
('nombre6', 'apellidos6', 12, 123456, 'nombre1@gmail.com'),
('nombre7', 'apellidos7', 12, 123456, 'nombre1@gmail.com'),
('nombre8', 'apellidos8', 12, 123456, 'nombre1@gmail.com'),
('nombre9', 'apellidos9', 12, 123456, 'nombre1@gmail.com'),
('nombre10', 'apellidos10', 12, 123456, 'nombre1@gmail.com');

select est.nombres,est.apellidos,est.edad
    from estudiantes as est
where est.edad > 18;

select est.nombres,est.edad,est.apellidos
from estudiantes as est
where est.id_est % 2= 0;
####################
CREATE TABLE materias
(
 id_mat INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
 nombre_mat VARCHAR(100),
 cod_mat VARCHAR(100)
);
CREATE TABLE inscripcion
(
  id_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_est INT NOT NULL,
  id_mat INT NOT NULL,
  FOREIGN KEY (id_est) REFERENCES estudiantes (id_est),
  FOREIGN KEY (id_mat) REFERENCES materias (id_mat)
);

create table books
(
    books_id integer primary key not null ,
title varchar(20),
isdn varchar(20),
published_date date,
descripcion varchar(20),
category_id integer,
publisher_id integer,
foreign key (category_id)references categories(category_id),
foreign key (publisher_id)references publishers(publisher_id)
);
drop table publishers;
create table categories
(
    category_id integer primary key ,
name varchar(20)
);
create table publishers
(
    publisher_id integer primary key ,
    name varchar (20)
);

create database hito_3;
