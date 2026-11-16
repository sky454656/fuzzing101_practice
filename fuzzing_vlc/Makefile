COMPOSE := LOCAL_UID=$(shell id -u) LOCAL_GID=$(shell id -g) docker compose
SERVICE := vlc-fuzz

.PHONY: build shell

build:
	docker build -f docker/Dockerfile -t fuzzing101-vlc:ubuntu20.04 .

shell:
	$(COMPOSE) run --rm $(SERVICE) /bin/bash
