#!/usr/bin/env bash

cd /var/tmp

C=openam-configurator-tool*.jar

# todo: Put a wait loop for the openam-svc-a:80 to come up before running
# The URL should be passed as an env param


echo configuring first instance

java -jar $C -f master.properties

sleep 30
echo Configuring second instance

java -jar $C -f second.properties

echo done config

# todo - take this out when we get it right. This is to allow us to log on to the container.
sleep 1000