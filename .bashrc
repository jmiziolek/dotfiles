set -o vi
export CLICOLOR=1
export GIT_DIFF_OPTS=-u0
export GPG_TTY=$(tty)
git_branch() {
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@mbp \W\[\033[32m\]\$(git_branch)\[\033[00m\] $ "
# [\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\


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
alias v='nvim'
alias v.='nvim .'
alias cat='bat'
alias find='fd'
alias cl='clear'
alias h='cd ~ && ls'
alias p='cd ~/www/nodus/nodus-backend'
alias d='cd ~/www/jmdocs'
alias youtubedl='youtube-dl -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata'
alias cleardocker='yes | docker system prune -a && docker rmi $(docker images -a -q) || true && yarn dc:build && docker network create swarm && yarn dc:up'
alias dockerruns='node ~/www/nodejs/docker.js'
alias cdg='cd `git rev-parse --show-toplevel`'
alias tq='node ~/www/nodejs/docker.js && cd ~/www/nodus/nodus-backend && yarn dc:run:web:test || true && node ~/www/nodejs/docker.js'
alias TQ='tq'
alias Tq='tq'
alias tQ='tq'

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
alias n="node"
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

source ~/.localrc;


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/jakub/www/nodus/nodus-backend/lambda/node_modules/tabtab/.completions/serverless.bash ] && . /Users/jakub/www/nodus/nodus-backend/lambda/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/jakub/www/nodus/nodus-backend/lambda/node_modules/tabtab/.completions/sls.bash ] && . /Users/jakub/www/nodus/nodus-backend/lambda/node_modules/tabtab/.completions/sls.bash