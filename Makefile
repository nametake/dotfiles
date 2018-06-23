# nametake Makefile

.DEFAULT_GOAL := help

DOTFILES := \
	bash_profile \
	bashrc \
	zshenv \
	zshrc \
	zshrc.zplug \
	vimrc \
	vim \
	tmux.conf \
	gitconfig \
	gitignore \
	git_template \
	tern-config \

GO_TOOLS := \
	github.com/nsf/gocode \
	github.com/rogpeppe/godef \
	github.com/jstemmer/gotags \
	github.com/golang/lint/golint \
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

link: ## Create symbolic link
	./bin/ln.sh $(DOTFILES)

zplug: ## Install zplug
	@./bin/zplug.sh

tmp: ## Install tmux plugin manager
	@./bin/tmp.sh

go_get: ## Install go cli tools
	go get -u $(GO_TOOLS)

npm_i: ## Install npm cli tools
	npm install -g $(NPM_TOOLS)

gcloud: ## Install gcloud cli tools
	@./bin/gcloud.sh
