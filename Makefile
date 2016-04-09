.PHONY: clean download openam openidm opendj ssoadm ssoconfig openig

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
apache-agent: download
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@
