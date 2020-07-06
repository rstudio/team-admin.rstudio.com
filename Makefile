all: help

linkcheck-local: ## build the site locally and test links
	docker run --rm -it --network="host" -u $(id -u):$(id -g) linkchecker/linkchecker --check-extern http://127.0.0.1:8000

linkcheck-staging: ## Test links on the production site
	docker run --rm -it -u $(id -u):$(id -g) linkchecker/linkchecker --check-extern https://team-admin-staging.netlify.app

linkcheck-prod: ## Test links on the production site
	docker run --rm -it -u $(id -u):$(id -g) linkchecker/linkchecker --check-extern https://team-admin.rstudio.com

build: ## build the site
	docker run --rm -p 8000:8000 -v ${PWD}:/workspace sellorm/mkdocs build

serve: ## Serve the site for local development
	docker run --rm -p 8000:8000 -v ${PWD}:/workspace sellorm/mkdocs serve -a 0.0.0.0:8000

help:  ## Show this help menu
	@grep -E '^[0-9a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?##"; OFS="\t\t"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, ($$2==""?"":$$2)}'

.PHONY: all test-local-links test-prod-links build serve help
