# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jakubmiziolek/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"
RIPGREP_CONFIG_PATH="~/.ripgreprc"
ulimit -n 10480 10480
ulimit -f unlimited


# Vim Mode
bindkey -v
export KEYTIMEOUT=1
prompt_dir() {
    prompt_segment blue $PRIMARY_FG ' %25<...<%~%<< '
}

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which lugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git brew fzf node nvm npm vi-mode)
# less plugins less startup time?!
plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting zsh-z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export CLICOLOR=1
export GIT_DIFF_OPTS=-u0
export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim

alias python='python3'
export PATH=/usr/local/bin:/Users/jakubmiziolek/dotfiles/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
alias cpa='cmus-remote --pause'
alias cmo='node ~/dotfiles/cmo.js'
alias repl='node ~/www/nodejs/repl.js'
alias vim='nvim'
alias vi='vim'
alias v='vim'
alias v.='vim .'
alias cat='bat'
alias cl='clear'
alias h='cd ~ && ls'
alias p='cd ~/www/disco'
alias re='cd ~/www/rekru-temp'
alias pb='cd ~/www/moonfare/backend'
alias pc='cd ~/www/moonfare/svc-agreements-and-consents-be'
alias pq='cd ~/www/moonfare/svc-questionnaire'
alias pf='cd ~/www/moonfare/front-client'
alias pa='cd ~/www/moonfare/admin-panel-front'
alias d='cd ~/www/jmdocs/docs && vi ../README.md *.md'
alias youtubedl='youtube-dl --format bestaudio/best --embed-thumbnail --add-metadata --extract-audio'
alias cleardocker='yes | docker system prune -a && docker rmi $(docker images -a -q) || true && yarn dc:build && docker network create swarm && yarn dc:up'
alias dockerruns='node ~/www/nodejs/docker.js'
alias hb='hub browse'
alias hpr='hub pull-request'
alias cdg='cd `git rev-parse --show-toplevel`'
alias tq='npm run test'
alias tqw='npm run test -- --watch'
alias tqf='npm run testf'
alias nrd='npm run start:dev'
alias nrdb='npm run start:debug'
alias TQ='tq'
alias Tq='tq'
alias tQ='tq'
alias ww='curl "https://wttr.in/lublin"'
alias www='curl "https://wttr.in/lublin?format=v2"'
alias matrix='cmatrix -u 1'
alias apiary='~/.gem/gems/apiaryio-0.14.0/bin/apiary preview'
alias ns='newsboat'

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
alias grm="git reset \$(git merge-base master \$(git rev-parse --abbrev-ref HEAD))"
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
alias history="history | cut -c 8- | sort -u"

# IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias br0="brightness 0"

setopt HIST_IGNORE_SPACE

# Show/hide hidden files in Finder
alias show-hidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide-hidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hide-desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show-desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
export CONNECTION_STRING=postgres://postgres:postgres@localhost:5432/EventStore
export NVM_DIR="$HOME/.nvm"

source ~/.localrc;

export GEM_HOME="$HOME/.gem"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakubmiziolek/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jakubmiziolek/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakubmiziolek/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jakubmiziolek/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/jakubmiziolek/.travis/travis.sh ] && source /Users/jakubmiziolek/.travis/travis.sh
