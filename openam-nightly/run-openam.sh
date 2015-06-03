#!/bin/sh

# Fix up openam to point to personality ldap
# TODO: figure out how to get different nodes 

mkdir -p /root/.openamcfg
cat >/root/.openamcfg/AMConfig_usr_local_tomcat_webapps_openam_ <<HERE
/root/openam
HERE

# Todo - create the bootstrap file, and any other directories needed
# This should be done via ENV vars?


# Suggestion from Victor
#CATALINA_OPTS="-Xms128m -Xmx1024m -XX:MaxPermSize=256m -D\"com.sun.identity.configuration.directory=/root/openam/\" -D\"bootstrap.dir=/root/openam\""
# export CATALINA_OPTS
cd /usr/local/tomcat 
bin/catalina.sh run 

