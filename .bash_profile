source ~/.profile
export CLICOLOR=1

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias cpa='cmus-remote --pause'
alias repl='node ~/www/nodejs/repl.js'
alias ssp='ssh peachdev'
alias vim='nvim'
eval "$(rbenv init -)"

mcd () {
  mkdir "$1"
  cd "$1"
}

export PATH=/usr/local/bin:$PATH
