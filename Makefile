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
	config/tmux \
	vimrc \
	vim \
	config/nvim \
	gitconfig \
	gitignore \
	git_template \
	asdfrc \
	tool-versions \
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
	python3 \
	peco \
	ghq \
	jq \
	hub \
	yamllint \
	hadolint \
	hugo \

BREW_TOOLS := \
	the_silver_searcher \
	golangci/tap/golangci-lint \

GO_TOOLS := \
	golang.org/x/tools/cmd/goimports@latest \
	mvdan.cc/gofumpt@latest \
	golang.org/x/tools/gopls@latest \
	github.com/mattn/efm-langserver@latest \
	golang.org/x/lint/golint@latest \
	github.com/rhysd/gofmtrlx@latest \
	sourcegraph.com/sqs/goreturns@latest \
	github.com/kisielk/errcheck@latest \
	github.com/cweill/gotests/gotests@latest \
	mvdan.cc/sh/cmd/shfmt@latest \
	github.com/jackc/sqlfmt/...@latest \
	github.com/golang/protobuf/protoc-gen-go@latest \
	github.com/nametake/protoc-gen-gohttp@latest \
	github.com/cespare/reflex@latest \
	github.com/google/wire/cmd/wire@latest \

NPM_TOOLS := \
	neovim \
	eslint \
	fixjson \
	remark-cli \
	remark-preset-lint-consistent \
	remark-preset-lint-markdown-style-guide \
	remark-preset-lint-recommended \
	remark-lint-maximum-line-length \
	remark-lint-ordered-list-marker-value \
	remark-lint-list-item-spacing \
	remark-lint-list-item-indent \
	remark-lint-code-block-style \
	remark-frontmatter \
	textlint \
	textlint-rule-preset-ja-technical-writing \
	textlint-filter-rule-comments \
	textlint-filter-rule-whitelist \
	diagnostic-languageserver \

PIP_TOOLS := \
	pip \
	pynvim \
	git+https://github.com/Vimjas/vint.git@master \
	git+https://github.com/pre-commit/pre-commit.git@main \

.PHONY: help
help: # Refer: https://postd.cc/auto-documented-makefile/
	@echo 'usage: make [target]'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

update: brew_update go_install rustup_update npm_install pip_install fish_plugin_update vim_plugin_update nvim_plugin_update## Update all tools

link: ## Create symbolic link
	./bin/ln_dotfiles.sh $(DOTFILES)

install: zplug tmp asdf

zplug: ## Install zplug
	@./bin/zplug.sh

tmp: ## Install tmux plugin manager
	@./bin/tmp.sh

asdf: ## INstall asdf
	@git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	@cd ~/.asdf
	@git checkout "$(git describe --abbrev=0 --tags)"
	@mkdir -p ~/.config/fish/completions
	@cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

brew_install: ## Install brew tools
	brew install $(PKG_MANAGER_TOOLS) $(BREW_TOOLS)

brew_update: ## Update brew tools
	brew update
	brew upgrade
	brew cleanup

go_install: ## Install go cli tools
	@./bin/go_install.sh $(GO_TOOLS)

rustup_update:
	rustup update

npm_install: ## Install npm cli tools
	npm install -g $(NPM_TOOLS)

pip_install: ## Install pip tools
	# pip install --upgrade $(PIP_TOOLS)
	pip3 install --upgrade $(PIP_TOOLS)

gcloud: ## Install gcloud cli tools
	@./bin/gcloud.sh

fish_plugin_update: ## Update fish plugins
	fish -c 'fisher update'

vim_plugin_update: ## Update vim plugins
	vim -c PlugUpdate -c PlugUpgrade -c q -c q

nvim_plugin_update: ## Update neovim plugins
	nvim -c PlugUpdate -c PlugUpgrade -c q -c TSUpdateSync -c q

fmt_coc_settings:
	fixjson ./vim/coc-settings.json && cat ./vim/coc-settings.json | jq '.' --sort-keys | sponge ./vim/coc-settings.json
