

Docker Image to install the OpenAM 4.x Agent for Apache 2.4 httpd server

This has not been tested yet - and most certainly needs updating to make it functional

The strategy is to have this image bootstrap apache + the agent with just enough configuration so  it can locate and connect to an OpenAM server. The remaining agent properties will be set by the OpenAM server. 

The parent Docker image is the standard httpd. See https://hub.docker.com/_/httpd/ 

The suggested strategy is to 



Bootstrap props from the /opt/web_agents/apache24_agent/instances/agent_1/config/agent.conf file follow:

TODO: Possible strategy is to copy this file as part of the Docker build. Users can override by copying their own agent.conf

com.sun.identity.agents.config.repository.location = centralized
com.sun.identity.agents.config.naming.url = http://openam-svc:80/openam
com.sun.identity.client.notification.url = http://apacheagent:80//UpdateAgentCacheServlet?shortcircuit=false
com.sun.identity.agents.config.organization.name = /
com.sun.identity.agents.config.username = apacheagent
com.sun.identity.agents.config.password = ENuBoLrxX/I=
com.sun.identity.agents.config.key = OWNjOTM5NmItNzUxYS0zZQ==
com.sun.identity.agents.config.connect.timeout = 4
com.sun.identity.agents.config.debug.file.size = 0
com.sun.identity.agents.config.local.logfile = /opt/web_agents/apache24_agent/bin/../instances/agent_1/logs/debug/debug.log
com.sun.identity.agents.config.local.audit.logfile = /opt/web_agents/apache24_agent/bin/../instances/agent_1/logs/audit/audit.log
com.sun.identity.agents.config.debug.level = error
org.forgerock.agents.config.postdata.preserve.dir = /opt/web_agents/apache24_agent/bin/../log
com.forgerock.agents.config.cert.ca.file = 
com.forgerock.agents.config.cert.file = 
com.forgerock.agents.config.cert.key = 
com.forgerock.agents.config.cert.key.password = 
com.forgerock.agents.config.ciphers = 
com.forgerock.agents.config.hostmap = 
org.forgerock.agents.config.tls = 
org.forgerock.agents.config.keepalive.disable = 


List of bootstrap/required  props from Mareks
com.sun.identity.agents.config.repository.location
com.sun.identity.agents.config.naming.url
com.sun.identity.agents.config.organization.name
com.sun.identity.agents.config.username
com.sun.identity.agents.config.password 
com.sun.identity.agents.config.key
com.sun.identity.agents.config.connect.timeout
org.forgerock.agents.config.postdata.preserve.dir
com.forgerock.agents.config.cert.*
com.sun.identity.agents.config.trust.server.certs
com.forgerock.agents.config.ciphers
com.forgerock.agents.config.hostmap
org.forgerock.agents.config.tls
org.forgerock.agents.config.keepalive.disable
com.sun.identity.agents.config.local.logfile
com.sun.identity.agents.config.local.audit.logfile
