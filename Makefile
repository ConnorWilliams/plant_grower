
# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

NAMESPACE := $(if $(NAMESPACE),$(NAMESPACE),eggmancw)
LABEL := $(if $(LABEL),$(LABEL),first)

# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build -t $(NAMESPACE)/$(APP_NAME):$(LABEL) $(APP_NAME)/

build-nc: ## Build the container without caching
	docker build -t $(NAMESPACE)/$(APP_NAME):$(LABEL) --no-cache $(APP_NAME)/