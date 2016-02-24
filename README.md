# Docker build files for the ForgeRock stack



The provided Makefile downloads nightly builds from ForgeRock's maven repo
and will build and tag the docker images

To build

```
make clean
make
```


# Building Docker Images

These images will (eventually) get built using a Jenkins jobs that

 * Checks this repo out of git
 * Copies the relevant war or zip file from ForgeRock's maven repo
 * Performs a docker build, and tags the image
 * Push the image to the Docker Hub (optional - only for nightly builds)

If you want to use a major or minor  (OpenAM 13.0.1, for example), log on to
backstage.forgerock.com and download the appropriate binary. The binary should be
placed in the Docker build directory (e.g. openam/) and should not have any
version info (openam.war, not OpenAM-13.0.1.war).


For instructions on how to run these images please see the README.md files in
each directory.

If you are interested in running on a Kubernetes cluster,
see  [here](https://github.com/ForgeRock/fretes)
