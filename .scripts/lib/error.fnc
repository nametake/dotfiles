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

