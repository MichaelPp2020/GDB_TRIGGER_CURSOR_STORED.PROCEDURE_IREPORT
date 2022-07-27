
/*=====cursor===============*/



 DO $$
DECLARE                                              
		TABLA RECORD;
		CUR_NINO CURSOR FOR 
							  SELECT
							  nino.ap_y_nom_nino as Nombre_nino,
							  informacio_nino as Padecimineto,
							  ninera.id_ninera as A_CARGO
							  from nino
							  inner join ninera on ninera.id_nino = nino.id_nino;
BEGIN
OPEN CUR_NINO;
FETCH CUR_NINO INTO TABLA;
WHILE(FOUND)LOOP
RAISE NOTICE 'nombre_nino: %, Padecimineto: %, A_CARGO: %',
	TABLA.Nombre_nino,
	TABLA.Padecimineto,
	TABLA.A_CARGO;
FETCH CUR_NINO INTO TABLA;
END LOOP;
END $$
LANGUAGE PLPGSQL;