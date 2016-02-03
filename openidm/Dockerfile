FROM java:8

MAINTAINER warren.strange@gmail.com


WORKDIR /opt

EXPOSE 8080


# download openidm nightly build and unzip
ADD openidm.zip /var/tmp/openidm.zip

RUN unzip /var/tmp/openidm.zip && \
   rm -f /var/tmp/openidm.zip

# Uncomment to use postgres repo
ADD repo.jdbc.json /opt/openidm/conf/repo.jdbc.json
ADD datasource.jdbc-default.json /opt/openidm/conf/datasource.jdbc-default.json

VOLUME ["/opt/openidm/conf"]

CMD ["/opt/openidm/startup.sh"]
