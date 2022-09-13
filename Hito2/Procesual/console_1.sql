
# Manejo de conceptos.
# 1. ¿A que se refiere cuando se habla de bases de datos relacionales?
# Oracle MySQL Mariadb MicrosoftSQL PostgreSQL

# 2. ¿A que se refiere cuando se habla de bases de datos no relacionales?
# Mongodb ApacheSolr Cassandra Couchdb

# 3. ¿Qué es MySQL y MariaDB?. Explique si existen diferencias o son iguales, etc.
# ambas heramientas para gestionar base de datos son compatibles con SQL ademas de q mariadb es
# de software libre tambien
# es un desendiente binario en reemlplazo de la misma version de MySQL

# 4. ¿Qué son las funciones de agregación?
# avg, count , sum, max ,min ,stddev , variance

# 5. ¿Qué llegaría a ser XAMPP, WAMP SERVER o LAMP?
# sirven para gestionar servicion de apache Mysql,mariadb
# son sistemas alanogos para cada servidor windows, linux , macintosh

# 6. ¿Cual es la diferencia entre las funciones de agresión yfunciones creados por
# el DBA? Es decir funciones creadas por el usuario.

# 7. ¿Para qué sirve el comando USE?

# 8. Que es DML y DDL?
# DDl definincion de datos crear datos, tablas, alterar tablas, elimiar tablas o base de datos.
# DML manupulacion de datos insert, delete, select, update

# 9. ¿Qué cosas características debe de tener una función? Explique sobre el
# nombre, el return, parametros, etc.

# 10.¿Cómo crear,modificar ycómo eliminar una función?


 ## parte practica
 ## 11.
 ## Crear las tablas y 2 registros para cada tabla para el siguiente modelo ER.
 ## ○ Se sugiere crear una base de datos de nombre POLLOS_COPA y en ella crear
 ## las tablas:
 ## ■ cliente
 ## ■ detalle_pedido
 ## ■ pedido
 ## ○ Adjuntar el código SQL generado.
create database POLLOS_COPA;
use POLLOS_COPA;

create  table cliente
(
    id_cliente int auto_increment primary key not null,
    fullname varchar (25) not null ,
    lastname varchar (25) not null ,
    edad int not null ,
    domicilio varchar (50) not null
);

create  table pedido
(
  id_pedido int auto_increment primary key not null ,
  articulo varchar (50),
  fecha varchar (25),
  # costo en que??? doraes, bolivianos? varchar x siacaso
  costo varchar (50)
);
# relacion:

create table detalle_pedido
(
  id_detalle_pedido int auto_increment primary key  not null ,
  id_cliente int,
  id_pedido int,

  foreign key (id_cliente) references cliente(id_cliente),
  foreign key (id_pedido) references pedido(id_pedido)
);

insert into cliente ( fullname, lastname, edad, domicilio)
VALUEs ('kevin oscar','mamani laura',22,'carretera a viacha zona san martin'),
     ( 'jhom michael','mamani laura',17,'carretera a viacha zona san martin');
delete from cliente  where id_cliente= 4;
insert into  pedido( articulo, costo,fecha)
values ('pollo frito',30,'12/septiembre/2022'),
       ('pollo dorado',25,'13/septiembre/2022');
insert into detalle_pedido(id_cliente, id_pedido)
values(2,2)
,(1,2);

## 12.
# Crear una consulta SQL en base al ejercicio anterior.
# ○ Debe de utilizar las 3 tablas creadas anteriormente.
# ○ Para relacionar las tablas utilizar JOINS.
# ○ Adjuntar el código SQL generado.

# mostrar la consulta sql que permita ver el articulo que pidio kevin, el costo, fecha y
# el id del pedido.
 select c.fullname,pe.articulo,pe.costo,datp.id_pedido,pe.fecha
 from pedido as pe
inner join cliente c on pe.id_pedido = c.id_cliente
inner join detalle_pedido datp on pe.id_pedido = datp.id_detalle_pedido
where c.fullname like 'kevin%';




# 13.
# Crear un función que compare dos códigos de materia.
# ○ Recrear la siguiente base de datos:

CREATE DATABASE tareaHito2;
USE tareaHito2;

