set -e

#
export LANG=en_US.utf8
export EDITOR='nvim'

#
export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
export XDG_CONFIG_HOME=~/.config

#
export ALSA_CARD=Generic

#
export RANGER_LOAD_DEFAULT_RC=false
export _JAVA_AWT_WM_NONREPARENTING=1

export LD_LIBRARY_PATH=/usr/local/lib64:/usr/lib
