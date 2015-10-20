#!/bin/sh

if [ -x `which go` ]; then
  go get github.com/nsf/gocode
  go get github.com/peco/peco/cmd/peco
else
  echo "go not found."
fi
