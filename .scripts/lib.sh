#!/bin/sh

function error()
{
   echo "ERROR: $@" 1>&2
}

function abort()
{
   echo "ABORT: $@" 1>&2
   exit 1
}

function exists_command()
{
  test $# -eq 1 || abort "exists_command argument isn't 1."

  if type $1 > /dev/null 2>&1;then
    echo 0
  else
    echo 1
  fi
}

