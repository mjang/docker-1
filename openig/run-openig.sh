#!/bin/sh
# Start OpenIG enabled Tomcat
# To create a persistent configuration mount a data volume on /root/config

mkdir -p /root/config
# Trigger the OpenIG WAR deployment by removing the default ROOT app
rm -rf /usr/local/tomcat/webapps/ROOT
# Start Tomcat
/usr/local/tomcat/bin/catalina.sh run
