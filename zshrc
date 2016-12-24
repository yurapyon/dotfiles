autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# setopt correct
setopt no_check_jobs
setopt csh_junkie_quotes
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt no_beep
setopt append_history
setopt inc_append_history

setopt auto_pushd

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

SAVEHIST=99
HISTFILE=~/.zsh_history

bindkey -e

# keys
# typeset -g -A key
# bksp del
# bindkey '^?'    backward-delete-char
# bindkey '^[[3~' delete-char
# bindkey '\e\e?' backward-delete-word
# bindkey '\e\e[3~' delete-word
# home end alt-l alt-r
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '\e\e[D' beginning-of-line
bindkey '\e\e[C' end-of-line
# pgup pgdn
# bindkey '^[[5~' up-line-or-history
# bindkey '^[[6~' down-line-or-history
# u d
bindkey '^[[A'  up-line-or-search
bindkey '^[[B'  down-line-or-search
# l r
# bindkey '^[[D'  backward-char
# bindkey '^[[C'  forward-char
# ctrl-l ctrl-r
bindkey '\eOc'  forward-word
bindkey '\eOd'  backward-word
# ins
# bindkey '^[[2~' overwrite-mode

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

alias rm='rm -I'
alias ls='ls --color=auto'
alias ks='ls'
alias sl='ls'

alias j='rlwrap ~/dotfiles/_wm/lemons/jack_ctl.lua'
alias c='rlwrap ~/dotfiles/_wm/lemons/calc.lua'
alias r='ranger'
alias am='alsamixer'
alias lj='luajit'
alias mpcp='mpc playlist'

alias coffee='systemd-inhibit --what=handle-lid-switch cat'

alias update='sudo pacman -Syu'
alias inst='sudo pacman -S'
alias uninst='sudo pacman -Rs'

alias mnt='sudo mount'
alias umnt='sudo umount'
alias top='htop'
alias conn='sudo netctl start'
alias stop='sudo netctl stop'

alias clrram='sudo zsh -c "free && sync && echo 3 > /proc/sys/vm/drop_caches && free"'
alias clrtmp='for i in /tmp/* ; do sudo rm -r "$i" ; done'
alias clrcoredumps='sudo rm /var/lib/systemd/coredump/*'

alias touch-off='~/dotfiles/lemons/touchoff.lua'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias csound-server='~/documents/programming/csound/server.csd'

alias xresc='xrdb ~/.Xresources'
alias xresc+='xrdb ~/.Xresources && urxvt'

alias -g luarocks='luarocks-5.1'
alias luajit='rlwrap luajit'

alias sxiv='sxiv -a'
alias sxiva='(sxiv -r * &)'
alias umpv='~/dotfiles/_wm/scripts/umpv.py' 
alias audio-dl='youtube-dl --no-playlist -x'
alias video-dl='youtube-dl --no-playlist'
alias scons='scons -Q'

alias e-nvim='nvim ~/dotfiles/_config/nvim/init.vim'
alias e-zsh='nvim ~/dotfiles/zshrc'
alias e-install='nvim ~/dotfiles/install-list'

alias sx1='startx ~/dotfiles/_sessions/monsterwm'

alias @wm='cd ~/dotfiles/_wm'
alias @myelo='cd ~/documents/programming/c/myelocyte/src'
alias @csound='cd ~/documents/programming/csound'
alias @laura='cd ~/documents/programming/c/laura-rola'

alias -g 'xeph'='-- /usr/bin/Xephyr'

alias forex_zip='rm forex.zip || true; 7za a -p"$(cat ~/.pass)" forex.zip *'
alias forex_unzip='7za x -p"$(cat ~/.pass)" -y forex.zip '

# mkdir+cd
function md() {
	mkdir -p "$1" && cd "$1"
}

# opam
. /home/mel/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
