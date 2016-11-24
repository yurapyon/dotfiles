# TODO fix completion

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

zstyle ':completion:*' menu select
# case insesitivity- stole from stack overflo
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

SAVEHIST=99
HISTFILE=~/.zsh_history

bindkey -e

#keys
#typeset -g -A key
#bksp del
#bindkey '^?'    backward-delete-char
#bindkey '^[[3~' delete-char
# bindkey '\e\e?' backward-delete-word
# bindkey '\e\e[3~' delete-word
#home end alt-l alt-r
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '\e\e[D' beginning-of-line
bindkey '\e\e[C' end-of-line
#pgup pgdn
#bindkey '^[[5~' up-line-or-history
#bindkey '^[[6~' down-line-or-history
#u d
#bindkey '^[[A'  up-line-or-search
#bindkey '^[[B'  down-line-or-search
#l r
#bindkey '^[[D'  backward-char
#bindkey '^[[C'  forward-char
#ctrl-l ctrl-r
bindkey '\eOc'  forward-word
bindkey '\eOd'  backward-word
#ins
#bindkey '^[[2~' overwrite-mode

#NEWLINE=$'\n'

# o l d
#export PROMPT="%(?.oo%)/.%B%{%F{red}%}%?%)/%{%f%}%b) %n%{%F{magenta}%}@%{%f%}%B%{%F{yellow}%}%m%{%f%}%b. %{%F{green}%}%2~%{%f%} .: "
#PROMPT="%(?.xx%)/.%B%{%F{red}%}%?%)/%{%f%}%b) %n%{%F{magenta}%}@%{%f%}%B%{%F{yellow}%}///%{%f%}%b. %{%F{green}%}%d%{%f%} .: "

export PROMPT="%(?.oo%)/.%B%{%F{red}%}%?%)/%{%f%}%b) %B%{%F{black}%}>%{%f%}%b %{%F{green}%}%2~%{%f%} %B%{%F{black}%}>%{%f%}%b "
export RPROMPT="%{%F{magenta}%}lvl $SHLVL%{%f%}"

del-prompt-accept-line() {
    OLDPROMPT="$PROMPT"
    OLDRPROMPT="$RPROMPT"
    PROMPT="%(?.ooooooooo%)/.%B%{%F{red}%}%?%)/%{%f%}%b) %B%{%F{black}%}>%{%f%}%b %{%F{green}%}%d%{%f%} %B%{%F{black}%}>%{%f%}%b "
    RPROMPT="%{%F{green}%}> %D{%L.%M.%S}%{%f%}"
    zle reset-prompt
    PROMPT="$OLDPROMPT"
    RPROMPT="$OLDRPROMPT"
    zle accept-line
}

zle -N del-prompt-accept-line
bindkey "^M" del-prompt-accept-line

alias -g '...'='../..'
alias -g '....'='../../..'

alias ls='ls --color=auto' #normal
alias ks='ls'
alias sl='ls'

alias mnt='sudo mount'
alias umnt='sudo umount'
alias top='htop'

alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias clrram='sudo zsh -c "free && sync && echo 3 > /proc/sys/vm/drop_caches && free"'
alias clrtmp='for i in /tmp/* ; do sudo rm -r "$i" ; done'
alias clrcoredumps='sudo rm /var/lib/systemd/coredump/*'
alias conn='sudo netctl start'
alias stop='sudo netctl stop'
alias wacomtouch='~/dotfiles/scripts/touchoff.lua'

alias screenfetch+="clear && screenfetch"
alias xresc='xrdb ~/.Xresources'
alias xresc+='xrdb ~/.Xresources && urxvt'

alias -g luarocks='luarocks-5.1'

alias update='sudo pacman -Syu'
alias inst='sudo pacman -S'
alias uninst='sudo pacman -Rs'
# pacman -Rsn $(pacman -Qdtq) delete all loose makedepends

alias sxiv='sxiv -ab'
alias sxiva='(sxiv -r * &)'
alias mpva='mpv *'
alias umpv='~/documents/scripts/umpv.py' 
alias umpva='(umpv * &)'
alias audio-dl='youtube-dl --no-playlist -x'
alias video-dl='youtube-dl --no-playlist'
alias scons='scons -Q'

alias e-nvim='nvim ~/dotfiles/_config/nvim/init.vim'
alias e-zsh='nvim ~/dotfiles/zshrc'
alias e-install='nvim ~/dotfiles/install-list'

alias sx1='startx ~/dotfiles/_sessions/monsterwm'

alias @myelo='cd ~/documents/programming/c/myelocyte/src'
alias @wm='cd ~/documents/programming/c/windowmgrs'
alias @uo='cd ~/documents/programming/c/uokichi'
alias @ocaml='cd ~/documents/programming/ocaml'

#alias @lua='cd ~/documents/programming/lua'
#alias @lualib='cd /usr/share/lua/5.1'

alias -g 'xeph'='-- /usr/bin/Xephyr'

setopt nocheckjobs
#setopt correct
setopt cshjunkiequotes
setopt histignoredups

# opam
. /home/mel/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
