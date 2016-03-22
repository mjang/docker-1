FROM java:8

MAINTAINER warren.strange@forgerock.com

WORKDIR /opt

EXPOSE 8080


# download openidm nightly build and unzip
ADD openidm.zip /var/tmp/openidm.zip

RUN unzip /var/tmp/openidm.zip && \
   rm -f /var/tmp/openidm.zip

# Uncomment to use Postgres repo
RUN mv /opt/openidm/conf/repo.orientdb.json  /opt/openidm/conf/repo.orientdb.json.bak
ADD repo.jdbc.json /opt/openidm/conf/repo.jdbc.json
ADD datasource.jdbc-default.json /opt/openidm/conf/datasource.jdbc-default.json

# Remove custom startup once https://bugster.forgerock.org/jira/browse/OPENIDM-5435
# is fixed
ADD startup.sh /opt/openidm/startup.sh

WORKDIR /opt/openidm

CMD ["/opt/openidm/startup.sh"]
