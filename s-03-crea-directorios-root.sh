#!/bin/bash
# @Autor		Ariadna Lazaro  & Brian Bautista
# @Fecha		19/nov/2023
# @Descripcion		Creación de directorios

echo "Validando existencia de directorio para datafiles"
export ORACLE_SID=balaproy

echo "Creando carpeta para redologs y control files"
if [ -d "/unam-bda/proyecto/d01/${ORACLE_SID^^}" ]; then
  echo "El directorio d01 para redologs y control files ya existe"
else
  echo "creando directorio d01"
    cd /unam-bda/proyecto/
    mkdir -p d01/${ORACLE_SID^^}
    chown -R oracle:oinstall d01/
    chmod 750 -R d01/
fi;

if [ -d "/unam-bda/proyecto/d02/${ORACLE_SID^^}" ]; then
  echo "El directorio d02 para redologs y control files ya existe"
else
  echo "creando directorio d02"
    cd /unam-bda/proyecto
    mkdir -p d02/${ORACLE_SID^^}
    chown -R oracle:oinstall d02/
    chmod 750 -R d02/
fi;

if [ -d "/unam-bda/proyecto/d03/${ORACLE_SID^^}" ]; then
  echo "El directorio d03 para datafiles ya existe"
else
  echo "creando directorio d03"
    cd /unam-bda/proyecto/
    mkdir -p d03/${ORACLE_SID^^}
    chown -R oracle:oinstall d03/
    chmod 750 -R d03/
fi;

if [ -d "/unam-bda/proyecto/d04/${ORACLE_SID^^}" ]; then
  echo "El directorio d04 para datafiles ya existe"
else
  echo "Creando directorio para data files"
    cd /unam-bda/proyecto/
    mkdir -p d04/${ORACLE_SID^^}
    chown -R oracle:oinstall d04/
    chmod 750 -R d04/
fi;


if [ -d "/unam-bda/proyecto/d05/${ORACLE_SID^^}" ]; then
  echo "El directorio d05 para FRA ya existe"
else
  echo "creando directorio d05"
    cd /unam-bda/proyecto/
    mkdir -p d05/${ORACLE_SID^^}/controlfile
    chown -R oracle:oinstall d05/
    chmod 750 -R d05/
fi;

if [ -d "/unam-bda/proyecto/d06/${ORACLE_SID^^}" ]; then
  echo "El directorio d06 para Archive logs ya existe"
else
  echo "creando directorio d06"
    cd /unam-bda/proyecto/
    mkdir -p d06/${ORACLE_SID^^}
    chown -R oracle:oinstall d06/
    chmod 750 -R d06/
fi;

if [ -d "/unam-bda/proyecto/d07/${ORACLE_SID^^}" ]; then
  echo "El directorio d07 para datafiles ya existe"
else
  echo "creando directorio d07"
    cd /unam-bda/proyecto/
    mkdir -p d07/${ORACLE_SID^^}
    chown -R oracle:oinstall d07/
    chmod 750 -R d07/
fi;

if [ -d "/unam-bda/proyecto/d08/${ORACLE_SID^^}" ]; then
  echo "El directorio d08 para datafiles ya existe"
else
  echo "creando directorio d08"
    cd /unam-bda/proyecto/
    mkdir -p d08/${ORACLE_SID^^}
    chown -R oracle:oinstall d08/
    chmod 750 -R d08/
fi;

if [ -d "/unam-bda/proyecto/d09/${ORACLE_SID^^}" ]; then
  echo "El directorio d09 para datafiles ya existe"
else
  echo "creando directorio d09"
    cd /unam-bda/proyecto/
    mkdir -p d09/${ORACLE_SID^^}
    chown -R oracle:oinstall d09/
    chmod 750 -R d09/
fi;

if [ -d "/unam-bda/proyecto/d10/${ORACLE_SID^^}" ]; then
  echo "El directorio d10 para datafiles ya existe"
else
  echo "creando directorio d10"
    cd /unam-bda/proyecto/
    mkdir -p d10/${ORACLE_SID^^}
    chown -R oracle:oinstall d10/
    chmod 750 -R d10/
fi;

if [ -d "/unam-bda/proyecto/d11/${ORACLE_SID^^}" ]; then
  echo "El directorio d11 para datafiles ya existe"
else
  echo "creando directorio d11"
    cd /unam-bda/proyecto/
    mkdir -p d11/${ORACLE_SID^^}
    chown -R oracle:oinstall d11/
    chmod 750 -R d11/
fi;

if [ -d "/unam-bda/proyecto/d12/${ORACLE_SID^^}" ]; then
  echo "El directorio d12 para datafiles ya existe"
else
  echo "creando directorio d12"
    cd /unam-bda/proyecto/
    mkdir -p d12/${ORACLE_SID^^}
    chown -R oracle:oinstall d12/
    chmod 750 -R d12/
fi;

if [ -d "/unam-bda/proyecto/d13/${ORACLE_SID^^}" ]; then
  echo "El directorio d13 para datafiles ya existe"
else
  echo "creando directorio d13"
    cd /unam-bda/proyecto/
    mkdir -p d13/${ORACLE_SID^^}
    chown -R oracle:oinstall d13/
    chmod 750 -R d13/
fi;

if [ -d "/unam-bda/proyecto/d14/${ORACLE_SID^^}" ]; then
  echo "El directorio d14 para datafiles ya existe"
else
  echo "creando directorio d14"
    cd /unam-bda/proyecto/
    mkdir -p d14/${ORACLE_SID^^}
    chown -R oracle:oinstall d14/
    chmod 750 -R d14/
fi;

if [ -d "/unam-bda/proyecto/d15/${ORACLE_SID^^}" ]; then
  echo "El directorio d15 para datafiles ya existe"
else
  echo "creando directorio d15"
    cd /unam-bda/proyecto/
    mkdir -p d15/${ORACLE_SID^^}
    chown -R oracle:oinstall d15/
    chmod 750 -R d15/
fi;

if [ -d "/unam-bda/proyecto/d16/${ORACLE_SID^^}" ]; then
  echo "El directorio d16 para datafiles ya existe"
else
  echo "creando directorio d16"
    cd /unam-bda/proyecto/
    mkdir -p d16/${ORACLE_SID^^}
    chown -R oracle:oinstall d16/
    chmod 750 -R d16/
fi;

if [ -d "/unam-bda/proyecto/d17/${ORACLE_SID^^}" ]; then
  echo "El directorio d17 para datafiles ya existe"
else
  echo "creando directorio d17"
    cd /unam-bda/proyecto/
    mkdir -p d17/${ORACLE_SID^^}
    chown -R oracle:oinstall d17/
    chmod 750 -R d17/
fi;

if [ -d "/unam-bda/proyecto/d18/${ORACLE_SID^^}" ]; then
  echo "El directorio d18 para datafiles ya existe"
else
  echo "creando directorio d18"
    cd /unam-bda/proyecto/
    mkdir -p d18/${ORACLE_SID^^}
    chown -R oracle:oinstall d18/
    chmod 750 -R d18/
fi;

if [ -d "/unam-bda/proyecto/d19/${ORACLE_SID^^}" ]; then
  echo "El directorio d19 para datafiles ya existe"
else
  echo "creando directorio d19"
    cd /unam-bda/proyecto/
    mkdir -p d19/${ORACLE_SID^^}
    chown -R oracle:oinstall d19/
    chmod 750 -R d19/
fi;


echo "Comprobando directorios"
ls -l /unam-bda/proyecto/d*/