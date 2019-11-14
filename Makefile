VERSION = $(shell git describe --long --dirty --always --tags)
APP_VERSION = 0.1.0
SHELL := /bin/bash

PROJECT_NAME := ex-rails-prometheus
DOCKER_REGISTRY ?= milesmatthias
RELEASE_IMAGE_NAME ?= $(DOCKER_REGISTRY)/$(PROJECT_NAME)
CANARY_TESTER_IMAGE_NAME ?= $(DOCKER_REGISTRY)/ex-rails-canary-tester


PHONY: .version .app-version .image-name \
	.curl-canary .curl-baseline .curl-devint \
	.fwd-prometheus .build-image .build-tester-image


build-image:
	docker build -t $(RELEASE_IMAGE_NAME):latest -t $(RELEASE_IMAGE_NAME):$(SHA) .
	docker push $(RELEASE_IMAGE_NAME):latest
	docker push $(RELEASE_IMAGE_NAME):$(SHA)

build-tester-image:
	docker build -t $(RELEASE_IMAGE_NAME):latest -t $(RELEASE_IMAGE_NAME):$(SHA) ./canary-tester/
	docker push $(RELEASE_IMAGE_NAME):latest
	docker push $(RELEASE_IMAGE_NAME):$(SHA)

version:
	@echo $(VERSION)

app-version:
	@echo $(APP_VERSION)

image-name:
	@echo $(RELEASE_IMAGE_NAME)

canary-image-name:
	@echo $(CANARY_TESTER_IMAGE_NAME)

curl-canary:
	@source helpers.sh && curlService ex-rails-canary

curl-baseline:
	@source helpers.sh && curlService ex-rails-baseline

curl-devint:
	@source helpers.sh && curlService ex-rails-prometheus

fwd-prometheus:
	@source helpers.sh && connectPrometheus
