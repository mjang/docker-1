#!/usr/bin/env bash

# Container puts everything in /var/tmp
cd /var/tmp

OPENAM_CONFIG_URL=${OPENAM_CONFIG_URL:-https://raw.githubusercontent.com/ForgeRock/stack-config/master/openam/01_config.properties}

LB_PRIMARY_URL=${LB_PRIMARY_URL:-http://openam.example.com/openam}
COOKIE_DOMAIN=${COOKIE_DOMAIN:-.example.com}

# This is the INTERNAL URL that of the openam host - not external
SERVER_URL=${SERVER_URL:-http://openam:80/openam}


# Wait for OpenAM to come up before configuring it
# args  $1 - server URL
# $2 - deployment URI
function wait_for_openam
{
	T="$1/config/options.htm"

	until $(curl --output /dev/null --silent --head --fail $T); do
		echo "Waiting for OpenAM server at $T "
    sleep 5
	done
	# Sleep an additonal time in case DJ is not quite up yet
	echo "About to begin configuration in 30 seconds"
	sleep 60
}

# Download config file at $1 URL and template ${ENV} variables in the output
# See http://stackoverflow.com/questions/2914220/bash-templating-how-to-build-configuration-files-from-templates-with-bash
#
function get_template
{
	rm -f /tmp/am.properties
	echo Fetching config $1
	curl -s $1 | while read -r line; do
		while [[ "$line" =~ (\$\{[a-zA-Z_][a-zA-Z_0-9]*\}) ]] ; do
	        LHS=${BASH_REMATCH[1]}
	        RHS="$(eval echo "\"$LHS\"")"
	        line=${line//$LHS/$RHS}
	  done
    echo "$line" >>/tmp/am.properties
	done
}


function apply_config {
	for file in $1
	do
			echo "Applying property file $file"
			# This is kind of a kludge. The props file is not 100% valid shell
			# so you will see an error -but it serves to set the SERVER_URL arg
			# we need
			wait_for_openam  $SERVER_URL
			echo "Running Configurator"
			java -jar openam-configurator-tool*.jar -f $file
	done
}


# Fetch the AM template
get_template $OPENAM_CONFIG_URL
# Configure the server
apply_config /tmp/am.properites

echo "done"
