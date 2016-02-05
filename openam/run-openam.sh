#!/bin/sh
# Start OpenAM
# To create a persistent configuration mount a data volume on /openam/root

#  Point instance dir at /root/openam
mkdir -p /root/.openamcfg
cat >/root/.openamcfg/AMConfig_usr_local_tomcat_webapps_openam_ <<HERE
/root/openam
HERE


cd /usr/local/tomcat 
bin/catalina.sh run 

