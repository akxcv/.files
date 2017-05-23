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

# be kind when using sudo!
function sudo() {
  if [ ! -z $1 ] && [ $1 == "pls" ]; then
    command sudo ${@:2}
  else
    fortune -e | cowsay -b | lolcat
  fi
}

# Musk is like sudo, only better
alias elon='sudo '

# That's what it is, essentially
alias wtf='git blame'

# how about x = command x
function how() {
  if [ ! -z $1 ] && [ $1 == "about" ]; then
    command $2 ${@:3}
  else
    command how ${@:2}
  fi
}

source ~/.bash_private
