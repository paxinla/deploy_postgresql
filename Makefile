INSTALLER = "bin/installer"

all: depends pyenv server inspgbouncer insrepmgr

## Shortcuts
depends: deps


## System parameters
setupos:
	@$(INSTALLER) setupos


## Python environment
pyenv:
	@$(INSTALLER) inspy


## PostgreSQL single instance
deps:
	@$(INSTALLER) depends
server: deps setupos
	@$(INSTALLER) pgserver
client: deps pyenv
	@$(INSTALLER) pgclient


## Pgbouncer
pgbouncer: deps
	@$(INSTALLER) inspgbouncer


## repmgr
repmgr: deps
	@$(INSTALLER) insrepmgr

## pgroonga
pgroonga:
	@$(INSTALLER) inspgroonga

