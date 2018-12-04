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
alias cleardocker='yes | docker system prune -a && docker rmi $(docker images -a -q) || true && yarn dc:build && docker network create swarm && yarn dc:up'
# Project specific
alias nodusdb='`ssh -A -i ~/.ssh/jakubmiziolek -L 5432:terraform-20180820144344278700000001.ctzr9u47ng3c.eu-central-1.rds.amazonaws.com:5432 deploy@35.159.35.172`'
alias nodusstaging='ssh -i ~/.ssh/jakubmiziolek  deploy@35.159.35.172'
alias tq='cd ~/www/nodus/nodus-backend && yarn dc:run:web:test'

# GIT aliases
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
alias gd='git dsf'

eval "$(rbenv init -)"

mcd () {
	mkdir "$1"
	cd "$1"
}

export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
