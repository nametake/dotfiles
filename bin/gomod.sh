#!/bin/bash
export GO111MODULE=on

wd=$(pwd)

for mod in "${@}"; do
	cd "${GOPATH}/src/${mod}" || exit
	git pull
	go mod download
	go install
done

cd "${wd}" || exit
