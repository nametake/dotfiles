# nametake Makefile

.DEFAULT_GOAL := help

DOTFILES := \
	bash_profile \
	bashrc \
	zshenv \
	zshrc \
	zshrc.zplug \
	config/fish/config.fish \
	config/fish/fishfile \
	config/karabiner \
	vimrc \
	vim \
	config/nvim \
	tmux.conf \
	gitconfig \
	gitignore \
	git_template \
	tern-config \

PKG_MANAGER_TOOLS := \
	zsh \
	fish \
	tmux \
	git \
	vim \
	neovim \
	go \
	node \
	python2 \
	python3 \
	peco \
	ghq \
	jq \
	yamllint \

BREW_TOOLS := \
	the_silver_searcher \

GO_TOOLS := \
	github.com/mdempsky/gocode \
	github.com/rogpeppe/godef \
	github.com/jstemmer/gotags \
	github.com/golang/lint/golint \
	github.com/golangci/golangci-lint/cmd/golangci-lint \
	github.com/rhysd/gofmtrlx \
	sourcegraph.com/sqs/goreturns \
	github.com/kisielk/errcheck \
	github.com/cweill/gotests/... \
	mvdan.cc/sh/cmd/shfmt \
	github.com/moorereason/mdfmt \
	github.com/gohugoio/hugo \

NPM_TOOLS := \
	npm \
	neovim \
	eslint \
	prettier \
	prettier-eslint \
	eslint-plugin-vue \
	js-beautify \
	git-open \
	typescript \

PIP_TOOLS := \
	pip \
	neovim \

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

all_tools: go_get npm_i pip_i ## Install all cli tools

brew_i: ## Install brew tools
	brew install $(PKG_MANAGER_TOOLS) $(BREW_TOOLS)

go_get: ## Install go cli tools
	go get -u $(GO_TOOLS)

npm_i: ## Install npm cli tools
	npm install -g $(NPM_TOOLS)

pip_i: ## Install pip tools
	pip install --upgrade $(PIP_TOOLS)
	pip3 install --upgrade $(PIP_TOOLS)

gcloud: ## Install gcloud cli tools
	@./bin/gcloud.sh
