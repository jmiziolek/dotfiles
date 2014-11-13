# Git branch in prompt.
source ~/.profile

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


export SENCHA_CMD_3_0_0="/Users/miziolej/bin/Sencha/Cmd/3.1.2.342"


export PATH=/Users/miziolej/bin/Sencha/Cmd/3.1.2.342:$PATH

eval "$(rbenv init -)"
