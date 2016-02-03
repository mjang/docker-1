# openidm-postgres

Extends the base postgres image with the schema required for OpenIDM


The sql files are copied in from OpenIDM 4.1 snapshot (as of Feb 2016).
We should probably grab these dynamically from a current build and tag this image

createuser.psql is not really needed as the Docker image creates the user. It is here for reference.

The other two sql files get copied to the init directory of the parent image, and are executed when the image starts.

# Sample commands to start

```
#  Runs postgres as openidm db, uses data volume on hosts /var/tmp/pg
docker run --name pg -e POSTGRES_PASSWORD=openidm -e POSTGRES_USER=openidm  \
-e PGDATA=/var/lib/postgresql/data/pgdata -v /var/tmp/pg:/var/lib/postgresql/data/pgdata \
-d wstrange/openidm-postgres

# log in to the image to test...
docker exec -i -t pg /bin/bash

# Try psql
psql -U openidm
select * from openidm.managedobjects;
INSERT INTO openidm.internaluser (objectid, rev, pwd, roles) VALUES ('foo', '0', 'bar', '["openidm-reg"]');
select * from openidm.internaluser;

```

# Notes

Altenative strategy using Docker data volumes


```
# Create the data container - dont delete this!
docker run --name pgdata postgres echo "data only"

# Run this image
docker run --name idmpg -e POSTGRES_PASSWORD=openidm -e POSTGRES_USER=openidm  \
--volumes-from pgdata  \
--rm=true wstrange/openidm-postgres
```
