source ~/.profile
export CLICOLOR=1
set -o vi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export GIT_DIFF_OPTS=-u0

# git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
alias cpa='cmus-remote --pause'
alias repl='node ~/www/nodejs/repl.js'
alias vim='nvim'
alias vi='nvim'
alias cat='bat'
alias find='fd'
alias cl='clear'
alias cmo='node cmo.js'
alias python='python3'
alias cdg='cd `git rev-parse --show-toplevel`'
alias youtubedl='youtube-dl -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata'

eval "$(rbenv init -)"

mcd () {
  mkdir "$1"
  cd "$1"
}

export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
