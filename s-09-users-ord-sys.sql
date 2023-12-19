-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		20/nov/2013
-- @Descripcion	Usuarios

Prompt conectando como usuario sys
connect sys/"#Bala1234" as sysdba

declare
  v_count number;
  v_username varchar2(20) := 'DEVELOPER_M';
begin
  select count(*) into v_count from all_users where username=v_username;
  if v_count >0 then
    execute immediate 'drop user '||v_username|| ' cascade';
  end if;
end;
/

Prompt creando al usuario developer_m
create user developer_m identified by oracle123 
default tablespace general_multimedia
quota unlimited on indices_multimedia
quota unlimited on lobs_multimedia1
quota unlimited on lobs_multimedia2
quota unlimited on lobs_multimedia3
quota unlimited on hisotricos_multimedia
quota unlimited on jerarquia_multimedia
quota unlimited on playlists
quota unlimited on general_multimedia;

grant create session, create table, alter tablespace, manage tablespace, create procedure to developer_m;


declare
  v_count number;
  v_username varchar2(20) := 'DEVELOPER_U';
begin
  select count(*) into v_count from all_users where username=v_username;
  if v_count >0 then
    execute immediate 'drop user '||v_username|| ' cascade';
  end if;
end;
/

Prompt creando al usuario developer_u
create user developer_u identified by oracle123 
default tablespace general_usuario
quota unlimited on indices_usuarios
quota unlimited on reproducciones1
quota unlimited on reproducciones2
quota unlimited on reproducciones3
quota unlimited on reproducciones4
quota unlimited on hisotricos_usuarios
quota unlimited on comentarios
quota unlimited on general_usuario
quota unlimited on tarjetas;

grant create session, create table, alter tablespace, manage tablespace to developer_u;


declare
  v_count number;
  v_username varchar2(20) := 'RESPALDOS';
begin
  select count(*) into v_count from all_users where username=v_username;
  if v_count >0 then
    execute immediate 'drop user '||v_username|| ' cascade';
  end if;
end;
/

Prompt creando al usuario respaldos
create user respaldos identified by oracle123
default tablespace users
quota unlimited on tarjetas;

grant create session to respaldos;
grant sysbackup to respaldos;