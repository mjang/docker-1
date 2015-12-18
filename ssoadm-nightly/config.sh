#!/usr/bin/env bash
# TODO: We need some process that sleeps until AM is up, then configures ssoadm, then applies configuration

cd /opt/ssoadm


# todo - take this out when we get it right. This is to allow us to log on to the container
# And manually run ssoadm
while true; do sleep 1000; done
