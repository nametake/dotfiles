NAME:={{_expr_:expand('%:p:h:t')}}

install: ## Install binary in GOPATH ## make install
	@go install ./...

uninstall: ## Uninstall binary from GOPATH ## make uninstall 
	@rm -f ${GOPATH}/bin/$(NAME)

build: clean ## Build binaries for multiple env ## make build
	@GOOS=windows GOARCH=amd64 go build -o ./build/windows-amd64/$(NAME).exe # windows
	@GOOS=darwin  GOARCH=amd64 go build -o ./build/darwin-amd64/$(NAME) # macOS
	@GOOS=darwin  GOARCH=arm64 go build -o ./build/darwin-arm64/$(NAME) # macOS for mac
	@GOOS=linux  GOARCH=amd64 go build -o ./build/linux-amd64/$(NAME) # Linux

clean: ## Clean build files ## make clean
	@rm -rf build
