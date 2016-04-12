# Docker image for the OpenAM configurator tool
FROM java:8

WORKDIR /var/tmp

ADD ssoconfigtools.zip /var/tmp/ssoconfig.zip
# Download AM configurator from maven build
RUN  unzip ssoconfig.zip

COPY default.properties /var/tmp/
COPY config.sh /var/tmp/

CMD ["/var/tmp/config.sh"]
