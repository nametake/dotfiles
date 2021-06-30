package main

import (
	"context"
	"log"
)

func main() {
	if err := run(context.Background()); err != nil {
		log.Fatal(err)
	}
}

func run(ctx context.Context) error {
	{{_cursor_}}
	return nil
}
