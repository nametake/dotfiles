#!/bin/sh

if [ -x `which npm` ]; then
  # grunt
  npm install -g grunt-init
  git clone https://github.com/gruntjs/grunt-init-jquery.git ~/.grunt-init/jquery
  git clone https://github.com/nosami/grunt-init-csharpsolution.git ~/.grunt-init/csharpsolution
else
  echo "npm not found."
fi
