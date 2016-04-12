.PHONY: clean download openam openidm opendj ssoadm ssoconfig openig apache-agent

# Override these with env vars to change the defaults
TAG ?= nightly
REPO ?=forgerock

all: openam openidm opendj ssoadm ssoconfig apache-agent

# Clean up any downloaded artifacts
clean:
	find . -name \*.zip -delete
	find . -name \*.war -delete

download:
	mvn package

openam: download
	docker build -t $(REPO)/$@:$(TAG) $@

openidm: download
	docker build -t $(REPO)/$@:$(TAG) $@
	docker build -t $(REPO)/openidm-postgres openidm-postgres

opendj: download
	docker build -t $(REPO)/$@:$(TAG) $@

openig: download
	docker build -t $(REPO)/$@:$(TAG) $@

ssoadm: download
	docker build -t $(REPO)/$@:$(TAG) $@

ssoconfig: download
	docker build -t $(REPO)/$@:$(TAG) $@

# Note: Apache agent is not available via maven.
# todo: get a stable download location
apache-agent:
	curl "http://download.forgerock.org/downloads/openam/webagents/nightly/Linux/Apache_v24_Linux_64bit_4.0.0-SNAPSHOT.zip" -o apache-agent/agent.zip
	docker build -t $(REPO)/$@:$(TAG) $@
