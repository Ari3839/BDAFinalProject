-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		14/nov/2023
-- @Descripcion	Creación de la BD

--ORACLE_SID

Prompt Conectando como sys
connect sys/"#Bala1234" as sysdba

Prompt iniciando instancia
startup nomount

whenever sqlerror exit rollback

create database balaproy
  user sys identified by systemproy
  user system identified by systemproy
  logfile group 1 size 50m blocksize 512,
  group 2 size 50m blocksize 512,
  group 3 size 50m blocksize 512
   maxloghistory 1
   maxlogfiles 16
   maxlogmembers 3
   maxdatafiles 2048
   character set AL32UTF8
   extent management local
   datafile '/unam-bda/proyecto/d04/BALAPROY/system01.dbf'
     size 700m reuse autoextend on next 10240k maxsize unlimited
   sysaux datafile '/unam-bda/proyecto/d04/BALAPROY/sysaux01.dbf'
     size 550m reuse autoextend on next 10240k maxsize unlimited
   default tablespace users datafile '/unam-bda/proyecto/d04/BALAPROY/users01.dbf'
     size 500m reuse autoextend on maxsize unlimited
   default temporary tablespace tempts1 tempfile 
     '/unam-bda/proyecto/d04/BALAPROY/temp01.dbf'
     size 20m reuse autoextend on next 640k maxsize unlimited
   undo tablespace undotbs1
   datafile '/unam-bda/proyecto/d04/BALAPROY/undotbs01.dbf'
     size 200m reuse autoextend on next 5120k maxsize unlimited;

Prompt homologando passwords
alter user sys identified by systemproy;
alter user system identified by systemproy;

Prompt Al fin se creo la base c:
exit