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

# Create Symlink
paragraph 'Symlinks'

ln -svf ~/.dotfiles/.bash_profile ~/.bash_profile
ln -svf ~/.dotfiles/.bashrc ~/.bashrc
ln -svf ~/.dotfiles/.gitconfig ~/.gitconfig
source ~/.bash_profile

# Install xcode
paragraph 'XCode'
xcode-select --install

# Install brew and cask
paragraph 'Brew and Cask'

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install cask
brew update
brew upgrade

# Install node
paragraph 'Node.js and NVM'
brew install nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
nvm install stable
source ~/.bash_profile

# Install apps
paragraph 'Homebrew apps'

brew cask install vlc
brew cask install iterm2
brew cask install the-unarchiver
brew cask install smcfancontrol
brew cask install java
brew cask install github
brew cask install postman

brew install atomicparsley
brew install bash-completion
brew install bat
brew install cmake
brew install cmatrix
brew install cmus
brew install ctags
brew install fd
brew install ffmpeg
brew install fzf
brew install git
brew install git
brew install git-crypt
brew install git-extras
brew install gnupg
brew install htop
brew install httpie
brew install hub
brew install jq
brew install moreutils
brew install neovim
brew install node
brew install prettyping
brew install ranger
brew install rbenv
brew install redis
brew install rlwrap
brew install the_silver_searcher
brew install tig
brew install tree
brew install w3m
brew install wine
brew install yamllint
brew install yarn
brew install youtube-dl

# Install npm modules
paragraph 'NPM modules'

npm install -g clipboard-cli # https://github.com/sindresorhus/clipboard-cli
npm install -g gtop                 # https://github.com/aksakalli/gtop
npm install -g gh-home            # https://github.com/sindresorhus/gh-home
npm install -g eslint
npm install -g prettier
npm install -g npx
npm install -g serverless

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Cleanup after installation
paragraph 'Clean up'
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
