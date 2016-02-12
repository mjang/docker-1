# Dockerfile ForgeRock OpenIDM

Mount your custom config on /opt/openidm/conf.


Within the container OpenIDM is running on port 8080

This is image is configured to use a Postgres repo at hostname 'postgres'

# Running with docker-compose

The supplied Docker Compose file will run OpenIDM and a Postgres database as
the repository.


Run ```docker-compose up```

The Docker compose exposes IDM on port 5000 (8080 is overused if you are wondering
  why port 5000). Feel free to change this.

Find the IP address of your docker image (if you are on a Mac for example,
  this will not be localhost), and bring up

  http://192.45.77.01:5000/

  You should get an openidm prompt. Login with openidm-admin / openidm-admin


# Possible Issues

If OpenIDM runs well before postgres is up, it may error out on trying to
connect to the repo database. 
