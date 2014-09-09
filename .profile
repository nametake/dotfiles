# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# PATH setting
#Linux
# Java
#export JAVA_HOME=/usr/lib/jvm/java-7-oracle
#export CLASSPATH=$CLASSPATH:.:/usr/share/tomcat7/lib/servlet-api.jar:/usr/share/tomcat7/lib/servlet-api.jar
# Tomcat
#export CATALINA_HOME=/usr/share/tomcat7
#export CATALINA_BASE=/var/lib/tomcat7
# Android
#export PATH=$PATH:/usr/local/adt/sdk/tools
#export PATH=$PATH:/usr/local/python-for-android/dist/default
# kivy
#export ANDROIDSDK=/usr/local/adt/sdk
#export ANDROIDNDK=/usr/local/adt/ndk-r9b
#export ANDROIDNDKVER=r9
#export ANDROIDAPI=19
#
#
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
