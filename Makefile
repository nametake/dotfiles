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
	config/Code \
	vimrc \
	vim \
	config/nvim \
	tmux.conf \
	gitconfig \
	gitignore \
	git_template \
	tern-config \
	eslintrc \
	prettierrc \
	ideavimrc \
	textlintrc \

PKG_MANAGER_TOOLS := \
	zsh \
	fish \
	tmux \
	git \
	vim \
	neovim \
	go \
	node \
	yarn \
	python2 \
	python3 \
	peco \
	ghq \
	jq \
	hub \
	yamllint \
	create-react-app \

BREW_TOOLS := \
	the_silver_searcher \

GO_TOOLS := \
	golang.org/x/tools/cmd/gopls \
	github.com/sourcegraph/go-langserver \
	honnef.co/go/tools/staticcheck \
	github.com/golangci/golangci-lint/cmd/golangci-lint \
	github.com/rhysd/gofmtrlx \
	sourcegraph.com/sqs/goreturns \
	github.com/kisielk/errcheck \
	github.com/cweill/gotests/gotests \
	mvdan.cc/sh/cmd/shfmt \
	github.com/google/wire/cmd/wire \
	github.com/golang/protobuf/protoc-gen-go \
	github.com/nametake/protoc-gen-gohttp \

GO_MOD_TOOLS := \
	github.com/moorereason/mdfmt \

NPM_TOOLS := \
	npm \
	neovim \
	eslint \
	git-open \
	textlint \
	textlint-rule-preset-ja-technical-writing \
	textlint-filter-rule-comments \
	textlint-filter-rule-whitelist \

PIP_TOOLS := \
	pip \
	neovim \
	awscli \
	vim-vint \
	pre-commit \

.PHONY: help
help: # Refer: https://postd.cc/auto-documented-makefile/
	@echo 'usage: make [target]'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

update: brew_update go_get npm_install pip_install fish_plugin_update vim_plugin_update ## Update all tools

link: ## Create symbolic link
	./bin/ln_dotfiles.sh $(DOTFILES)

zplug: ## Install zplug
	@./bin/zplug.sh

tmp: ## Install tmux plugin manager
	@./bin/tmp.sh

brew_install: ## Install brew tools
	brew install $(PKG_MANAGER_TOOLS) $(BREW_TOOLS)

brew_update: ## Update brew tools
	brew update
	brew upgrade
	brew cleanup

go_get: ## Install go cli tools
	go get -u $(GO_TOOLS)
	./bin/gomod.sh $(GO_MOD_TOOLS)

npm_install: ## Install npm cli tools
	npm install -g $(NPM_TOOLS)

pip_install: ## Install pip tools
	pip install --upgrade $(PIP_TOOLS)
	pip3 install --upgrade $(PIP_TOOLS)

gcloud: ## Install gcloud cli tools
	@./bin/gcloud.sh

fish_plugin_update: ## Update fish plugins
	fish -c fisher

vim_plugin_update: ## Update vim plugins
	vim -c PlugUpdate -c q -c 'set filetype=go' -c GoSetup -c q
