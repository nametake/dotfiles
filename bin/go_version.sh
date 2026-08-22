#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: $(basename "$0") <version>" >&2
  exit 1
fi

version="$1"
case "${version}" in
  go*) ;;
  *) version="go${version}" ;;
esac

bindir="${GOPATH:-$(go env GOPATH)}/bin"

go install "golang.org/dl/${version}@latest"
"${bindir}/${version}" download
ln -sf "${bindir}/${version}" "${bindir}/go"
