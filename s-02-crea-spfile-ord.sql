-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		19/nov/2023
-- @Descripcion		Creación del archivo SPFile desde el PFile

Prompt conectando como SYS desde archivo de passwords
connect sys/"#Bala1234" as sysdba

Prompt Creando spfile
Create spfile from pfile;

Prompt verificando creacion del archivo
!ls -l ${ORACLE_HOME}/dbs/spfilebalaproy.ora

Prompt Listo
exit