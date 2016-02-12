# Docker

Git repo for various ForgeRock Dockerfiles

The provided Makefile downloads nightly builds from ForgeRock's maven repo
and will build and tag the docker images

To build

```
make clean
make
```


These images will (eventually) get built using a Jenkins jobs that
* Checks this repo out of git
* Copies the relevant war or zip file from ForgeRock's maven repo
* Performs a docker build, and tags the image
* Push the image to the Docker Hub (optional - only for nightly builds)


For instructions on how to run these images please see the README.md files in
each directory.

If you are interested in running on a Kubernetes cluster,
see https://github.com/ForgeRock/fretes 
