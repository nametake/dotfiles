test: ## Run test all package ## mkae test
	@go test ./...

fmt: ## Format all Go file ## make fmt
	@go fmt $$(go list ./... | grep -v /vendor/)

vet: ## Run go vet all files ## make vet
	@go vet $$(go list ./... | grep -v /vendor/)
