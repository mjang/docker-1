FROM java:8

MAINTAINER warren.strange@gmail.com

WORKDIR /opt

# Fetch the latest nightly build
# Update to use the getnightly script
# RUN curl https://forgerock.org/djs/opendjrel.js?948497823 | grep -o "http://.*\.zip" | tail -1 | xargs curl -o opendj.zip && unzip opendj.zip && rm opendj.zip

ADD https://raw.githubusercontent.com/ForgeRock/frstack/master/bin/getnightly.sh  /tmp/getnightly.sh
RUN sh /tmp/getnightly.sh opendj && unzip staging/opendj.zip -d /opt/opendj && rm -fr /opt/staging
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Creating instance.loc consolidates the writable directories under one root
# We also create the extensions directory
# The strategy is the create a skeleton DJ instance under the instances/template directory
# and use this template to instantiate a new persistent image.
RUN echo "/opt/opendj/instances/template" > /opt/opendj/instance.loc  && \
    mkdir -p /opt/opendj/instances/template/lib/extensions

RUN ./opendj/setup --cli -p 389 --ldapsPort 636 --enableStartTLS --generateSelfSignedCertificate \
    --sampleData 5 --baseDN "dc=example,dc=com" -h localhost --rootUserPassword password --acceptLicense --no-prompt --doNotStart

EXPOSE 389 636 4444

ADD run.sh /opt/opendj/run.sh

# Copy in the template the first time DJ runs, and start DJ

CMD ["/opt/opendj/run.sh"]

# no longer used. see run.sh
#CMD ["/opt/opendj/bin/start-ds","--nodetach"]
