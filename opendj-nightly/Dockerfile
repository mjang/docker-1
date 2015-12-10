FROM java:8

MAINTAINER warren.strange@gmail.com

WORKDIR /opt

# Fetch the latest nightly build
RUN curl https://forgerock.org/djs/opendjrel.js?948497823 | grep -o "http://.*\.zip" | tail -1 | xargs curl -o opendj.zip && unzip opendj.zip && rm opendj.zip

# Creating instance.loc consolidates the writable directories under one root 
# We also create the extensions directory, and copy in any default extensions
RUN echo "/opt/opendj/instances/instance1" > /opt/opendj/instance.loc  && \
    mkdir -p /opt/opendj/instances/instance1/lib/extensions  && \
    cp /opt/opendj/lib/extensions/* /opt/opendj/instances/instance1/lib/extensions

RUN ./opendj/setup --cli -p 389 --ldapsPort 636 --enableStartTLS --generateSelfSignedCertificate \
    --sampleData 10 --baseDN "dc=example,dc=com" -h localhost --rootUserPassword password --acceptLicense --no-prompt --doNotStart 

EXPOSE 389 636 4444

CMD ["/opt/opendj/bin/start-ds","--nodetach"]

