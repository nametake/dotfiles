set -x PATH /opt/local/sbin /opt/local/bin /opt/sbin /opt/bin /usr/local/opt /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

if test -d $HOME/.local/bin
  set -x PATH $HOME/.local/bin $PATH
end

if test -d $HOME/go
  set -x GOPATH $HOME/go
  set -x PATH $GOPATH/bin $PATH
end
