FROM java:8

MAINTAINER warren.strange@forgerock.com


WORKDIR /opt
ADD https://raw.githubusercontent.com/ForgeRock/frstack/master/bin/getnightly.sh  /tmp/getnightly.sh
RUN sh /tmp/getnightly.sh ssoadm && unzip staging/ssoadmintools.zip -d /opt/ssoadm && rm -fr /opt/staging
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
WORKDIR /opt/ssoadm
#
# The OpenAM server needs to be running for ssoadm to install
# So we have to delay the setup until after the container is created.
# (At least DJ instance needs to be up  -ssoadm setup fails otherwise)
# The setup command below will *NOT* work....
#RUN /opt/ssoadm/setup --acceptLicense --path /root/openam
ADD config.sh /opt/ssoadm/config.sh
ADD ssoadm /opt/ssoadm/ssoadm

CMD ["/opt/ssoadm/config.sh"]
