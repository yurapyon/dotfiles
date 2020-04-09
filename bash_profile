if [ -z "$TMUX" ]; then
  export LANG='en_US.utf8'
  export EDITOR='nvim'

  export PATH=$PATH:'/home/mel/dotfiles/_wm/lemons'
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'/usr/local/lib64:/usr/local/lib:/usr/lib'
  export XDG_CONFIG_HOME='/home/mel/.config'

  # export ALSA_CARD='Generic'
  export MPD_HOST='/tmp/.mpd-socket'
  export RANGER_LOAD_DEFAULT_RC='false'

  # export WINIT_HIDPI_FACTOR=1.0

  export HISTCONTROL=ignoreboth:erasedups

  [ ! -s ~/.config/mpd/pid ] && mpd &> /dev/null
  jack_control start &> /dev/null
  ~/dotfiles/_wm/lemons/citrus.lisp &
fi

source ~/.bashrc
