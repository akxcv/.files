eval "$(rbenv init -)"
export EDITOR=vim
export TERM=xterm-256color-italic
export PATH=$PATH:/Users/user_wrk

function mdcd {
  mkdir $1
  cd $1
}

source ~/.bash_private
