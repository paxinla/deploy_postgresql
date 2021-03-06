# 编译部署 PostgreSQL 环境

注意:

1. 只在 Ubuntu 18.04 上测试过。
2. 安装 PostgreSQL 服务器前，先编辑 conf/passfile 设置密码。
3. 安装 repmgr 前，先编辑 conf/repmgr.conf 中的 host 等信息。
4. 系统中要先创建好用户 postgres 。
5. 执行 make 的用户必须有无密码 sudo 的权限。

在本目录下执行 `make` 即可。

## 目录树

```
  .
  |
  +---- bin # 执行脚本等
  |
  +---- modules # 源码包等
  |
  +---- conf # 配置文件
```

## 源码包清单

### Python 环境

- pyenv.tar.xz
- setuptools-40.7.1-py2.py3-none-any.whl
- virtualenv-16.3.0-py2.py3-none-any.whl
- Python-2.7.15.tar.xz
- Python-3.7.2.tar.xz

### PG 组件
- postgresql-11.1.tar.bz2
- libevent-2.0.22-stable.tar.gz
- pgbouncer-1.9.0.tar.gz
- repmgr-4.2.tar.gz


## 日志文件管理

用 logrotate 管理 repmgr 的日志文件，编辑 `/etc/logrotate.d/postgresql` 文件:

```
/var/log/pg_log/repmgr.log {
    weekly
    rotate 10
    maxsize 100M
    missingok
    notifempty
    compress
    delaycompress
    create 0640 postgres postgres
    postrotate
        killall -HUP repmgrd
    endscript
}

/var/log/pg_log/pgbouncer.log {
    weekly
    rotate 10
    maxsize 100M
    missingok
    notifempty
    compress
    delaycompress
    create 0640 postgres postgres
    postrotate
        kill -HUP `cat /var/log/pg_log/pgbouncer.pid 2>/dev/null` 2>/dev/null || true
    endscript
}
```

用 crontab 清理 postgresql 的日志文件。

```
/usr/bin/find /path-to-postgresql-logs/ -type f -name "postgresql-*.log" -mtime +3 -delete ;
```
