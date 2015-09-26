# Extend Postgres to be used as an OpenIDM repo

FROM postgres:latest

ADD openidm.pgsql /docker-entrypoint-initdb.d/01_init.sql
ADD default_schema_optimization.pgsql /docker-entrypoint-initdb.d/02_optimize.sql