create table estudiantes
(
    id_est int auto_increment primary key not null ,
    nombres varchar (50),
    apellidos varchar (50),
    edad int,
    gestion int,
    fono int,
    email varchar (100),
    dirrecion varchar (100),
    sexo  varchar (10)
);
create table materias
(
    id_mat int auto_increment primary key not null ,
    nombre_mat varchar (100),
    cod_mat varchar (100)
);
create table inscripcion
(
    id_ins int auto_increment primary key not null ,
    semestre varchar (20),
    gestion int,
    id_est int,
    id_mat int,
    foreign key (id_est)references estudiantes(id_est) ,
    foreign key (id_mat)references materias (id_mat)
);
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email,dirrecion, sexo)
VALUES ('Miguel', 'Gonzales Veliz', 20, 2832115,'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
('Sandra', 'Mavir Uria', 25, 2832116, 'sandra@gmail.com','Av. 6 de Agosto', 'femenino'),
('Joel', 'Adubiri Mondar', 30, 2832117, 'joel@gmail.com','Av. 6 de Agosto', 'masculino'),
('Andrea', 'Arias Ballesteros', 21, 2832118,'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino'),
('Santos', 'Montes Valenzuela', 24, 2832119,'santos@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO materias (nombre_mat, cod_mat)
VALUES ('Introduccion a la Arquitectura', 'ARQ-101'),
('Urbanismo y Diseno', 'ARQ-102'),
('Dibujo y Pintura Arquitectonico', 'ARQ-103'),
('Matematica discreta', 'ARQ-104'),
('Fisica Basica', 'ARQ-105');
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion)
VALUES (1, 1, '1er Semestre', 2018),
(1, 2, '2do Semestre', 2018),
(2, 4, '1er Semestre', 2019),
(2, 3, '2do Semestre', 2019),
(3, 3, '2do Semestre', 2020),
(3, 1, '3er Semestre', 2020),
(4, 4, '4to Semestre', 2021),
(5, 5, '5to Semestre', 2021);

# ○ Resolver lo siguiente:
# ■ Mostrar los nombres y apellidos de los estudiantes inscritos en la
# materia ARQ-105, adicionalmente mostrar el nombre de la materia.

select est.nombres, est.apellidos,mat.nombre_mat,mat.cod_mat
from estudiantes as est
inner join materias mat on est.id_est = mat.id_mat
where mat.cod_mat = 'ARQ-105';

# ■ Deberá de crear una función que reciba dos parámetros y esta
# función deberá ser utilizada en la cláusula WHERE.

create or replace function comparaMaterias(m varchar(25),c varchar(25))
 returns varchar (100)
begin
    declare x varchar(25);
    if m=c
    then
        Set x=1;
    end if;
   return x;
end;

select est.id_est,est.nombres, est.apellidos,mat.nombre_mat,mat.cod_mat
from estudiantes as est
inner join materias mat on est.id_est = mat.id_mat
where comparaMaterias(mat.cod_mat , 'ARQ-105');

# 14.Crear una función que permita obtener el promedio de las edades del género
# masculino o femenino de los estudiantes inscritos en la asignatura ARQ-104.
# ○ La función recibe como parámetro el género y el código de materia.


select avg(est.edad)
from estudiantes as est
inner join materias ma on ma.id_mat = est.id_est
inner join inscripcion i on est.id_est = i.id_est
where ma.cod_mat='ARQ-104'and est.sexo = 'femenino';

create or replace function avgedad(x varchar(25),y varchar (25))
returns varchar (100)
begin
      declare  w int ;
        select avg(est.edad) into w
        from estudiantes as est
        inner join materias ma on ma.id_mat = est.id_est
        inner join inscripcion i on est.id_est = i.id_est
        where ma.cod_mat=x and est.sexo = y;
      return  w ;
end;

select avgedad('arq-104', 'femenino');

select avgedad('arq-101','masculino');

# 15 Crear una función que permita concatenar 3 cadenas.
#○ La función recibe 3 parámetros.
#○ Si las cadenas fuesen:
#■ Pepito
#■ Pep
#■ 50
#○ La salida debería ser: (Pepito), (Pep), (50)
#○ La función creada utilizarlo en una consulta SQL.

create or replace function concatenar(x varchar(25), y varchar(25), z varchar(25))
    returns varchar(100)
begin
    declare resultado varchar(60);
    set resultado = CONCAT('(',x,'),  (',y,'),   (',z ,')');
    return resultado;
end;

select concatenar('pepito', 'pep', '50');


# 16.Crear una función de acuerdo a lo siguiente:
# ○ Mostrar el nombre, apellidos, edad y el semestre de todos los estudiantes
# que estén inscritos.
# ○ Siempre y cuando la suma de las edades del sexo femenino(tambien puede
# ser masculino) sea par y mayores a cierta edad.
# ○ Debe de crear una función que sume las edades (recibir como parámetro el
# sexo, y la edad).
# ■ Ejemplo: sexo=’Masculino’ y edad=22
# ■ Note que la función recibe 2 parámetros.
# ○ La función creada anteriormente debe utilizarse en la consulta SQL.
# (Cláusula WHERE).
 select sum(est.edad)
 from estudiantes as est
where est.sexo = 'femenino' and est.edad >= 22 ;

create or replace function qwert(sex varchar(25),ed int)
returns integer
begin
    declare y boolean;
    declare x  int;
    set x=( select sum(est.edad)
 from estudiantes as est
where est.sexo = sex and est.edad >= ed);
if x %2=0
    then set y=true;
    end if;
    return y ;
end;

select est.nombres,est.apellidos,est.edad,i.semestre
from estudiantes as est
inner join inscripcion i on est.id_est= i.id_ins
inner join materias m on i.id_ins = m.id_mat
where qwert('femenino',22);
#feminino >21 para que el resultado sea impar y no devuelva nada


# 17. Crear una función de acuerdo a lo siguiente:
# ○ Crear una función sobre la tabla estudiantes que compara un nombre y
# apellidos. (si existe este nombre y apellido mostrar todos los datos del
# estudiante).
# ■ La función devuelve un boolean.
# ■ La función debe recibir 4 parámetros, nombres y apellidos.
# ■ Similar al siguiente ejemplo.
# ○ Ejemplo:
# create function busca_nombres_apellidos(
# est.nombres,
# ‘William’,
# est.apellidos,
# ‘Barra Paredes’
# ) RETURNS ….
# ○ La función debería ser usada en la cláusula WHERE.
# ○ El objetivo es buscar a estudiantes a través de sus nombres y apellidos.

create or replace function buscaNOmbre(xnom varchar(25), yape varchar(25),xno varchar(25),ype varchar(25))
returns boolean
begin
    declare w boolean;

   if xnom=xno and yape=ype
    then set w = true;
    end if;
    return w;

end;

select *
from estudiantes as est
where buscanombre(est.nombres,est.apellidos,'Miguel','Gonzales Veliz');