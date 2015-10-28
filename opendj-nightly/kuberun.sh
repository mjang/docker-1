#!/usr/bin/env bash

# This startup script is meant to be used in a Kubernetes environment
# The idea is to consolidate all of the writable DJ diretories to
# a single directory root, and update DJ' instance.loc file to point there
# Then we can hae k8 mount a data volume on that root - to give us
# persistence across restarts of OpenDJ

cd /opt/opendj

# Instance dir does not exist?
if [ ! -d instance ] ; then
  mkdir instance
  mv config/ instance
  mv db/ instance
  mkdir instance/logs
  mkdir instance/locks
  echo "./instance" > instance.loc
fi

bin/start-ds

tail -f instance/logs/server.out
