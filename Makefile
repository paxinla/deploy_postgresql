INSTALLER = "bin/installer"

all: depends inspy server inspgbouncer insrepmgr

## Shortcuts
depends: deps


## System parameters
setupos:
	@$(INSTALLER) setupos


## Python environment
inspy:
	@$(INSTALLER) inspy


## PostgreSQL single instance
deps:
	@$(INSTALLER) depends
server: deps setupos
	@$(INSTALLER) pgserver
client: deps inspy
	@$(INSTALLER) pgclient


## Pgbouncer
inspgbouncer: deps
	@$(INSTALLER) inspgbouncer


## repmgr
insrepmgr: deps
	@$(INSTALLER) insrepmgr


.PHONY: inspy server inspgbouncer insrepmgr
