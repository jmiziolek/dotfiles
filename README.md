dotfiles
========

```
sh -c "`curl -fsSL https://raw.githubusercontent.com/jmiziolek/dotfiles/master/setup/remote-install.sh`"
```

# Mac OS settings
Displays -> Disable "adjusting brightness"
Energy Saving -> Disable "slightly dim display" on battary power tab
Security & Privacy -> require password immediately
Security & Privacy -> General -> Disable log out after X minutes of inactivity
Trackpad -> Point & Click -> enable tap to click

#Neovim 

`pip3 install --user neovim`
`:UpdateRemotePlugins`
`npm install -g neovim`
`gem install neovim`

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Edit `/etc/ssh/ssh_config` to stop SendEnv LANG*


Add Keyboard -> App Shortcutes -> Move to Built-in Retina Display 
Add Keyboard -> App Shortcutes -> Move to MONITOR NAME (Main Menu -> Window)
