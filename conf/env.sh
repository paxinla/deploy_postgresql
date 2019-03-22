#!/usr/bin/env bash

## System
C_APT_LIST='packages.lst'
V_FILE_MAX=419430400000
V_PID_MAX=4096000

## Python
PYENV_ROOT='/opt/pyenv'
PY3_VERSION='3.7.2'
PY2_VERSION='2.7.15'

## PostgreSQL
C_PGCONF_LIST='pg_conf_files.lst'
C_PGSH_LIST='pg_script_files.lst'
PGVERSION='11.1'
# huge page support, memory less than 64GB close(N)
FLAG_USE_HUGEPAGE='N'
SIZE_BLOCK=32
SIZE_SEG=128
SIZE_WAL_BLOCK=32
SIZE_WAL_SEG=64
PGINSDIR="/opt/postgres/${PGVERSION}"
PGHOME='/opt/postgresql'
PGHOST=localhost
PGPORT=6432
PGDATA='/data/pgdata'
DATAROOT='/data'
PGDBDATDIR="${DATAROOT}/postgres-${PGVERSION}"
PGDBDATA="${DATAROOT}/postgresql"
PGDBCONFROOT='/dbms'
PGDBCONFDIR="${PGDBCONFROOT}/conf/postgresql"
PGDBSHDIR="${PGDBCONFROOT}/script/postgresql"
PGDBRUNDIR='/var/run/postgresql'
PGDBLOGDIR='/var/log/postgresql'

## PgBouncer
C_PGB_LIST='pgbouncer_files.lst'
LIBEVNT_VERSION='2.0.22'
LIBEVNT_HOME='/opt/libevent'
PBVERSION='1.9.0'
PBHOME='/opt/pgbouncer'

## repmgr
REPMGR_VERSION='4.2'
