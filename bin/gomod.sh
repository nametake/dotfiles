#!/bin/bash
export GO111MODULE=on

wd=$(pwd)

for mod in ${@}; do
  cd ${GOPATH}/src/${mod}
  go mod download
  go install
done

cd ${wd}
