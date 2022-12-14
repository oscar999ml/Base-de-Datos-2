create database Defensa_hito3_2022;
use Defensa_hito3_2022;

-- PREGUNTAS DE LAS DEFENSA
-- CREAR UNA VARIABLE GLOBAL.


set @admin = 'admin';  # variable GLOBAL
set @admin = 'oscar';
select @admin;

create or replace function ejemplo() returns varchar(50)
begin
    DECLARE respuesta varchar(20) default '';
    if @admin = 'ADMIN'
    THEN
        SET respuesta = 'usuario admin';
    else
       set respuesta = 'usuario invitado';
    end if;
    return respuesta;
end ;

select  ejemplo();

create or replace function COMPARASTRING1 (X VARCHAR (50),Y VARCHAR (50))
    returns TEXT
begin
    DECLARE respuesta varchar(20) default '';
    if STRCMP(x, y) = 0
    THEN
        SET respuesta = 'ES IGUAL';
    else
       set respuesta = 'NO ES IGUAL';
    end if;
    return respuesta;
end ;

SELECT COMPARASTRING1('holas','HOLA');

create table clientes
(id_cliente int primary key not null,
fullname varchar (20),
lastname varchar  (20),
age int,
genero char(1)
 );

insert into clientes (id_cliente, fullname, lastname, age, genero)
values(1,'kevin','mamani',18 ,'m'),
    (2,'ilia','zarso',20,'f'),
    (3,'freddy','machaca',25,'m'),
(4,'karen','malaga',26,'f');

insert into clientes (id_cliente, fullname, lastname, age, genero) values (4,'karen','malaga',26,'f');
create or replace function edadmax ()
    returns TEXT
begin
   return (
    select MAX(cli.age)
    from clientes as cli
           );
end ;

select edadmax();

CREATE OR REPLACE FUNCTION edadmaxnumeros()
RETURNS text
BEGIN
    DECLARE  X  VARCHAR(50)DEFAULT edadmax();
    declare z text default ' ';
    WHILE X <= edadmax() DO
        SET z = concat (z , x,',');
        set x = x -1 ;
        end while;
    return z ;
end;


select edadmaxnumeros();

create or replace function par_impar(limite int) returns text -- este si esta bien tiene par e impar
begin
    declare response text default '';
    declare x integer default 2;

        case limite %2=0
           when true then set x=2;
           when  false then set x= 1;
        end case;

      while x<= limite do
            set response =concat(x,', ',response);
            set x =x+1;
      end while;
    return response;
    end;
select par_impar(11);






CREATE FUNCTION fn_Fibonacci(@max int)
RETURNS  text
AS
BEGIN
	Declare m1 integer = 0;
	declare n2 integer =1; declare @i integer=0;
	@temp integer default '';
	Insert Into @numbers Values(@n1),(@n2);
	WHILE @i<=@max-2 do
		set @temp = @n2;
		Set @n2 = @n2 + @n1;
		Set @m1 = @temp;
		Set @i = 1;
end while ;
	RETURN @temp;
END;





create or replace function ejemplo(x varchar(25))
    returns varchar(50)
begin

    return (  select reverse(x));
end ;

select  ejemplo('hola');















