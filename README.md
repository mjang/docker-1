# docker
Git repo for various ForgeRock Dockerfiles

You will need to download and copy in the various product binaries or war files
before performing a Docker build

These images get built using Jenkins jobs that
1) Check this repo out of git
2) Copy the relevant war or zip file from ForgeRock's maven repo
3) Perform a docker build, and tag the image
4) Push the image to the Docker Hub (optional - only for nightly builds)
