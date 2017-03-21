eval "$(rbenv init -)"
export EDITOR=vim
export TERM=xterm-256color-italic

function mdcd {
  mkdir $1
  cd $1
}

source ~/.bash_private
