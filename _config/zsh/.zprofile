if [ -z "$TMUX" ]; then
  mpd &> /dev/null &
  ~/dotfiles/_wm/lemons/citrus.lisp &
fi
