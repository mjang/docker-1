FROM tomcat:8-jre8


ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV JAVA_OPTS -Dopenig.base=/root/openig
WORKDIR $CATALINA_HOME

# Let's remove some of the stuff we don't need
RUN rm -fr webapps/*

# todo:
# We should fix up classpath scanning to speed up the deployment
# see http://www.gpickin.com/index.cfm/blog/how-to-get-your-tomcat-to-pounce-on-startup-not-crawl

EXPOSE 8080

# download OpenIG nightly WAR
ADD openig.war webapps/ROOT.war
ADD run-openig.sh /tmp/run-openig.sh

CMD ["/tmp/run-openig.sh"]
