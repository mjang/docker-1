#!/usr/bin/env bash

# This startup script is meant to be used in a Kubernetes environment
# The idea is to consolidate all of the writable DJ directories to
# a single directory root, and update DJ's instance.loc file to point to that root
# This allows us to to mount a data volume on that root which will give us
# persistence across restarts of OpenDJ

cd /opt/opendj

if [ ! -d bin ] ; then

  if [ ! -e /installers/opendj.zip ] ; then
    curl https://forgerock.org/djs/opendjrel.js?948497823 | grep -o "http://.*\.zip" | tail -1 | xargs curl -o /opt/opendj.zip;
    if [ -w /installers/ ] ; then
      cp /opt/opendj.zip /installers/
    fi
  else
    cp /installers/opendj.zip /opt/opendj.zip
  fi

  if [ ! -e response_file.props ] ; then
    cat > response_file.props <<EOF
#
# Sample properties file to set up OpenDJ directory server
#
hostname                        =localhost
ldapPort                        =389
generateSelfSignedCertificate   =true
enableStartTLS                  =true
ldapsPort                       =636
jmxPort                         =689
adminConnectorPort              =4444
rootUserDN                      =cn=Directory Manager
rootUserPassword                =password
baseDN                          =dc=example,dc=com
sampleData                      =100
doNotStart                      =true
EOF

  fi

  unzip /opt/opendj.zip -d /opt && /opt/opendj/setup --cli --propertiesFilePath response_file.props --acceptLicense --no-prompt \
      && /opt/opendj/bin/stop-ds && rm /opt/opendj.zip

  sleep 5
fi

cd /opt/opendj

# have config dir not been moved?
if [ -d config ] ; then
  mkdir -p instance/logs
  mkdir -p instance/locks
  mkdir -p instance/db
  mkdir -p instance/config

  mv config/* instance/config/
  mv db/* instance/db/

  echo "./instance" > instance.loc
fi

bin/start-ds

tail -f instance/logs/server.out
