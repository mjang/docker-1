#!/bin/sh
export JAVA_OPTS="$JAVA_OPTS\
 -server\
 -Xms704m\
 -Xmx1024m\
 -XX:MaxPermSize=256m"
