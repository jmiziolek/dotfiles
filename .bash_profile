[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
fi

export EDITOR=nvim

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/jakub/www/nodus/nodus-backend/src/app/lambda/aws/node_modules/tabtab/.completions/serverless.bash ] && . /Users/jakub/www/nodus/nodus-backend/src/app/lambda/aws/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/jakub/www/nodus/nodus-backend/src/app/lambda/aws/node_modules/tabtab/.completions/sls.bash ] && . /Users/jakub/www/nodus/nodus-backend/src/app/lambda/aws/node_modules/tabtab/.completions/sls.bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakubmiziolek/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jakubmiziolek/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakubmiziolek/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jakubmiziolek/Downloads/google-cloud-sdk/completion.bash.inc'; fi
