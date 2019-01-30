export CLICOLOR=1
set -o vi

# Git branch in prompt.
parse_git_branch() {
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@mbp \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export GIT_DIFF_OPTS=-u0

export GPG_TTY=$(tty)

alias python='python3'
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
alias cpa='cmus-remote --pause'
alias cmo='node ~/dotfiles/cmo.js'
alias repl='node ~/www/nodejs/repl.js'
alias vim='nvim'
alias vi='nvim'
alias cat='bat'
alias find='fd'
alias cl='clear'
alias h='cd ~ && ls'
alias p='cd ~/www/nodus/nodus-backend'
alias pp='cd ~/www/jmdocs'
alias youtubedl='youtube-dl -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata'
alias cleardocker='yes | docker system prune -a && docker rmi $(docker images -a -q) || true && yarn dc:build && docker network create swarm && yarn dc:up'
alias dockerruns='node ~/www/nodejs/docker.js'

# Project specific
alias cdg='cd `git rev-parse --show-toplevel`'
alias nodusdb='`ssh -A -i ~/.ssh/jakubmiziolek -L 5432:terraform-20180820144344278700000001.ctzr9u47ng3c.eu-central-1.rds.amazonaws.com:5432 deploy@35.159.35.172`'
alias nodusstaging='ssh -i ~/.ssh/jakubmiziolek  deploy@35.159.35.172'
alias nodusprod='ssh -J ubuntu@18.185.157.203 ec2-user@10.226.1.110'
alias tq='node ~/www/nodejs/docker.js && cd ~/www/nodus/nodus-backend && yarn dc:run:web:test'

# GIT aliases
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
alias gd='git dsf'
#!/usr/bin/env bash

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias lsa="alder --depth 2 --exclude='.git|bower_components|node_modules' -sa"
alias org="organize -s ."

# Shortcuts
alias c='clear'
alias g="git"
alias his="history | cut -c 8- | sort -u"
alias o="open ."
alias v="vim"
alias r="ruby"
alias n="node"
alias p="python"
alias y="yarn"
alias chrome="open -a \"Google Chrome\""
# restart
alias off="sudo shutdown -r"
# lock the screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias cb="clipboard"
alias monitor="gtop"
alias gh="gh-home"
alias history="history | cut -c 8- | sort -u"

# IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show/hide hidden files in Finder
alias show-hidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide-hidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hide-desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show-desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


# Reload
alias reload="exec ${SHELL} -l"

eval "$(rbenv init -)"

mcd () {
	mkdir "$1"
	cd "$1"
}

