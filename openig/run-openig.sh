#!/bin/sh
# Start OpenIG enabled Tomcat
# To create a persistent configuration mount a data volume on /root/config

mkdir -p /root/openig

# Start Tomcat
/usr/local/tomcat/bin/catalina.sh run
