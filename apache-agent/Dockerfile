# Docker image for Apache + OpenAM HTTP agent
FROM httpd:2.4

WORKDIR /opt


ADD agent.zip /var/tmp/agent.zip

RUN apt-get update && apt-get install -y unzip curl && \
      unzip /var/tmp/agent.zip && rm /var/tmp/agent.zip && \
      echo "password" >/var/tmp/pw.txt  && chmod 0400 /var/tmp/pw.txt

# Format of agentadmin command:
# agentadmin --s "web-server configuration file, directory or site parameter" \
#                "OpenAM URL" "Agent URL" "realm" "agent user id" \
#                "path to the agent password file" [--changeOwner] [--acceptLicence] [--forceInstall]
#

# Because we are running this before OpenAM is up and running we need to use the forceinstall option
# We are using some defaults here (openam-svc) that are not going to exist in most environments
# They will need to be overridden at runtime by updating the bootstrap files
# A possible option is to have Docker create a host entry for openam-svc - but that seems kludgy...
RUN /opt/web_agents/apache24_agent/bin/agentadmin --s /usr/local/apache2/conf/httpd.conf \
        "http://openam-svc:80/openam" \
        "http://apache-svc:80/" \
        "/" \
        "apacheagent" \
        /var/tmp/pw.txt \
        --changeOwner --acceptLicence --forceInstall

COPY agent.conf /opt/web_agents/apache24_agent/instances/agent_1/config/agent.conf
COPY run.sh /var/tmp/

# Inherit CMD from Parent httpd:2.4
# CMD ["httpd-foreground"]

CMD ["/var/tmp/run.sh"]
