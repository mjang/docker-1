FROM java:8

MAINTAINER warren.strange@gmail.com


WORKDIR /opt

EXPOSE 8080


# download openidm nightly build and unzip

RUN curl -o /tmp/getnightly.sh https://raw.githubusercontent.com/ForgeRock/frstack/master/bin/getnightly.sh && \
   chmod +x /tmp/getnightly.sh && \
   /tmp/getnightly.sh openidm && \
   unzip staging/openidm.zip && \
   rm -f staging/openidm.zip

# Uncomment to use postgres repo
# Todo: This needs review after 4.x upgrade
# ADD repo.jdbc.json /opt/openidm/conf/repo.jdbc.json

VOLUME ["/opt/openidm/conf"]

CMD ["/opt/openidm/startup.sh"]
