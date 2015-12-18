# Docker image for Apache + OpenAM HTTP agent 
FROM httpd:2.4

RUN apt-get update && apt-get install -y unzip curl
RUN  curl -o /var/tmp/agent.zip \
http://download.forgerock.org/downloads/openam/webagents/nightly/Linux/Apache_v24_Linux_64bit_4.0.0-SNAPSHOT.zip

WORKDIR /opt

RUN unzip /var/tmp/agent.zip && rm /var/tmp/agent.zip 
# agentadmin --s "web-server configuration file, directory or site parameter" \
#                "OpenAM URL" "Agent URL" "realm" "agent user id" \
#                "path to the agent password file" [--changeOwner] [--acceptLicence] [--forceInstall]
# get rid of this hack. Use env var???
RUN echo "password" >/var/tmp/pw.txt  && chmod 0400 /var/tmp/pw.txt
RUN /opt/web_agents/apache24_agent/bin/agentadmin --s /usr/local/apache2/conf/httpd.conf \
        "http://openam-svc:80/openam" \
        "http://apache-svc:80/" \
        "/" \
        "apacheagent" \
        /var/tmp/pw.txt \
        --changeOwner --acceptLicence --forceInstall
COPY config.sh /var/tmp/

# From Parent httpd:2.4 
CMD ["httpd-foreground"]

