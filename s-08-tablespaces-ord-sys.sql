-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		19/nov/2023
-- @Descripcion	Creación de tablespaces

Prompt conectando como usuario sys
connect sys/"#Bala1234" as sysdba

create tablespace indices_usuarios
  datafile '/unam-bda/proyecto/d03/BALAPROY/indices_usuarios.dbf' size 10m
  reuse
  autoextend on
  extent management local autoallocate
  segment space management auto;

create tablespace indices_multimedia
  datafile '/unam-bda/proyecto/d03/BALAPROY/indices_multimedia.dbf' size 10m
  reuse
  autoextend on
  extent management local autoallocate
  segment space management auto;

create tablespace reproducciones1
  datafile '/unam-bda/proyecto/d04/BALAPROY/reproducciones01.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;

create tablespace reproducciones2
  datafile '/unam-bda/proyecto/d19/BALAPROY/reproducciones02.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;

create tablespace reproducciones3
  datafile '/unam-bda/proyecto/d06/BALAPROY/reproducciones03.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;

create tablespace reproducciones4
  datafile '/unam-bda/proyecto/d07/BALAPROY/reproducciones04.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;


create bigfile tablespace lobs_multimedia1
  datafile '/unam-bda/proyecto/d08/BALAPROY/lobs_multimedia1.dbf' size 1g
  extent management local autoallocate
  segment space management auto;

create bigfile tablespace lobs_multimedia2
  datafile '/unam-bda/proyecto/d09/BALAPROY/lobs_multimedia2.dbf' size 1g
  extent management local autoallocate
  segment space management auto;

create bigfile tablespace lobs_multimedia3
  datafile '/unam-bda/proyecto/d10/BALAPROY/lobs_multimedia3.dbf' size 1g
  extent management local autoallocate
  segment space management auto;

create tablespace tarjetas
  datafile '/unam-bda/proyecto/d11/BALAPROY/tarjetas.dbf' size 10m
  autoextend on
  extent management local autoallocate
  segment space management auto;

create tablespace hisotricos_multimedia
  datafile '/unam-bda/proyecto/d12/BALAPROY/hisotricos_multimedia01.dbf' size 10m,
  '/unam-bda/proyecto/d12/BALAPROY/hisotricos_multimedia02.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;

create tablespace hisotricos_usuarios
  datafile '/unam-bda/proyecto/d13/BALAPROY/hisotricos_usuarios01.dbf' size 10m,
  '/unam-bda/proyecto/d13/BALAPROY/hisotricos_usuarios02.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;

create tablespace jerarquia_multimedia
  datafile '/unam-bda/proyecto/d14/BALAPROY/jerarquia_multimedia.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;

create tablespace comentarios
  datafile '/unam-bda/proyecto/d15/BALAPROY/comentarios01.dbf' size 10m,
  '/unam-bda/proyecto/d15/BALAPROY/comentarios02.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 30m
  extent management local autoallocate
  segment space management auto;


create tablespace playlists
  datafile '/unam-bda/proyecto/d16/BALAPROY/playlists.dbf' size 10m
  reuse
  autoextend on next 1m maxsize 40m
  extent management local autoallocate
  segment space management auto;

create tablespace general_usuario
  datafile '/unam-bda/proyecto/d17/BALAPROY/general_usuario.dbf' size 10m
  autoextend on
  extent management local autoallocate
  segment space management auto;
  
create tablespace general_multimedia
  datafile '/unam-bda/proyecto/d18/BALAPROY/general_multimedia.dbf' size 10m
  autoextend on
  extent management local autoallocate
  segment space management auto;