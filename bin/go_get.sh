#!/bin/bash
export GO111MODULE=on

for file in "$@"; do
	go get "${file}"
done
