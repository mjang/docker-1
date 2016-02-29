# Docker build files for the ForgeRock stack


The provided Makefile downloads nightly builds from ForgeRock's maven repo
and will build and tag the docker images

To build

```
make clean
make
```


# Building Docker Images using Jenkins

If you have a Jenkins CI pipeline, you can automatically build these images:
 * Check this repo out of git
 * Copy the relevant war or zip file from ForgeRock's maven repo
 * Use the Jenkins Docker plugin to perform a docker build, tag and push the image.


# Building Minor Releases

If you want to use a major or minor release (OpenAM 13.0.1, for example), log on to
backstage.forgerock.com and download the appropriate binary. The binary should be
placed in the Docker build directory (e.g. openam/) and should not have any
version info (openam.war, not OpenAM-13.0.1.war).


For instructions on how to run these images please see the README.md files in
each directory.

If you are interested in running on a Kubernetes cluster,
see  [here](https://github.com/ForgeRock/fretes)
