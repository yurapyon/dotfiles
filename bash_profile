if [ -z "$TMUX" ]; then
  export LANG='en_US.utf8'
  export EDITOR='nvim'

  export PATH=$PATH:'/home/mel/dotfiles/_wm/lemons':'/home/mel/.cargo/bin'
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'/usr/local/lib64:/usr/local/lib:/usr/lib'
  export XDG_CONFIG_HOME='/home/mel/.config'

  # export ALSA_CARD='PCH'
  export MPD_HOST='/tmp/.mpd-socket'
  export RANGER_LOAD_DEFAULT_RC='false'

  # export WINIT_HIDPI_FACTOR=1.0

  export HISTCONTROL=ignoreboth:erasedups

  [ ! -s ~/.config/mpd/pid ] && mpd &> /dev/null
  jack_control start &> /dev/null
  ~/dotfiles/_wm/lemons/citrus.ss &
fi

source ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
