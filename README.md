# Docker

Git repo for various ForgeRock Dockerfiles

You will need to download and copy in the various product binaries or war files
before performing a Docker build. For example, for openidm, download the zip
distribution, and place it in the openidm/ directory. The product file names
are not expected to have a version. For example - openidm.zip


These images will (eventualy) get built using Jenkins jobs that
1) Check this repo out of git
2) Copies the relevant war or zip file from ForgeRock's maven repo
3) Performs a docker build, and tags the image
4) Push the image to the Docker Hub (optional - only for nightly builds)


For instructions on how to run these images please see the README.md files in
each directory.
