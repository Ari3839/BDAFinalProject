-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		19/nov/2023
-- @Descripcion	Creación de la BD

Prompt Conectando como sys as sysdba
connect sys/"#Bala1234" as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

Prompt conectando como system
connect system/"#Bala1234"
@?/sqlplus/admin/pupbld.sql

Prompt Listo
exit