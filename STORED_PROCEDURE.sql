/*======PROCEDIMIENTO_ALMACENADO======*/


CREATE OR REPLACE FUNCTION public."SUMA_ANUAL"(
	"codeempleado" integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
    
AS $BODY$
declare  suma numeric;

begin
    select  sum(ingreso_ninera) into   suma  from ingreso  
    where id_ninera = codeempleado;
    
    return suma ;
end;
$BODY$;

ALTER FUNCTION public."SUMA_ANUAL"(integer)
    OWNER TO postgres;


DROP FUNCTION "SUMA_ANUAL"
select "SUMA_ANUAL"(1)