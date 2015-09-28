# Dockerfile for creating a ForgeRock OpenIDM nightly build

Mount your custom config on /opt/openidm/conf.



Within the container OpenIDM is on port 8080

Configured to use a Postgres repo at hostname 'postgres'

# Example docker command:

```
docker run -p 8080:8080 wstrange/openidm-nightly
```



