export LANG='en_US.utf8'
export EDITOR='nvim'

export PATH=$PATH:'/home/mel/dotfiles/_wm/lemons'
export LD_LIBRARY_PATH='/usr/local/lib64:/usr/lib'
export XDG_CONFIG_HOME='/home/mel/.config'

export ALSA_CARD='Generic'
export MPD_HOST='/home/mel/.mpd-socket'
export RANGER_LOAD_DEFAULT_RC='false'

source ~/.bashrc

if [ -z "$TMUX" ]; then
  [ ! -s ~/.config/mpd/pid ] && mpd &> /dev/null
  jack_control start &> /dev/null
  ~/dotfiles/_wm/lemons/citrus.lisp &
fi
