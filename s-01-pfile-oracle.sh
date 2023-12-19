#!/bin/bash
# @Autor		Ariadna Lazaro & Brian Bautista
# @Fecha		14/nov/2023
# @Descripcion		Creación del archivo PFile

echo "Creando un archivo de parámetros básico"
export ORACLE_SID=balaproy
export US=$(id -un)

if [ "${US}" == "oracle" ]; then
  echo "--Ejecutando como usuario oracle--"

  #variable
  pfile=${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora

  if [ -f "${pfile}" ]; then
    read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
  fi;

  echo \
    "db_name='${ORACLE_SID}'
    memory_target=1024M
    db_recovery_file_dest_size=10G
    db_recovery_file_dest='/unam-bda/proyecto/d05'
    log_archive_max_processes=4
    log_archive_format=arch_%t_%s_%r.arc
    log_archive_trace=6
    log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST'
    log_archive_dest_2='LOCATION=/unam-bda/proyecto/d06/arch'
    " > "$pfile"
  echo "Listo"
  echo "Comprobando el contenido del archivo PFILE"
  cat "${pfile}"
else
  echo "No estas autenticado como usuario oracle"
fi;