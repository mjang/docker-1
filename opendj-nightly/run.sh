#!/usr/bin/env bash

# This startup script is meant to be used in a Kubernetes environment
# The idea is to consolidate all of the writable DJ directories to
# a single directory root, and update DJ's instance.loc file to point to that root
# This allows us to to mount a data volume on that root which will give us
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
