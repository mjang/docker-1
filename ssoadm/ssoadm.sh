#!/bin/bash
# Shell script to run ssoadm
# Because we can not configure ssoadm in advance of OpenAM being installed,
# This script runs setup first, and then executes ssoadm

cd /opt/ssoadm

./setup --path /root/openam --debug /opt/ssoadm/debug \
	--log /opt/ssoadm/log --acceptLicense


openam/bin/ssoadm list-servers -u amadmin -f pw

./ssoadm list-servers -u amadmin -f pw
