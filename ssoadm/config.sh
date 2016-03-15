#!/usr/bin/env bash
# TODO: We need some process that sleeps until AM is up, then configures ssoadm, then applies configuration

#cd /opt/ssoadm


# todo: Add some process that loops through a series of config files and applies them
# This should loop forever so the container does not exit
while true; do sleep 1000; done


# todo:   Mount a git repo with batch commands, and run

# ./ssoadm do-batch -u amadmin -f pw -c -Z /config/openam/ssoadm_batch
