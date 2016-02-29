.PHONY: clean download openam openidm opendj ssoadm ssoconfig openig

TAG=nightly
REPO=forgerock

all: openam openidm opendj ssoadm ssoconfig apache-agent

# Clean up any downloaded artifacts
clean:
	find . -name \*.zip -delete
	find . -name \*.war -delete

download_all:
	./getnightly.sh

openam:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@

openidm:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@
	docker build -t $(REPO)/openidm-postgres openidm-postgres

opendj:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@

openig:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@

ssoadm:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@

ssoconfig:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@

apache-agent:
	./getnightly.sh $@
	docker build -t $(REPO)/$@:$(TAG) $@
