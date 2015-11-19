# Git branch in prompt.
source ~/.profile

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


alias macvim='DYLD_FORCE_FLAT_NAMESPACE=1 /Applications/MacVim.app/Content/MacOS/vim'
eval "$(rbenv init -)"

export PATH=/usr/local/bin:$PATH
