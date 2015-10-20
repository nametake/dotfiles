#!/bin/sh
. error.fnc

# exists_command is a function to check whether the command exists.
# If command exists, return 0. 
# If command not exists, return 1. 

# ex.)
# if [ `exists_command ls` -eq 0 ];then
#   echo "ls exists"
# else
#   echo "ls not exists"
# fi

function exists_command()
{
  test $# -eq 1 || abort "exists_command argument isn't 1."

  if type $1 > /dev/null 2>&1;then
    echo 0
  else
    echo 1
  fi
}

