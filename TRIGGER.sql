/*TRIGGER*/
create or replace function tg_NoAsig () RETURNS TRIGGER 
as $tg_NoAsig$
 	declare
		cantidadMalas int ;
		noAsignar varchar(10) ; 
begin
		select count (*) into cantidadMalas from calificacion 
		where CALIFICACION_NINERA = 'mala';
		select id_ninera into noAsignar from  ninera where id_ninera = new.id_ninera ;
   if (cantidadMalas >2	)then 
   raise exception 'NO ASIGNAR; CALIFICACIONES MALAS ';
   END IF;
   return new;
end;
 $tg_NoAsig$ Language plpgsql;
 
 
 CREATE or replace TRIGGER tg_NoAsig_TRIGGER  BEFORE  INSERT
 ON Calificacion FOR EACH ROW 
 EXECUTE PROCEDURE tg_NoAsig ();