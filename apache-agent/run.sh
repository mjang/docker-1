#!/usr/bin/env bash
# Perform agent and environment setup then run apache


# Set defaults. You can override these env vars
: ${AGENT_PW:=password}
: ${AGENT_PW_KEY:=OWNjOTM5NmItNzUxYS0zZQ==}
: ${AGENT_USER:=apacheagent}
: ${AGENT_NAMING_URL:="http://openam-svc:80/openam"}

# todo: See if /secrets/apache-agent-pw exists. If it does - override the env var
# If it does, use that to bootstrap the agent secret 


 cd /opt/web_agents/apache24_agent/bin
 
 # run agentadmin to encode password with key. awk trick is needed because output is a full text message - not the value
 export AGENT_PW=`./agentadmin --p $AGENT_PW_KEY $AGENT_PW |  awk 'NF>1{print $NF}'`
 
 # For debugging
 echo encrytped password is $AGENT_PW

# Run sed on agent.conf to replace any vars
cd /opt/web_agents/apache24_agent/instances/agent_1/config/

FILE=agent.conf

# Override any vars in the agent.conf file
cp $FILE "$FILE.bak"
cat $FILE | \
  sed "s|AGENT_PW|$AGENT_PW|"  | \
  sed "s|AGENT_PW_KEY|$AGENT_PW_KEY|"  | \
  sed "s/AGENT_USER/$AGENT_USER/" | \
  sed "s+AGENT_NAMING_URL+$AGENT_NAMING_URL+" \
   > $FILE.new
 
 mv $FILE.new $FILE  
 

# todo: we should also concat the output of the agent debug log to stdout
# In a shell you can run { cmd1; cmd2; } also -see tail -f --follow=name --retry filename
httpd-foreground


