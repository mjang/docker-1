

Docker Image to install the OpenAM 4.x Agent for Apache 2.4 httpd server

This has is minimally tested - and most certainly needs work to make it functional

The strategy is to have this image bootstrap apache + the agent with just enough configuration so  it can locate and connect to an OpenAM server. The remaining agent properties will be set at runtime by the OpenAM server.

The parent Docker image is the standard httpd. See https://hub.docker.com/_/httpd/


# Managing the agent Password

The agentadmin command can generate the agent password:
agentadmin --p "key" "password"

For example,
bin/agentadmin --p OWNjOTM5NmItNzUxYS0zZQ== password  

The first arg is a base 64 encoded key

These values get set in the agent.conf file. For example:

com.sun.identity.agents.config.password = ENuBoLrxX/I=
com.sun.identity.agents.config.key = OWNjOTM5NmItNzUxYS0zZQ==

Note that the agent essentially decodes the password using the key, and sends it to OpenAM in clear text (hopefully over SSL). OpenAM then compares it to the password it has stored for the agent. There is no requirement for the key values to match between OpenAM and the agent.

From a strategy perspective there are couple of choices:
- Create a custom Dockerfile that overrides agent.config, and supplies your own values
- Use a  Kubernetes secret volume and mount it on /secrets/ and use that to bootstrap the agent password




# List of required  bootstrap  properties (from Mareks)

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
