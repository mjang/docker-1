#!/usr/bin/env bash

cd /var/tmp

# Optionally pass in URL of OpenAM server

URL=${OPENAM_URL:-"http://openam-svc-a:80/openam"}

T="$URL/config/options.htm"

echo Configuring OpenAM $URL 

until $(curl --output /dev/null --silent --head --fail $T); do
	echo "Waiting for OpenAM server at $URL "
    sleep 5
done
# Sleep an additonal 10 in case DJ is not quite up yet
sleep 10

java -jar openam-configurator-tool*.jar -f master.properties

