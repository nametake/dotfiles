#!/bin/bash
export GO111MODULE=on

for file in "$@"; do
	go install "${file}"
done
