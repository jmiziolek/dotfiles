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

brew install --cask google-chrome
brew install --cask vlc
brew install --cask iterm2
brew install --cask the-unarchiver
brew install --cask postman
brew install --cask visual-studio-code
brew install --cask ngrok
brew install --cask --no-quarantine stretchly
brew install atomicparsley
brew install zsh-completion
brew install bat
brew install bash
brew install cmake
brew install cmatrix
brew install cmus
brew install ctags
brew install fd
brew install findutils
brew install ffmpeg
brew install fzf
brew install git
brew install git-crypt
brew install git-delta
brew install git-extras
brew install gnupg
brew install htop
brew install httpie
brew install hub
brew install jq
brew install java11
brew install moreutils
brew install neovim
brew install node
brew install prettyping
brew install ranger
brew install rlwrap
brew install ripgrep
brew install tig
brew install tree
brew install wine
brew install yamllint
brew install yarn
brew install yt-dlp

# Install npm modules
paragraph 'NPM modules'
npm install -g clipboard-cli eslint prettier npx concurrently esformatter diff-so-fancy http-server js-beautify jsfmt json-diff jsontool livedown markdown-preview n node-gyp nodemon npm npm-check-updates @nestjs/cli

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Cleanup after installation
paragraph 'Clean up'
brew cleanup

# Create Symlink
paragraph 'Symlinks'

ln -svf ~/.dotfiles/.bash_profile ~/.bash_profile
ln -svf ~./dotfiles/.zshrc ~./.zshrc
ln -svf ~/dotfiles/.gitconfig ~/.gitconfig
ln -svf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -svf ~/dotfiles/.newsboaturls ~/.newsboat/urls

# Zsh
paragraph 'Zsh Plugins'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
