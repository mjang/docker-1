#!/usr/bin/env bash

#cd /var/tmp

CONFIG=/config/openam

if [ ! -d /config/openam ]; then
		echo "Can't find configuration directory /config/openam. Using default config"
		mkdir -p $CONFIG
		cp default.properties $CONFIG
fi


function wait_for_openam
{
	T="$1/config/options.htm"

	until $(curl --output /dev/null --silent --head --fail $T); do
		echo "Waiting for OpenAM server at $T "
    sleep 5
	done
	# Sleep an additonal 10 in case DJ is not quite up yet
	sleep 10
}



for file in $CONFIG/*.properties
do
		echo "Applying property file $file"
		# This is kind of a kludge. The props file is not 100% valid shell
		# so you will see an error -but it serves to set the SERVER_URL arg
		# we need
		source $file
		wait_for_openam   $SERVER_URL
		echo "Running Configurator"
		java -jar openam-configurator-tool*.jar -f $file
done
