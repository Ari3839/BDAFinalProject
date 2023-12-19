-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		21/nov/2023
-- @Descripcion	Configuraciones finales

Prompt Conectando como sys
connect sys/"#Bala1234" as sysdba

/*Configurando modo archive*/
Prompt cerrando ordenadamente
shutdown immediate

Prompt iniciando en mount
startup mount

Prompt modificando
alter database archivelog;
alter database open;

Prompt Comprobando
archive log list

Prompt revisando redo logs
col member format a35;
select * from v$logfile;

Prompt llenando redo log groups

alter database add logfile member '/unam-bda/proyecto/d01/BALAPROY/redo01a.log' to group 1;
alter database add logfile member '/unam-bda/proyecto/d02/BALAPROY/redo01b.log' to group 1;
alter database add logfile member '/unam-bda/proyecto/d01/BALAPROY/redo02a.log' to group 2;
alter database add logfile member '/unam-bda/proyecto/d02/BALAPROY/redo02b.log' to group 2;
alter database add logfile member '/unam-bda/proyecto/d01/BALAPROY/redo03a.log' to group 3;
alter database add logfile member '/unam-bda/proyecto/d02/BALAPROY/redo03b.log' to group 3;

Prompt comprobando
select * from v$logfile;

Prompt creando pfile
create pfile='/unam-bda/proyecto/pfile' from pfile;

/*Crear las copias manuaes de los archivos como user ORACLE*/
/*Agregar a *.control_files='/unam-bda/proyecto/d01/BALAPROY/control01.ctl','/unam-bda/proyecto/d01/BALAPROY/control02.ctl'*/

/*Iniciada en modo mount:
create spfile from pfile='/unam-bda/proyecto/pfile'*/