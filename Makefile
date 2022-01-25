.DEFAULT_GOAL := help
SHELL = /bin/sh

init: build pull dependencies ## Set up the project for the first time or reset it to its initial configuration.

server: ## Start all required runtime services.
	docker-compose up node

build: ## (Re)build dockerfiles.
	docker-compose build --progress plain node

pull: ## (Re)pull upstream docker images.
	docker-compose pull

dependencies: ## Install dependencies.
	docker-compose run node npm install

help: ## Show this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
