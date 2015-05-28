# 
Dockerfile for OpenAM Nighly build

This is a base image that is not configured 

It deploys the OpenAM war in Tomcat 8 and is ready to be configured

Note for OpenAM to be configured correctly the container must resolve the FQDN DNS name used to access OpenAM.

One way to do this is to use the --add-host command on docker run. For example:

docker run -i -t -p 8080:8080 --add-host "openam.example.com:127.0.0.1" wstrange/openam-nightly 

If you get an error where the configurator complains that it can not start OpenDJ, or assigns negative port numbers (-1)
the container probably can not resolve the FQDN.




