#!/bin/sh
. error.fnc

# exists_command is a function to check whether the command exists.

# ex.)
# exists_command ls
# exists_command npm

function exists_command()
{
  test $# -eq 1 || abort "exists_command argument isn't 1."

  if type $1 > /dev/null 2>&1;then
    :
  else
    abort "${1} is not found."
  fi
}

