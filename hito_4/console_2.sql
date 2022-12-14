
use hito_3;
# obtimizar el tiempo de respuesta y rendimiento con base de datos
# mejora la seguridad
# en un instante de tiempo miles de usuarios estan insertandos datos independientemente del orden
#
set @admin = 'admin';  # variable GLOBAL
set @num = 1;

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

# case en funcion

create or replace function ejemplo2() returns varchar(50)
begin
    DECLARE respuesta varchar(20) default '';
  case
    when @admin = 'admin' then set respuesta= 'usuario admin';
    when @admin = 'oscar' then set respuesta='usuARIO INVITADO';
    ELSE SET respuesta='USUARIO NUEVO';
   END CASE ;
    return respuesta;
end;
 SELECT ejemplo2();
# CREAR UN VARIABLE GLOVAL DE NOMBRE PRECIO

SET @PRECIO = 100;

create or replace function ejemplo3 () returns varchar(50)
begin
    DECLARE respuesta varchar(20) default '';
  case
    when @PRECIO > 10 AND @PRECIO <= 20 then set respuesta= 'BASICO';
    when @PRECIO > 20 AND @PRECIO <=30 then set respuesta='INTERMEDIO';
    when @PRECIO > 30 AND @PRECIO <=50 then set respuesta= 'SUPERIOR';
    when @PRECIO > 50 then set respuesta= 'CARISIMO';
    ELSE SET respuesta='menor a 10';
   END CASE ;
    return respuesta;
end;

SELECT ejemplo3();


######

  set @x= 10000;
create or replace function ejemplo4 () returns varchar(50)
begin

    DECLARE respuesta varchar(20) default '';
  case
    when @x > 50000 then set respuesta= 'platinium';
    when @x >= 10000 AND @PRECIO <= 50000 then set respuesta= 'good';
    when @x <10000 then set respuesta='silver';

    ELSE SET respuesta='menor';
   END CASE ;
    return respuesta;
end;

select ejemplo4();
## while


CREATE OR REPLACE FUNCTION ejemplo5(y INTEGER)
RETURNS text
BEGIN
    DECLARE  X  VARCHAR(50)DEFAULT 1;
    declare z text default ' ';
    WHILE X <= y DO
        SET z = concat (z , x,',');
        set x = x +1 ;
        end while;
    return z ;
end;

select ejemplo5(10);

create or replace function ejemplo6impar(limite integer)
    returns text
    begin
    declare response text default '';
    declare x integer default 1;

    while x <= limite  do
        set response = concat (response,x,',');
        set x = x+2;
        end while;
    return response;
    end;
select ejemplo6(10);

create or replace function ejemplo6par(limite integer)
    returns text
    begin
    declare response text default '';
    declare x integer default 2;

    while x <= limite  do
        set response = concat (response,x,',');
        set x = x+1;
        end while;
    return response;
    end;
select ejemplo6par(10);

create or replace function ejemplo7par_impar(limite integer)
    returns text
    begin
    declare response text default '';
    declare x integer default 2;

    if limite %2=0
    then
        set x=2;
        while x<= limite do
            set response =concat(response,x,' ,  ');
            set x =x+2;
            end while;
        else
        set x=1;
         while x<= limite do
            set response =concat(response,x,' ,  ');
            set x =x+2;
            end while;
    end if;

    return response;
    end;

select ejemplo7par_impar(10);


create or replace function ejemplo8par_impar(limite integer)
    returns text
    begin
    declare response text default '';
    declare x integer default 2;

        case limite %2=0
           when true then set x=2;
           when  false then set x= 1;
        end case;

      while x<= limite do
            set response =concat(response,x,' ,  ');
            set x =x+2;
      end while;
    return response;
    end;
select ejemplo8par_impar(11) ;


-- este es el codigo del ing:
CREATE FUNCTION pares_impares_un_solo_while(limite INTEGER)
  RETURNS TEXT
  BEGIN
    DECLARE x INTEGER DEFAULT 1;
    DECLARE response TEXT DEFAULT '';

    IF limite % 2 = 0
      THEN
        SET x = 2;
    END IF;

    WHILE x <= limite DO
      SET response = CONCAT(response, x, ', ');
      SET x = x + 2;
    END WHILE;
    RETURN response;
  END;

SELECT pares_impares_un_solo_while(11);



create or replace function ejemplo9par_impar1(limite integer)
    returns text
    begin
    declare response text default '';
    declare x integer default 2;

        case limite %2=0
           when true then set x=2;
           when  false then set x= 1;
        end case;

      while x<= limite do
            set response =concat(x,', ',response);
            set x =x+2;
      end while;
      return response;
    end;

select ejemplo9par_impar1(10);

create or replace function ejemplo9par_imparotramaneramejor(limite integer)
    returns text
    begin
    declare response text default '';
   while  limite > 0 do
       set response = concat(response,limite,' , ');
       set limite = limite -2;
       end while;

      return response;
    end;
select ejemplo9par_imparotramaneramejor(9);

-- repeat == repetime esta accion hasta que la condicion sea falsa

create or replace function ej_repeat  (x integer)
returns text
begin
    declare str text default '';
  repeat
      set str = concat(str,x,',');
      set x=x -1;
  until x <=0 end repeat;

      return str;
end;

select  ej_repeat(9);

create or replace function ej2_repeat  (x integer)
returns text
begin
    declare str text default '';
  repeat
      if x %2=0
     then
    set str = concat(str,x,' aa  ,');
     set x=x -1;
      else
    set str = concat(str,x,' bb  ,');
    set x=x -1;
    end if;

  until x <=0 end repeat;
      return str;
end;
select  ej2_repeat(5);
-- recordar al ing nos debe nota


-- nueva clase
-- miercoles 12 de octubre
use hito_3;
create or replace  function  numeros_naturales_ej(x integer)
returns text
begin
 declare serie text default  '';
    repeat
        set serie = concat(serie,x, ', ');
        set x = x-1;
        until x<=0

        end repeat;-- se ejecutan mientras la condicion sea falce
return serie;
end;

select numeros_naturales_ej(-1);-- el repeat va mandar 1 vez si o si aun q el valor sea verdad

create or replace function ej2_repeat10  (x integer)
returns text
begin
    declare str text default '';
    declare contador integer default x;
  repeat
      if x %2=0
     then
    set str = concat(str,x,' aa  ,');
      else
    set str = concat(str,x,' bb  ,');
    end if;
      set x=x-1;
      set contador = contador-2;
  until contador <= 0 end repeat;
      return str;
end;
select  ej2_repeat10(5);

create or replace function manejoloop_label_ej(x integer)
returns text
begin
    declare str text default '';
    loop_label: loop
        if x<0
            then
            leave loop_label;
        end if;
        set str= concat(str, x , ', ');
        set x = x-1;
        iterate loop_label;
    end loop;
    return str;
end;
select manejoloop_label_ej(10);-- loop_label

-- cambiar el orden
create or replace function manejoloop_label(limite integer)
returns text
begin
    declare str text default '';
    declare x text default 1;
    loop_label: loop
        if x>limite
            then
            leave loop_label;
        end if;
        set str= concat(str, x , ', ');
        set x = x+1;
        iterate loop_label;
    end loop;
    return str;
end;

select manejoloop_label(10);


select trim(      'wer  wer'    );
select char_length('dba 11');
select strcmp('dba','dba2');
select locate('dba','dba2dba dba2 dba dba2');



create or replace  function  nombresj(x integer)
returns text
begin
 declare serie text default  '';
  if
return serie;
end;