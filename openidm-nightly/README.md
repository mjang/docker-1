# Dockerfile for creating a ForgeRock OpenIDM nightly build

Mount your custom config on /opt/openidm/conf.



Within the container OpenIDM is on port 8080

Configured to use a Postgres repo at hostname 'postgres'

# Example docker command:

Run OpenIDM, mapping the containers port 8080 to the docker hosts 9080
```
docker run -d -p 9080:8080 wstrange/openidm-nightly
```
