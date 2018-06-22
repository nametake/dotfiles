# nametake Makefile

.DEFAULT_GOAL := help

GO_TOOLS := \
	github.com/golangci/golangci-lint/cmd/golangci-lint \
	github.com/rhysd/gofmtrlx \
	sourcegraph.com/sqs/goreturns \
	github.com/kisielk/errcheck \
	github.com/cweill/gotests/... \

NPM_TOOLS := \
	eslint \
	prettier \
	prettier-eslint \
	eslint-plugin-vue \
	js-beautify \

.PHONY: help
help: # Refer: https://postd.cc/auto-documented-makefile/
	@echo 'usage: make [target]'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install_go_tools
install_go_tools: ## Install go cli tools
	go get -u $(GO_TOOLS)

.PHONY: install_npm_tools
install_npm_tools: ## Install npm cli tools
	npm install -g $(NPM_TOOLS)
