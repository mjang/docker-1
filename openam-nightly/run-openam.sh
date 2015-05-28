#!/bin/sh

# Fix up openam to point to personality ldap
# TODO: figure out how to get different nodes 

mkdir -p /root/.openamcfg
cat >/root/.openamcfg/AMConfig_usr_local_tomcat_webapps_openam_ <<HERE
/root/openam/openam01
HERE


cd /usr/local/tomcat 
bin/catalina.sh run 

