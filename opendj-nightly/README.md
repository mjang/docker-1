ForgeRock OpenDJ nightly build


The writable directories (persisted data) are collected up under /opt/opendj/instance

To run in Docker (example)
mkdir dj    # Make an instance dir to perist data
# Run Docker - mounting the local dj/ dir on the instance directory
docker run -i -t -v dj:/opt/opendj/instance wstrange/opendj-nightly:latest

For Kubernetes mount a PV on /opt/opendj/instance

