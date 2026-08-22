#!/bin/bash
set -euo pipefail

if [ $# -ne 0 ]; then
  echo "usage: $(basename "$0")" >&2
  exit 1
fi

bindir="${GOPATH:-$(go env GOPATH)}/bin"
sdkdir="${HOME}/sdk"

current=""
if [ -L "${bindir}/go" ]; then
  current=$(basename "$(readlink "${bindir}/go")")
fi

if [ ! -d "${sdkdir}" ]; then
  exit 0
fi

for dir in $(find "${sdkdir}" -maxdepth 1 -mindepth 1 -type d -name 'go*' -exec basename {} \; | sort -V); do
  if [ "${dir}" = "${current}" ]; then
    echo "* ${dir}"
  else
    echo "  ${dir}"
  fi
done
