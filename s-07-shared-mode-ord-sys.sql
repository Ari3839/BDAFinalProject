-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		19/nov/2023
-- @Descripcion	Configuración del modo compartido

--Recordar el listener arriba

Prompt Conectando como sys as sysdba
connect sys/"#Bala1234" as sysdba

Prompt modificando dominio, se reinciará la base

alter system set db_domain='fi.unam' scope=spfile;
shutdown immediate
startup

Prompt iniciando modo compartido

alter system set dispatchers='(dispatchers=2)(PROTOCOL=tcp)';

alter system set shared_servers=4;

!su oracle -c "lsnrctl start"
!su oracle -c "lsnrctl status"
!su oracle -c "lsnrctl services"
