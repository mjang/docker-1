FROM java:8
WORKDIR /opt
ADD https://raw.githubusercontent.com/ForgeRock/frstack/master/bin/getnightly.sh  /tmp/getnightly.sh
RUN sh /tmp/getnightly.sh ssoadm && unzip staging/ssoadmintools.zip -d /opt/ssoadm && rm -fr /opt/staging
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
WORKDIR /opt/ssoadm
# Note to self....
# OpenAM server needs to be running? At least DJ instance needs to be up (ssoadm setup fails otherwise)
# Cant do this... Will have to configure ssoadm at runtime
#RUN /opt/ssoadm/setup --acceptLicense --path /root/openam
ADD config.sh /opt/ssoadm/config.sh
ADD run-ssoadm /opt/ssoadm/run-ssoadm

CMD ["/opt/ssoadm/config.sh"]