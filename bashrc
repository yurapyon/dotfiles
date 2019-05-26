alias pacman='sudo pacman'
alias mount='sudo mount'
alias umount='sudo umount'

alias rm='rm -I'

alias _ls='ls -1NLv --group-directories-first --color=auto'
# alias ls='printf "\e[1;32;7m%s\e[0m\n" $(pwd); _ls'
alias ls='_ls'
export LS_COLORS='di=1;34:fi=39:ow=1;34:ex=39'

alias e=$EDITOR
alias pdf='zathura'
alias am='alsamixer'
alias top='htop'

alias hddsleep='sudo hdparm -Y'
alias hds='hddsleep /dev/sdb'

alias sbcl='rlwrap sbcl'

alias sxiv='sxiv -a'
alias ydl='youtube-dl --no-playlist'
alias conn='sudo netctl stop-all; sudo netctl start'
alias mpcclip='mpc -f "%artist% %title%" | head -1 | xclip -i -selection clipboard'

export PS1='\[\e[95m\]$(pwd | home 2)\[\e[0m\] '

alias sx1='startx ~/dotfiles/_wm/sessions/spectrwm'

alias @uo='cd /home/mel/documents/_programming/lisp/uokichi/src'
alias @lyza='cd /home/mel/documents/_programming/lisp/lyza/src'
alias @maru='cd /home/mel/documents/_programming/c/maru/src'
alias @wm='cd /home/mel/dotfiles/_wm'

alias gpom='git push origin master'
