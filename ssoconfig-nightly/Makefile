# Makefile

.PHONY: push container all

all: container push

container: 
	docker build -t $(PREFIX):$(TAG) .

push: container
	gcloud docker push $(PREFIX)/ssoconfig:$(TAG)

