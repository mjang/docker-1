FROM tomcat:8-jre8

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV JAVA_OPTS -Dopenig.base=/root/openig
WORKDIR $CATALINA_HOME

EXPOSE 8080

# download OpenIG nightly WAR
ADD openig.war webapps/ROOT.war
ADD run-openig.sh /tmp/run-openig.sh

CMD ["/tmp/run-openig.sh"]
