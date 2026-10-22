# path_helper in /etc/zprofile moves the directories listed in /etc/paths and
# /etc/paths.d, such as /usr/bin, in front of the PATH built in zshenv.
# Put the zshenv order back in front so that Homebrew takes precedence.
path=(${zshenv_path} ${path})
