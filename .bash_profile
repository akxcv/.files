eval "$(rbenv init -)"
eval `opam config env`
export EDITOR=vim
export TERM=xterm-256color-italic
export PATH=$PATH:/Users/user_wrk
export GOPATH=/Users/akxcv/go

function mdcd {
  mkdir $1
  cd $1
}

source ~/.bash_private
