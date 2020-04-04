[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
fi

export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakubmiziolek/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jakubmiziolek/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakubmiziolek/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jakubmiziolek/Downloads/google-cloud-sdk/completion.bash.inc'; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
