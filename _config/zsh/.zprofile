if [ -z "$TMUX" ]; then
  emacs --daemon &> /dev/null
  mpd &> /dev/null
  ~/dotfiles/_wm/lemons/citrus.lisp &
fi
