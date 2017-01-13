# TODO
#   fix up completion stuff
#   make completions for jack_ctl.lua ?

# == modules ==

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# == completion ==

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# == options ==

# setopt correct
setopt no_check_jobs
setopt csh_junkie_quotes
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt no_beep
setopt append_history
setopt inc_append_history

setopt auto_pushd

SAVEHIST=100
HISTFILE=~/.zsh_history

# == keys ==

# emacs keys
bindkey -e

# bksp del
bindkey '^?'    backward-delete-char
bindkey '^[[3~' delete-char

# alt-l alt-r
bindkey '^[^[[D' beginning-of-line
bindkey '^[^[[C' end-of-line

# up down
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^P'   up-line-or-search
bindkey '^N'   down-line-or-search

# ctrl-l ctrl-r
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word

export PROMPT="%(?.oo%)/.%B%{%F{red}%}%?%)/%{%f%}%b) %B%{%F{black}%}>%{%f%}%b %{%F{green}%}%2~%{%f%} %B%{%F{black}%}>%{%f%}%b "
export RPROMPT="%{%F{magenta}%}sh$SHLVL%{%f%}"

del-prompt-accept-line() {
  OLDPROMPT="$PROMPT"
  OLDRPROMPT="$RPROMPT"
  PROMPT="%(?.ooooooooo%)/.%B%{%F{red}%}%?%)/%{%f%}%b) %B%{%F{black}%}>%{%f%}%b %{%F{green}%}%d%{%f%} %B%{%F{black}%}>%{%f%}%b "
  RPROMPT="%{%F{green}%}$(date +"%I %M %S")%{%f%}"
  zle reset-prompt
  PROMPT="$OLDPROMPT"
  RPROMPT="$OLDRPROMPT"
  zle accept-line
}

zle -N del-prompt-accept-line
bindkey "^M" del-prompt-accept-line

# == aliases ==

# defaults
alias rm='rm -I'
# alias ls='ls --color=auto'
alias top='htop'
alias mount='sudo mount'
alias umount='sudo umount'
alias sxiv='sxiv -a'
alias sxiva='sxiv -r *'
alias scons='scons -Q'
alias luajit='rlwrap luajit'
alias audio-dl='youtube-dl --no-playlist -x'
alias video-dl='youtube-dl --no-playlist'
alias -g luarocks='luarocks-5.1'

alias ls="~/documents/programming/_dld/lsc/lsc -g"

# pacman
alias inst='sudo pacman -S'
alias uninst='sudo pacman -Rs'
alias update='sudo pacman -Syu'

# login
alias sx1='startx ~/dotfiles/_sessions/monsterwm'
alias conn='sudo netctl start'
alias stop='sudo netctl stop'

# clear
alias clrram='sudo zsh -c "free && sync && echo 3 > /proc/sys/vm/drop_caches && free"'
alias clrtmp='for i in /tmp/* ; do sudo rm -r "$i" ; done'
alias clrcoredumps='sudo rm /var/lib/systemd/coredump/*'

# my scripts
alias j='rlwrap ~/dotfiles/_wm/lemons/jack_ctl.lua'
alias c='rlwrap ~/dotfiles/_wm/lemons/calc.lua'
alias touch-off='~/dotfiles/lemons/touchoff.lua'
alias csound-server='~/documents/programming/csound/server.csd'
alias love2d-server='love ~/documents/programming/lua/videos/cc_server'

# other scripts
alias umpv='~/dotfiles/_wm/scripts/umpv.py'

# oneliners
alias xresc='xrdb ~/.Xresources'
alias xresc+='xrdb ~/.Xresources && urxvt'
alias coffee='systemd-inhibit --what=handle-lid-switch cat'
alias forex_zip='rm forex.zip || true; 7za a -p"$(cat ~/.pass)" forex.zip *'
alias forex_unzip='7za x -p"$(cat ~/.pass)" -y forex.zip '
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias -g 'xeph'='-- /usr/bin/Xephyr' # make sure to follow with a display number

# edit
alias e-zsh='nvim ~/dotfiles/zshrc'
# alias e-nvim='nvim ~/dotfiles/_config/nvim/init.vim'
# alias e-install='nvim ~/dotfiles/install-list'

# goto
alias @wm='cd ~/dotfiles/_wm'
alias @myelo='cd ~/documents/programming/c/myelocyte/src'
alias @laura='cd ~/documents/programming/c/laura-rola'
alias @csound='cd ~/documents/programming/csound'

# laziness
alias r='ranger'
alias am='alsamixer'
alias ks='ls'
alias sl='ls'
alias lj='luajit'
alias mpcp='mpc playlist'
alias platformio='pio'

# == functions ==

# mkdir and cd
function md() {
  mkdir -p "$1" && cd "$1"
}

# opam
. /home/mel/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
