#!/bin/bash
set -euo pipefail

if [ $# -eq 0 ]; then
  echo "usage: $(basename "$0") <version>..." >&2
  exit 1
fi

bindir="${GOPATH:-$(go env GOPATH)}/bin"
current=""
if [ -L "${bindir}/go" ]; then
  current=$(basename "$(readlink "${bindir}/go")")
fi

versions=()
for version in "$@"; do
  case "${version}" in
    go*) ;;
    *) version="go${version}" ;;
  esac
  if [ "${version}" = "${current}" ]; then
    echo "$(basename "$0"): ${version} is currently linked" >&2
    exit 1
  fi
  versions+=("${version}")
done

for version in "${versions[@]}"; do
  rm -f "${bindir}/${version}"
  rm -rf "${HOME}/sdk/${version}"
done
