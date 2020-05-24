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
	config/yamllint \
	config/efm-langserver \
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
	remarkrc \
	textlintrc \

PKG_MANAGER_TOOLS := \
	grep \
	gawk \
	gzip \
	gnu-tar \
	gnu-sed \
	gnu-time \
	gnu-getopt \
	moreutils \
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
	hadolint \
	create-react-app \
	hugo \

BREW_TOOLS := \
	the_silver_searcher \
	golangci/tap/golangci-lint \

GO_TOOLS := \
	golang.org/x/tools/cmd/goimports \
	golang.org/x/tools/gopls \
	github.com/sourcegraph/go-langserver \
	github.com/mattn/efm-langserver \
	honnef.co/go/tools/staticcheck \
	golang.org/x/lint/golint \
	github.com/rhysd/gofmtrlx \
	sourcegraph.com/sqs/goreturns \
	github.com/kisielk/errcheck \
	github.com/cweill/gotests/gotests \
	mvdan.cc/sh/cmd/shfmt \
	github.com/jackc/sqlfmt/... \
	github.com/mrtazz/checkmake \
	github.com/xo/xo \
	github.com/k0kubun/sqldef/cmd/... \
	github.com/golang/protobuf/protoc-gen-go \
	github.com/nametake/protoc-gen-gohttp \
	github.com/cespare/reflex \
	github.com/google/wire/cmd/wire \

NPM_TOOLS := \
	neovim \
	eslint \
	git-open \
	fixjson \
	remark-cli \
	remark-preset-lint-consistent \
	remark-preset-lint-markdown-style-guide \
	remark-preset-lint-recommended \
	remark-lint-maximum-line-length \
	remark-lint-ordered-list-marker-value \
	remark-lint-list-item-spacing \
	remark-lint-list-item-indent \
	remark-frontmatter \
	textlint \
	textlint-rule-preset-ja-technical-writing \
	textlint-filter-rule-comments \
	textlint-filter-rule-whitelist \
	diagnostic-languageserver \

PIP_TOOLS := \
	pip \
	neovim \
	awscli \
	git+https://github.com/Vimjas/vint.git@master \
	git+https://github.com/pre-commit/pre-commit.git@master \
	pathlib \

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
	@export GO111MODULE=on; go get -u $(GO_TOOLS)

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
	vim -c PlugUpdate -c PlugUpgrade -c q -c 'set filetype=go' -c GoSetup -c q

fmt_coc_settings:
	fixjson ./vim/coc-settings.json && cat ./vim/coc-settings.json | jq '.' --sort-keys | sponge ./vim/coc-settings.json
