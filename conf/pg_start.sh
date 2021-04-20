#!/usr/bin/env bash
# This script should be owned by root.


echo "= PostgreSQL"
if ! pgrep -f '/data/pgdata' > /dev/null
then
    echo -1000 | sudo tee /proc/self/oom_score_adj
    export PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
    export PG_OOM_ADJUST_VALUE=0
    sudo -u postgres /opt/postgresql/bin/pg_ctl start -l /tmp/start_pg.log -D /data/pgdata
fi

echo "= PgBouncer"
if ! pgrep -f 'pgbouncer.ini' > /dev/null
then
    sudo -u postgres /opt/pgbouncer/bin/pgbouncer -d /dbms/conf/postgresql/pgbouncer.ini
fi

sleep 6m

test -d /var/run/postgresql || { sudo mkdir -p /var/run/postgresql && sudo chown -R postgres:postgres /var/run/postgresql ; }

echo "= RepMgr"
if ! pgrep -f 'repmgr.conf' > /dev/null
then
    sudo -u postgres /opt/postgresql/bin/repmgrd -f /dbms/conf/postgresql/repmgr.conf --monitoring-history --daemonize --pid-file=/var/run/postgresql/repmgrd.pid | sudo -u postgres tee -a /var/log/pg_log/repmgr.log 2>&1
fi

