#!/usr/bin/env bash

PIDOFPG="$1"

test "${PIDOFPG}" = '' && { echo "Input parameter should be the PID of PostgreSQL server !" ; exit 1; }

MEM_OF_PG=$(pmap ${PIDOFPG} | awk '/rw-s/ && /zero/ {print $2}' | sed 's/[Kk]//g')

test "${MEM_OF_PG}" = '' && { echo "Maybe PG has already use HugePage." ; exit 0; }

UNIT_OF_HP=$(grep "^Hugepagesize" /proc/meminfo | awk '{print $2}')

SIZE_OF_HP=$(bc <<< "scale=2; ${MEM_OF_PG} / ${UNIT_OF_HP}")
echo "Advise to set size of HugePage to ${SIZE_OF_HP} . (like: sysctl -w vm.nr_hugepages=${SIZE_OF_HP})"
