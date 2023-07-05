#!/bin/sh
function paragraph() {
  echo "\033[0;32m"
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  echo " ?" $@
  printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  echo "\033[0m"
  sleep 1
}

echo ".dotfiles installation"
read -p "Press any key to continue..." -n1 -s
echo '\n'

echo "\033[0;33m?? You need to login as sudo first \033[0m"
sudo -v

# Check if running on OSX
if [ "$(uname)" != "Darwin" ]; then
  echo 'Script works only for OSX';
  exit 1;
fi


# Install xcode
paragraph 'XCode'
xcode-select --install

# Install brew and cask
paragraph 'Brew and Cask'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install cask
brew update
brew upgrade

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


brew install cask
brew update
brew upgrade

export HOMEBREW_NO_INSTALL_CLEANUP=true

# Install apps
paragraph 'Homebrew apps'

brew install --cask --no-quarantine 1password
brew install --cask --no-quarantine google-chrome
brew install --cask --no-quarantine imageoptim
brew install --cask --no-quarantine iterm2
brew install --cask --no-quarantine ngrok
brew install --cask --no-quarantine postman
brew install --cask --no-quarantine stretchly
brew install --cask --no-quarantine the-unarchiver
brew install --cask --no-quarantine visual-studio-code
brew install --cask --no-quarantine vlc
brew install atomicparsley
brew install awscli
brew install bash
brew install bat
brew install cmake
brew install cmatrix
brew install cmus
brew install ctags
brew install deno
brew install fd
brew install ffmpeg
brew install findutils
brew install fzf
brew install gh
brew install git
brew install git-crypt
brew install git-delta
brew install git-extras
brew install gnupg
brew install go
brew install htop
brew install httpie
brew install java11
brew install jq
brew install lazygit
brew install moreutils
brew install neovim
brew install node
brew install prettyping
brew install python
brew install ranger
brew install ripgrep
brew install rlwrap
brew install tig
brew install tree
brew install wine
brew install yamllint
brew install yarn
brew install yt-dlp
brew install zsh-completion

# Install npm modules
paragraph 'NPM modules'
npm install -g typescript clipboard-cli eslint prettier @fsouza/prettierd npx concurrently esformatter diff-so-fancy http-server js-beautify jsfmt json-diff jsontool livedown markdown-preview n node-gyp nodemon npm-check-updates @nestjs/cli

# Install python neovim
pip3 install --upgrade neovim

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Cleanup after installation
paragraph 'Clean up'
brew cleanup

# Create Symlink
paragraph 'Symlinks'

ln -svf ~/dotfiles/.bash_profile ~/.bash_profile
ln -svf ~/dotfiles/.zshrc ~/.zshrc
ln -svf ~/dotfiles/.gitconfig ~/.gitconfig
ln -svf ~/dotfiles/init.lua ~/.config/nvim/init.lua
ln -svf ~/dotfiles/.newsboaturls ~/.newsboat/urls

# Zsh
paragraph 'Zsh Plugins'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
